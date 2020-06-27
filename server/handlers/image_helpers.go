package handlers

import (
	"errors"
	"image"
	_ "image/gif"
	_ "image/jpeg"
	_ "image/png"
	"io"
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

func GetImageInfo(imageUrl string) (int, int, string, multipart.File) {

	resp, err := http.Get(imageUrl)
	if err != nil {
		logs.Error("%v", err)
		return 0, 0, "", nil
	}
	defer resp.Body.Close()

	m, format, err := image.Decode(resp.Body)
	if err != nil {
		logs.Error("image: unknown format")
		return 0, 0, "", nil
	}
	g := m.Bounds()

	height := g.Dy()
	width := g.Dx()

	file, err := os.Create("save." + format)
	if err != nil {
		logs.Error("%v", err)
		return 0, 0, "", nil
	}

	_, err = io.Copy(file, resp.Body)
	if err != nil {
		logs.Error("%v", err)
		return 0, 0, "", nil
	}

	return height, width, format, file
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
