package port

type PlayerData interface {
	Save(playerData Player) error
}

type Player struct {
	Name    string `json:"name"`
	Class   string `json:"class"`
	ID      int    `json:"id"`
	Score   int    `json:"score"`
	Ranking int    `json:"ranking"`
}