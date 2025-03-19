package adapters

import (
	"context"
	"encoding/json"
	"fmt"
	"go-db-datastreamer/app/port"
	"go-db-datastreamer/configs"
	"log"
	"strconv"

	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/aws/aws-sdk-go-v2/service/kinesis"
)

type KinesisAdapter struct {
    client *kinesis.Client
    streamName string
}

func NewKinesisAdapter(streamName string) (*KinesisAdapter, error) {
    cfg, err := configs.GetAWSConfig()

    if err != nil {
        log.Fatalf("failed to load config, %v", err)
    }

    kinesisClient := kinesis.NewFromConfig(cfg, func(o *kinesis.Options) {
        o.BaseEndpoint = aws.String("http://localhost:4566")
    })

    return &KinesisAdapter{
        client: kinesisClient,
        streamName: streamName,
    }, nil
}

func (adapter *KinesisAdapter) Save(player port.Player) error {
	
	myPlayer, _ := json.Marshal(player)
    data := []byte(myPlayer)
    _, err := adapter.client.PutRecord(context.Background(), &kinesis.PutRecordInput{
        Data:         data,
        StreamName:   aws.String(adapter.streamName),
        PartitionKey: aws.String(strconv.Itoa(player.ID)),
    })

    if err != nil {
        return fmt.Errorf("failed to put record to Kinesis: %w", err)
    }

    return err
}
