.PHONY: build deploy clean zip

build:
    mkdir -p bin
    GOOS=linux GOARCH=amd64 go build -o bin/bootstrap src/main.go

zip: build
    cd bin && zip -r function.zip bootstrap

deploy: zip
    cd terraform && terraform init && terraform apply -auto-approve

clean:
    rm -rf bin/bootstrap bin/function.zip