# conflux-docker-arm64


### How to build image

1. 自行构建节点程序 conflux, 放入 run 目录
2. 运行构建命令

```sh
$ make build TAG=1.1.3
```

Note：make build 使用 Dockerfile.slim 文件来构建镜像



## 尝试静态编译
 
1. cargo build --target aarch64-unknown-linux-musl

Failed to find tool. Is `aarch64-linux-musl-gcc` installed

[target.aarch64-unknown-linux-musl]
linker = "aarch64-linux-gnu-gcc"
rustflags = [ "-C", "target-feature=+crt-static", "-C", "link-arg=-lgcc" ]

查看是否依赖公共库
ldd - print shared object dependencies



## 使用正确的 base-image

1. 会卡在 crate 更新，和 github 项目代码下载(网络问题) -- 解决办法，给 docker 设置代理

[设置代理](https://note.qidong.name/2020/05/docker-proxy/)
[设置代理2](https://www.simpleapples.com/2019/04/18/building-docker-image-behind-proxy/)



## 资料
1. [cmake]()