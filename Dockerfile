FROM arm64v8/rust:1.51-buster
WORKDIR /usr/src
ADD conflux /usr/src/conflux
WORKDIR /usr/src/conflux
# ADD misc/cargo-config.toml $HOME/.cargo/config
RUN cargo clean
RUN cargo install --path .