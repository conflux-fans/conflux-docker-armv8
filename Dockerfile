FROM arm64v8/rust:1.51-buster
WORKDIR /usr/src
ADD conflux /usr/src/conflux
ADD cmake-3.20.2.tar.gz .
RUN ls cmake-3.20.2
RUN cd cmake-3.20.2 && \
    ./bootstrap && \
    make && \
    make install
WORKDIR /usr/src/conflux
ADD cargo-config.toml $HOME/.cargo/config
RUN cargo clean
RUN cargo install --path .
