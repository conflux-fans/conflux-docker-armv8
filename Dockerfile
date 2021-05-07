# FROM arm64v8/rust:1.51-buster
FROM confluxchain/conflux-rust-build:0.1.0
WORKDIR /usr/src
ADD conflux /usr/src/conflux
WORKDIR /usr/src/conflux
ADD cargo-config.toml $HOME/.cargo/config
RUN cargo clean
RUN cargo install --path .

WORKDIR /root
ADD run .
ENTRYPOINT [ "conflux", "--config", "/root/run/testnet.toml" ]
