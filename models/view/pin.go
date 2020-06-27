package view

import (
	"time"

	uuid "github.com/satori/go.uuid"
)

type Pin struct {
	ID          uuid.UUID  `json:"id"`
	UserID      string     `json:"user_id"`
	URL         string     `json:"url"`
	Title       string     `json:"title"`
	ImageURL    string     `json:"image_url"`
	Description string     `json:"description"`
	UploadType  string     `json:"upload_type"`
	CreatedAt   *time.Time `json:"created_at"`
}
