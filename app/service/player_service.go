package service

import (
	"fmt"
	"go-db-datastreamer/app/port"

	"github.com/brianvoe/gofakeit/v7"
)

type PlayerService struct{
	playerPort port.PlayerData
}

func NewPlayerService(playerPort port.PlayerData) *PlayerService {
	return &PlayerService{playerPort: playerPort}
}

func (p *PlayerService) AddPlayerData() error{

	var myPlayer port.Player
	err := gofakeit.Struct(&myPlayer)

	// myPlayer := port.Player{
	// 	Name: 		"Player",
	// 	Class: 		"Tank",
	// 	ID:			3742,
	// 	Score: 		1739,
	// 	Ranking: 	14,
	// }

	if err != nil {
        return fmt.Errorf("failed to Create Random Player Data: %w", err)
    }

	return p.playerPort.Save(myPlayer)
}