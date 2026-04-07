FROM mcr.microsoft.com/dotnet/sdk:6.0-jammy as BUILDER
WORKDIR /app
RUN apt-get update && \
    apt-get -y install cmake clang ninja-build build-essential libssl-dev pkg-config libboost-all-dev libsodium-dev libzmq5 libzmq3-dev golang-go libgmp-dev libc++-dev zlib1g-dev 
COPY . .
WORKDIR /app/src/Miningcore.webui

EXPOSE  4000-4090
COPY --from=BUILDER /app/build ./
CMD ["./Miningcore", "-c", "config.json" ]
