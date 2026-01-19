FROM ethereum/client-go:latest

# தேவையான போர்ட்களைத் திறத்தல்
EXPOSE 8545 8546 30303 30303/udp

# Geth சர்வரை அனைத்து மாட்யூல்களுடன் தொடங்குதல்
ENTRYPOINT ["geth"]
CMD [     "--dev",     "--http",     "--http.addr", "0.0.0.0",     "--http.port", "8545",     "--http.corsdomain", "*",     "--http.api", "eth,net,web3,debug,txpool,miner,admin",     "--http.vhosts", "*",     "--mine",     "--miner.threads", "1",     "--allow-insecure-unlock",     "--rpc.allow-unprotected-txs" ]
