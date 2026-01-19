FROM ethereum/client-go:latest
COPY . /app
WORKDIR /app
EXPOSE 8545 30303
ENTRYPOINT ["geth", "--dev", "--http", "--http.addr", "0.0.0.0", "--http.port", "8545", "--http.corsdomain", "*", "--http.api", "eth,net,web3,personal,miner,admin", "--allow-insecure-unlock", "--miner.etherbase", "0x25CAa890AE23A387A77beD63d8eac8226C92eFF9"]
