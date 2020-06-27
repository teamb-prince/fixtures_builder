package handlers

import (
	"io"

	"golang.org/x/net/html"
)

type HTMLMeta struct {
	Title       string `json:"title"`
	Description string `json:"description"`
	Image       string `json:"image"`
	SiteName    string `json:"site_name"`
}

func GetMetadata(res io.Reader) *HTMLMeta {
	tokenizer := html.NewTokenizer(res)

	titleFound := false
	metadata := new(HTMLMeta)

	for {
		tokenType := tokenizer.Next()
		switch tokenType {
		case html.ErrorToken:
			return metadata
		case html.StartTagToken, html.SelfClosingTagToken:
			token := tokenizer.Token()
			if token.Data == "body" {
				return metadata
			}
			if token.Data == "title" {
				titleFound = true
			}
			if token.Data == "meta" {
				desc, ok := extractMetaProperty(token, "description")
				if ok {
					metadata.Description = desc
				}

				ogTitle, ok := extractMetaProperty(token, "og:title")
				if ok {
					metadata.Title = ogTitle
				}

				ogDesc, ok := extractMetaProperty(token, "og:description")
				if ok {
					metadata.Description = ogDesc
				}
			}
		case html.TextToken:
			if titleFound {
				token := tokenizer.Token()
				metadata.Title = token.Data
				titleFound = false
			}
		}
	}
}

func extractMetaProperty(t html.Token, prop string) (content string, ok bool) {
	for _, attr := range t.Attr {
		if attr.Key == "property" && attr.Val == prop {
			ok = true
		}

		if attr.Key == "content" {
			content = attr.Val
		}
	}

	return
}
