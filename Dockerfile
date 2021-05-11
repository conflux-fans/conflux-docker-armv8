FROM arm64v8/rust:1.51-buster
#FROM confluxchain/conflux-rust-build:0.1.0
RUN apt-get update && apt-get install -y cmake
ADD conflux /usr/src/conflux
WORKDIR /usr/src/conflux
ADD cargo-config.toml $HOME/.cargo/config
RUN cargo clean
RUN cargo install --path .

#ADD run /root/run
#WORKDIR /root/run
ENTRYPOINT [ "conflux", "--config", "/root/run/testnet.toml" ]
