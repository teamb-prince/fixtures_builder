package db

import (
	"database/sql"
)

type DataStorage interface {
	StoreUser(user *User) error
}

func NewSQLDataStorage(sqlDB *sql.DB) SQLDataStorage {
	return SQLDataStorage{DB: sqlDB}
}

type SQLDataStorage struct {
	DB *sql.DB
}
