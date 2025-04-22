package main

import (
	"fmt"

	"github.com/aws/aws-lambda-go/lambda"
)

func Handler(input string) (string, error) {
	fmt.Println("Handler called with input:", input)

	return "Hello, " + input, nil
}

func main() {
	lambda.Start(Handler)
}