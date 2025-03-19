package main

import (
	"fmt"
	"go-db-datastreamer/adapters"
	"go-db-datastreamer/app/service"
)

func main() {

	store, _ := adapters.NewKinesisAdapter("dev-player-rankings-stream")

	service := service.NewPlayerService(store)

	player := service.AddPlayerData()

	fmt.Printf("%+v\n", player)

}