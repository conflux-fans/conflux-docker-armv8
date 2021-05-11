TAG = 1.0.0

.PHONY: all build push

all: build

clone: 
	rm -rf conflux
	git clone -b v${TAG} --single-branch --depth 1 https://github.com/Conflux-Chain/conflux-rust.git conflux

build: 
	docker build --network host --build-arg HTTP_PROXY=http://127.0.0.1:1087 --build-arg HTTPS_PROXY=http://127.0.0.1:1087 -f Dockerfile -t confluxchain/conflux-rust-arm64:${TAG} .

build-prod: 
	docker build -f Dockerfile.slim -t confluxchain/conflux-rust-arm64:${TAG} .

build-base:
	docker build -f Dockerfile.build -t confluxchain/conflux-rust-build:${TAG} .

push:
	docker push confluxchain/conflux-rust-arm64:${TAG}

