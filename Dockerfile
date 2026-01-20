FROM ethereum/client-go:latest
EXPOSE 8545 8546 30303 30303/udp
ENTRYPOINT ["geth"]
CMD ["--dev", "--http", "--http.addr", "0.0.0.0", "--http.port", "8545", "--http.corsdomain", "*", "--http.api", "eth,net,web3,debug,txpool,miner,admin", "--http.vhosts", "*", "--mine", "--miner.threads", "1", "--allow-insecure-unlock"]
