default: dev

.PHONY: build

build:
	docker build -t kevashcraft_com -f build/development.dockerfile .

dev: build
	docker run -v $(shell pwd)/app/src:/usr/share/nginx/html -p 58880:80 kevashcraft_com

