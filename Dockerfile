# syntax=docker/dockerfile:1

FROM rust:1.72 AS buildbase
WORKDIR /src
RUN rustup target add wasm32-wasi
RUN curl -sSf https://raw.githubusercontent.com/WasmEdge/WasmEdge/master/utils/install.sh | bash -s -- -p /usr/local --plugins wasmedge_rustls

COPY Cargo.toml .
COPY src ./src

RUN cargo build --target wasm32-wasi --release

CMD ["wasmedge", "/src/target/wasm32-wasi/release/sales_tax_rate_lookup.wasm"]
