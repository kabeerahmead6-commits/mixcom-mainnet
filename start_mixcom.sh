#!/bin/bash
# Geth இன்ஸ்டால் செய்தல்
sudo add-apt-repository -y ppa:ethereum/ethereum
sudo apt-get update
sudo apt-get install ethereum -y

# பிளாக்செயினை ஸ்டார்ட் செய்தல்
geth --datadir ./data --networkid 8899 --http --http.addr 0.0.0.0 --http.port 8545 --http.corsdomain "*" --http.vhosts "*" --http.api eth,net,web3,personal --allow-insecure-unlock &
echo "Mixcom Mainnet is now Running!"


