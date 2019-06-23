FROM rust:stretch as base

RUN apt-get update && \
	apt-get install -y --no-install-recommends \
	make cmake g++ gcc

RUN mkdir /zion
WORKDIR /zion

ENV RUST_BACKTRACE 1
ENV CARGO_HOME /zion/.cargo/

# Copy cached target/ from master
COPY --from=gcr.io/ziond/master:latest /zion/target /zion/target

# Copy cached .cargo/ from master
COPY --from=gcr.io/ziond/master:latest /zion/.cargo /zion/.cargo

# Copy local code to the container image.
# Assumes that we are in the git repo.
COPY . .

RUN cargo test --all && cargo build --release
