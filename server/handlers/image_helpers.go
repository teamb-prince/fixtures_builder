package handlers

import (
	"errors"
	"image"
	"image/gif"
	_ "image/gif"
	"image/jpeg"
	_ "image/jpeg"
	"image/png"
	_ "image/png"
	"mime/multipart"
	"os"

	"net/http"
	"net/url"

	"github.com/PuerkitoBio/goquery"
	uuid "github.com/satori/go.uuid"
	"github.com/teamb-prince/fixtures_builder/api/awsmanager"
	"github.com/teamb-prince/fixtures_builder/logs"
)

var getTitleError = errors.New("Faild get title from url")
var getImageError = errors.New("Faild get image from url")
var uploadImageError = errors.New("Faild upload image (S3)")

var imagePath = "images/save."

func GetImageInfo(imageUrl string) (int, int, string, string) {

	resp, err := http.Get(imageUrl)
	if err != nil {
		logs.Error("%v", err)
		return 0, 0, "", ""
	}
	defer resp.Body.Close()

	img, format, err := image.Decode(resp.Body)
	if err != nil {
		logs.Error("image: unknown format")
		return 0, 0, "", ""
	}
	g := img.Bounds()

	height := g.Dy()
	width := g.Dx()

	path := imagePath + format

	file, err := os.Create(path)
	if err != nil {
		logs.Error("%v", err)
		return 0, 0, "", ""
	}

	defer file.Close()

	if format == "jpg" {
		format = "jpeg"
	}

	switch format {
	case "png":
		err = png.Encode(file, img)
		if err != nil {
			logs.Error("%v", err)
			return 0, 0, "", ""
		}
	case "jpeg":
		opt := jpeg.Options{
			Quality: 90,
		}
		err = jpeg.Encode(file, img, &opt)
		if err != nil {
			logs.Error("%v", err)
			return 0, 0, "", ""
		}
	case "gif":

		opt := gif.Options{
			NumColors: 256,
			// Add more parameters as needed
		}

		err = gif.Encode(file, img, &opt)
		if err != nil {
			logs.Error("%v", err)
			return 0, 0, "", ""
		}
	}

	/*
		_, err = io.Copy(file, resp.Body)
		if err != nil {
			logs.Error("%v", err)
			return 0, 0, "", ""
		}*/

	return height, width, format, path
}

func GetTitle(res *http.Response) (string, error) {
	doc, err := goquery.NewDocumentFromReader(res.Body)
	if err != nil {
		logs.Error("%v", err)
		return "", getTitleError
	}

	var title string

	doc.Find("head").Each(func(i int, s *goquery.Selection) {
		title = s.Find("title").Text()
	})
	return title, nil

}

func GetImages(baseURL string, res *http.Response) ([]string, error) {

	doc, err := goquery.NewDocumentFromReader(res.Body)

	if err != nil {
		logs.Error("%v", err)
		return nil, getImageError
	}

	var result []string = make([]string, 0)

	doc.Find("img").Each(func(_ int, s *goquery.Selection) {
		imageURL, _ := s.Attr("src")
		absImageURL := toAbsUrl(baseURL, imageURL)

		result = append(result, absImageURL)

	})
	return result, nil
}

func UploadImage(s3 *awsmanager.S3Manager, file multipart.File, category string, format string) (string, error) {

	filename := uuid.NewV4().String()

	url, err := s3.Upload(file, filename, category, format)
	if err != nil {
		logs.Error("%v", err)
		return "", uploadImageError
	}

	return url, err

}

func toAbsUrl(baseURLStr string, weburl string) string {
	baseurl, _ := url.Parse(baseURLStr)
	relurl, err := url.Parse(weburl)
	if relurl.Scheme != "" {
		logs.Error("%v", err)
		return weburl
	}
	if err != nil {
		return ""
	}
	absurl := baseurl.ResolveReference(relurl)
	return absurl.String()
}
