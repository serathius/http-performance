FROM rust:1.29.0 as hyper
WORKDIR /rust/src/
COPY http_hyper/Cargo.toml http_hyper/
RUN cd http_hyper && mkdir src && echo 'fn main() {println!("Hello, world!");}' > src/main.rs && cargo fetch && rm src/main.rs
COPY http_hyper http_hyper/
RUN cd http_hyper && cargo build --release

FROM rust:1.29.0 as nickel
WORKDIR /rust/src/
COPY http_nickel/Cargo.toml http_nickel/
RUN cd http_nickel && mkdir src && echo 'fn main() {println!("Hello, world!");}' > src/main.rs && cargo fetch && rm src/main.rs
COPY http_nickel http_nickel/
RUN cd http_nickel && cargo build --release

FROM rust:1.29.0 as rocket
WORKDIR /rust/src/
COPY http_rocket/Cargo.toml http_rocket/
RUN cd http_rocket && mkdir src && echo 'fn main() {println!("Hello, world!");}' > src/main.rs && cargo fetch && rm src/main.rs
#COPY http_rocket http_rocket/
#RUN cd http_rocket && cargo build --release

FROM rust:1.29.0 as iron
WORKDIR /rust/src/
COPY http_iron/Cargo.toml http_iron/
RUN cd http_iron && mkdir src && echo 'fn main() {println!("Hello, world!");}' > src/main.rs && cargo fetch && rm src/main.rs
COPY http_iron http_iron/
RUN cd http_iron && cargo build --release

FROM rust:1.29.0
COPY --from=hyper /rust/src/http_hyper/target/release/http_hyper /
COPY --from=nickel /rust/src/http_nickel/target/release/http_nickel /
#COPY --from=rocket /rust/src/http_rocket/target/release/http_rocket /
COPY --from=iron /rust/src/http_iron/target/release/http_iron /
