package config

import (
	"fmt"
	"os"
	"strconv"
)

type Config struct {
	DB     DBConfig
	Server Server
}

type DBConfig struct {
	User     string
	Password string
	DBName   string
	Host     string
	Port     int
}

type Server struct {
	Port int
}

func ReadConfig() (*Config, error) {
	sPort, err := strconv.Atoi(os.Getenv("SERVER_PORT"))
	if err != nil {
		return nil, fmt.Errorf("reading env var 'SERVER_PORT': %w", err)
	}

	dbPort, err := strconv.Atoi(os.Getenv("DB_PORT"))
	if err != nil {
		return nil, fmt.Errorf("reading env var 'DB_PORT': %w", err)
	}

	return &Config{
		DBConfig{
			User:     os.Getenv("DB_USER"),
			Password: os.Getenv("DB_PASSWORD"),
			DBName:   os.Getenv("DB_NAME"),
			Host:     os.Getenv("DB_HOST"),
			Port:     dbPort,
		},
		Server{
			Port: sPort,
		},
	}, nil
}
