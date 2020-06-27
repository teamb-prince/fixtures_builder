package server

import (
	"database/sql"
	"fmt"
	"net/http"

	"github.com/gorilla/mux"
	"github.com/teamb-prince/fixtures_builder/api/awsmanager"
	"github.com/teamb-prince/fixtures_builder/logs"
	"github.com/teamb-prince/fixtures_builder/models/db"
	"github.com/teamb-prince/fixtures_builder/server/handlers"
)

func Start(port int, dbConn *sql.DB) error {
	router := mux.NewRouter()
	data := db.NewSQLDataStorage(dbConn)
	s3manager := awsmanager.NewS3Manager()

	AttachHandlers(router, data, *s3manager)

	s := &http.Server{
		Addr:    fmt.Sprintf(":%d", port),
		Handler: router,
	}
	logs.Info("Server started...")
	logs.Info("Listening on %s", s.Addr)
	return s.ListenAndServe()

}

func AttachHandlers(mux *mux.Router, data db.DataStorage, s3manager awsmanager.S3Manager) {
	mux.HandleFunc("/health", handlers.HealthHandler()).Methods(http.MethodGet)
	mux.HandleFunc("/images", handlers.ImageHandler(data, s3manager)).Methods(http.MethodPost)

}
