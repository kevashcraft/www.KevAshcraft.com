default: dev

.PHONY: build

build:
	docker build -t kevashcraft_com -f build/development.dockerfile .

dev: build
	docker run -v $(shell pwd)/app/src:/usr/share/nginx/html -p 58880:80 kevashcraft_com

build_prod:
	docker build -t kevashcraft/kevashcraft-com:latest -f build/production.dockerfile .

push: build_prod
	docker push kevashcraft/kevashcraft-com:latest

upgrade: push
	helm upgrade kevashcraft build/chart

install: push
	helm install kevashcraft build/chart
