#!/bin/bash
set -e

echo "Building Lambda function..."
mkdir -p bin
GOOS=linux GOARCH=amd64 go build -o bin/bootstrap src/main.go

echo "Creating deployment package..."
cd bin && zip -r function.zip bootstrap

echo "Build completed successfully!"