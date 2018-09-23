FROM rust:1.29.0
WORKDIR /rust/src/
COPY http_hyper/Cargo.toml http_hyper/
RUN cd http_hyper && mkdir src && echo 'fn main() {println!("Hello, world!");}' > src/main.rs && cargo fetch && rm src/main.rs

COPY http_hyper http_hyper/
RUN cd http_hyper && cargo build
