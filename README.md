# conflux-docker-arm64


### How to build image

1. 自行构建节点程序 conflux, 放入 run 目录
2. 运行构建命令

```sh
$ make build TAG=1.1.3
```

Note：make build 使用 Dockerfile.slim 文件来构建镜像