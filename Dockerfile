FROM lukemathwalker/cargo-chef:latest-rust-1.53.0 AS chef
WORKDIR app

FROM chef AS planner
COPY . .
RUN cargo chef prepare --recipe-path recipe.json

FROM chef AS builder 
COPY --from=planner /app/recipe.json recipe.json
# Build dependencies - this is the caching Docker layer!
RUN cargo chef cook --release --recipe-path recipe.json
# Build application
COPY . .
RUN cargo install --path .

FROM debian:buster-slim as runner
RUN apt-get update -y
# libpq necessary for diesel's postgres integration
RUN apt-get install -y libpq-dev
COPY --from=builder /usr/local/cargo/bin/api-service /usr/local/bin/api-service
ENV ROCKET_ADDRESS=0.0.0.0
EXPOSE 8000
CMD ["api-service"]