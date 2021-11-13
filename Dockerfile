FROM lukemathwalker/cargo-chef:latest-rust-1.53.0 AS chef
WORKDIR app

FROM tcmoore/bend-api-service-layer as planner

FROM chef AS builder 
COPY --from=planner /app/recipe.json recipe.json
# Build dependencies - this is the caching Docker layer!
RUN cargo chef cook --release --recipe-path recipe.json
# Build application
COPY . .
RUN cargo install --path .

FROM debian:buster-slim as runner
COPY --from=builder /usr/local/cargo/bin/api-service /usr/local/bin/api-service
ENV ROCKET_ADDRESS=0.0.0.0
EXPOSE 8000
CMD ["api-service"]