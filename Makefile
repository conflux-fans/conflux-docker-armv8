TAG = 1.0.0

.PHONY: all build push

all: build

clone: 
	rm -rf conflux
	git clone -b v${TAG} --single-branch --depth 1 https://github.com/Conflux-Chain/conflux-rust.git conflux

build: 
	docker build -f Dockerfile -t confluxchain/conflux-rust-armv8:${TAG} .

push:
	docker push confluxchain/conflux-rust:${TAG}

