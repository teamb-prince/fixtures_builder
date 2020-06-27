package main

import (
	"log"

	"github.com/teamb-prince/fixtures_builder/config"
	"github.com/teamb-prince/fixtures_builder/logs"
	"github.com/teamb-prince/fixtures_builder/server"
)

func main() {
	c, err := config.ReadConfig()
	if err != nil {
		logs.Error("Invalid config: %s", err)
		panic(err)
	}

	sqlDB, err := connectToDb(c.DB.Host, c.DB.Port, c.DB.User, c.DB.Password, c.DB.DBName)
	if sqlDB != nil {
		defer sqlDB.Close()
	}
	if err != nil {
		logs.Error("DB connection failure: %s", err)
		panic(err)
	}

	err = server.Start(c.Server.Port, sqlDB)
	if err != nil {
		log.Fatal(err)
	}
}
