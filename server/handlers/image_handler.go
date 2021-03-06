package handlers

import (
	"encoding/json"
	"net/http"
	"os"
	"time"

	uuid "github.com/satori/go.uuid"
	"github.com/teamb-prince/fixtures_builder/api/awsmanager"
	"github.com/teamb-prince/fixtures_builder/logs"
	"github.com/teamb-prince/fixtures_builder/models/db"
	"github.com/teamb-prince/fixtures_builder/models/view"
)

func ImageHandler(data db.DataStorage, s3 awsmanager.S3Manager) func(http.ResponseWriter, *http.Request) {
	return func(w http.ResponseWriter, r *http.Request) {

		imageRequest := &view.ImageRequest{}

		err := json.NewDecoder(r.Body).Decode(imageRequest)
		if err != nil {
			logs.Error("Request: %s, unable to parse content: %v", RequestSummary(r), err)
			BadRequest(w, r)
			return
		}

		var pinList []*view.Pin

		urls := imageRequest.URL
		//category := imageRequest.Category
		userID := imageRequest.UserID

		for _, url := range urls {

			res, err := http.Get(url)
			if err != nil {
				logs.Error("%v", err)
				BadRequest(w, r)
				return
			}

			if res.StatusCode != 200 {
				logs.Error("Status Code: %d %s\n", res.StatusCode, res.Status)
				HttpErrorHandler(res.StatusCode, w, r)
				return
			}

			images, err := GetImages(url, res)
			if err != nil {
				logs.Error("%v", err)
				InternalServerError(w, r)
				return
			}

			for _, imageURL := range images {
				height, width, format, path := GetImageInfo(imageURL)

				if height >= 400 || width >= 400 {

					file, err := os.Open(path)
					if err != nil {
						logs.Error("Request: %s, unable to open images: %v", RequestSummary(r), err)
						return
					}
					defer file.Close()

					logs.Info("S3 Upload Started")

					s3Url, err := UploadImage(&s3, file, format)
					if err != nil {
						logs.Error("Request: %s, unable to upload images: %v", RequestSummary(r), err)
						InternalServerError(w, r)
						return
					}

					var labels []string

					if format == "png" || format == "jpeg" {
						labels, err = s3.Detect(s3Url)
						if err != nil {
							logs.Error("Request: %s, unable to detect images: %v", RequestSummary(r), err)
							return
						}
					}

					now := time.Now()
					pinID := uuid.NewV4()
					pin := &view.Pin{
						ID:          pinID,
						UserID:      userID,
						URL:         url,
						ImageURL:    s3Url,
						Title:       "hogehoge",
						Description: "hogehoge",
						UploadType:  "url",
						Label:       labels,
						CreatedAt:   &now,
					}
					pinList = append(pinList, pin)
				}

			}
			defer res.Body.Close()
		}

		/*
			metadata := GetMetadata(res.Body)

			title := metadata.Title
			description := metadata.Description
		*/

		bytes, err := json.Marshal(pinList)
		if err != nil {
			logs.Error("Request: %s, unable to parse content: %v", RequestSummary(r), err)
			InternalServerError(w, r)
			return
		}

		w.Header().Set(contentType, jsonContent)
		_, err = w.Write(bytes)
		if err != nil {
			logs.Error("Request: %s, writing response: %v", RequestSummary(r), err)
			InternalServerError(w, r)
			return
		}
	}
}
