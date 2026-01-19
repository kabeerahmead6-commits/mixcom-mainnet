app.post('/', (req, res) => {
    const { method, id } = req.body;
    if (method === 'eth_chainId') return res.json({ jsonrpc: "2.0", id, result: "0x539" }); // 1337
    if (method === 'net_version') return res.json({ jsonrpc: "2.0", id, result: "1337" });
    if (method === 'eth_getBalance') return res.json({ jsonrpc: "2.0", id, result: "0x3635c9adc5dea00000" }); // 1000 MIX
    if (method === 'eth_blockNumber') return res.json({ jsonrpc: "2.0", id, result: "0x1" });
    res.json({ jsonrpc: "2.0", id, result: null });
});

app.get('/', (req, res) => {
    res.send('<body style="background:#000;color:#0f0;text-align:center;padding:50px;"><h1>MIXCOM RPC IS READY</h1></body>');
});

app.listen(3000, '0.0.0.0', () => console.log('Mixcom Live!'));
EOF

cat << 'EOF' > index.js
const express = require('express');
const cors = require('cors');
const app = express();

app.use(cors());
app.use(express.json());

// உங்கள் வாலட் அட்ரஸை இங்கே மாற்றிக்கொள்ளலாம்
const myAddress = "YOUR_METAMASK_ADDRESS_HERE"; 

app.post('/', (req, res) => {
    const { method, id, params } = req.body;

    if (method === 'eth_chainId') return res.json({ jsonrpc: "2.0", id, result: "0x539" });
    if (method === 'net_version') return res.json({ jsonrpc: "2.0", id, result: "1337" });
    
    // வாலட்டில் 1000 MIX காயின்கள் இருப்பது போலக் காட்ட (Hex: 0x3635c9adc5dea00000)
    if (method === 'eth_getBalance') {
        return res.json({ jsonrpc: "2.0", id, result: "0x3635c9adc5dea00000" });
    }

    if (method === 'eth_blockNumber') return res.json({ jsonrpc: "2.0", id, result: "0x1" });
    if (method === 'eth_getTransactionCount') return res.json({ jsonrpc: "2.0", id, result: "0x0" });

    res.json({ jsonrpc: "2.0", id, result: null });
});

app.get('/', (req, res) => {
    res.send('<body style="background:#121212;color:#00ff00;text-align:center;padding:50px;"><h1>MIXCOM AIRDROP LIVE</h1><p>Check your MetaMask for 1000 MIX Coins!</p></body>');
});

app.listen(3000, '0.0.0.0', () => console.log('Airdrop Server Ready'));
EOF

node index.js
npm install cors express
node index.js
cat << 'EOF' > index.js
const express = require('express');
const cors = require('cors');
const app = express();
app.use(cors());
app.use(express.json());

app.post('/', (req, res) => {
    const { method, id } = req.body;
    if (method === 'eth_chainId') return res.json({ jsonrpc: "2.0", id, result: "0x539" }); // 1337
    if (method === 'net_version') return res.json({ jsonrpc: "2.0", id, result: "1337" });
    if (method === 'eth_getBalance') return res.json({ jsonrpc: "2.0", id, result: "0x3635c9adc5dea00000" }); // 1000 MIX
    if (method === 'eth_blockNumber') return res.json({ jsonrpc: "2.0", id, result: "0x1" });
    res.json({ jsonrpc: "2.0", id, result: null });
});

app.get('/', (req, res) => {
    res.send('<body style="background:#000;color:#0f0;text-align:center;padding:50px;"><h1>MIXCOM RPC IS READY</h1></body>');
});

app.listen(3000, '0.0.0.0', () => console.log('Mixcom Live!'));
EOF

node index.js
cat << 'EOF' > index.js
const express = require('express');
const cors = require('cors');
const app = express();

app.use(cors());
app.use(express.json());

// 1. பிளாக்செயின் டேட்டா & விலை (Price Logic)
let mixcomPrice = 0.75; // 1 MIX = $0.75 (இதை நீங்கள் மாற்றிக்கொள்ளலாம்)
let totalVolume = 10000;

app.post('/', (req, res) => {
    const { method, id } = req.body;
    
    // MetaMask RPC Responses
    if (method === 'eth_chainId') return res.json({ jsonrpc: "2.0", id, result: "0x539" });
    if (method === 'net_version') return res.json({ jsonrpc: "2.0", id, result: "1337" });
    if (method === 'eth_getBalance') return res.json({ jsonrpc: "2.0", id, result: "0x3635c9adc5dea00000" }); // 1000 MIX
    
    res.json({ jsonrpc: "2.0", id, result: null });
});

// 2. ஸ்மார்ட் காண்ட்ராக்ட் லாஜிக் (API வழியாக)
app.get('/contract/info', (req, res) => {
    res.json({
        name: "Mixcom Smart Contract V1",
        symbol: "MIX",
        totalSupply: "1,000,000",
        price_usd: mixcomPrice,
        status: "Verified"
    });
});

// 3. உங்கள் ஆப்பிற்கான (Meda.dev) டேஷ்போர்டு
app.get('/', (req, res) => {
    res.send(`
        <body style="background:#000; color:#0f0; text-align:center; padding:50px; font-family:sans-serif;">
            <h1 style="color:#00ff00;">MIXCOM SMART CHAIN</h1>
            <div style="border: 2px solid #0f0; padding: 20px; display: inline-block; border-radius:15px; background:#111;">
                <h2>Current Price: <span style="color:white;">$${mixcomPrice} USD</span></h2>
                <p>Market Cap: <span style="color:white;">$${mixcomPrice * totalVolume}</span></p>
                <p>Contract Status: <b style="color:white;">ACTIVE</b></p>
            </div>
            <br><br>
            <button onclick="window.location.href='/contract/info'" style="padding:10px; background:#f80; border:none; border-radius:5px; cursor:pointer;">View Smart Contract Data</button>
        </body>
    `);
});

app.listen(3000, '0.0.0.0', () => console.log('Mixcom Smart Chain Live!'));
EOF

node index.js
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract MixcomCoin {
}
cat << 'EOF' > MixcomCoin.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MixcomCoin {
    string public name = "Mixcom Coin";
    string public symbol = "MIX";
    uint8 public decimals = 18;
    uint256 public totalSupply = 1000000 * (10 ** 18);

    mapping(address => uint256) public balanceOf;

    constructor() {
        balanceOf[msg.sender] = totalSupply;
    }

    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(balanceOf[msg.sender] >= _value, "Insufficient balance");
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        return true;
    }
}
EOF

npm install cors express && node index.js
npm install express cors
cat << 'EOF' > index.js
const express = require('express');
const cors = require('cors');
const app = express();

app.use(cors());
app.use(express.json());

// உங்கள் காயின் மற்றும் காண்ட்ராக்ட் விவரங்கள்
const MIXCOM_DATA = {
    contractAddress: "0x4d6978636f6d436f696e5631536d617274436861696e",
    tokenName: "Mixcom Coin",
    symbol: "MIX",
    priceUSD: 0.75,
    totalSupply: "1,000,000"
};

app.post('/', (req, res) => {
    const { method, id } = req.body;
    // மெட்டாமஸ்க் கேட்கும் தகவல்கள்
    if (method === 'eth_chainId') return res.json({ jsonrpc: "2.0", id, result: "0x539" });
    if (method === 'net_version') return res.json({ jsonrpc: "2.0", id, result: "1337" });
    if (method === 'eth_getBalance') return res.json({ jsonrpc: "2.0", id, result: "0x3635c9adc5dea00000" });
    res.json({ jsonrpc: "2.0", id, result: null });
});

// உங்கள் Meda.dev ஆப் இந்த லிங்க் மூலம் காண்ட்ராக்ட் விவரங்களை எடுக்கும்
app.get('/contract-api', (req, res) => {
    res.json(MIXCOM_DATA);
});

app.get('/', (req, res) => {
    res.send(`
        <body style="background:#000;color:#0f0;text-align:center;font-family:sans-serif;padding:50px;">
            <h1 style="border:2px solid #0f0;padding:20px;display:inline-block;">MIXCOM SMART CHAIN IS LIVE</h1>
            <p>Contract Address: <br><b style="color:white;">${MIXCOM_DATA.contractAddress}</b></p>
            <p>Current Price: <b style="color:white;">$${MIXCOM_DATA.priceUSD}</b></p>
        </body>
    `);
});

app.listen(3000, '0.0.0.0', () => console.log('Terminal: Mixcom Smart Chain has been successfully linked!'));
EOF

node index.js
# Ubuntu சர்வரை அப்டேட் செய்ய
sudo apt-get update && sudo apt-get upgrade -y
# Go Ethereum (Geth) இன்ஸ்டால் செய்ய
sudo add-apt-repository -y ppa:ethereum/ethereum
sudo apt-get update
sudo apt-get install ethereum -y
mkdir mixcom-mainnet
cd mixcom-mainnet
cat << 'EOF' > genesis.json
{
  "config": {
    "chainId": 8899,
    "homesteadBlock": 0,
    "eip150Block": 0,
    "eip155Block": 0,
    "eip158Block": 0,
    "byzantiumBlock": 0,
    "constantinopleBlock": 0,
    "petersburgBlock": 0,
    "istanbulBlock": 0,
    "berlinBlock": 0,
    "londonBlock": 0,
    "ethash": {}
  },
  "difficulty": "1",
  "gasLimit": "8000000",
  "alloc": {
    "YOUR_METAMASK_ADDRESS": { "balance": "1000000000000000000000000000" }
  }
}
EOF

geth --datadir ./data init genesis.json
cat << 'EOF' > genesis.json
{
  "config": {
    "chainId": 8899,
    "homesteadBlock": 0,
    "eip150Block": 0,
    "eip155Block": 0,
    "eip158Block": 0,
    "byzantiumBlock": 0,
    "constantinopleBlock": 0,
    "petersburgBlock": 0,
    "istanbulBlock": 0,
    "berlinBlock": 0,
    "londonBlock": 0,
    "ethash": {}
  },
  "difficulty": "1",
  "gasLimit": "8000000",
  "alloc": {
    "YOUR_METAMASK_ADDRESS": { "balance": "1000000000000000000000000000" }
  }
}
EOF

geth --datadir ./data init genesis.json
cat << 'EOF' > genesis.json
{
  "config": {
    "chainId": 8899,
    "homesteadBlock": 0,
    "eip150Block": 0,
    "eip155Block": 0,
    "eip158Block": 0,
    "byzantiumBlock": 0,
    "constantinopleBlock": 0,
    "petersburgBlock": 0,
    "istanbulBlock": 0,
    "berlinBlock": 0,
    "londonBlock": 0,
    "ethash": {}
  },
  "difficulty": "1",
  "gasLimit": "8000000",
  "alloc": {
    "YOUR_ACTUAL_ADDRESS_HERE": { "balance": "1000000000000000000000000" }
  }
}
EOF

cat << 'EOF' > genesis.json
{
  "config": {
    "chainId": 8899,
    "homesteadBlock": 0,
    "eip150Block": 0,
    "eip155Block": 0,
    "eip158Block": 0,
    "byzantiumBlock": 0,
    "constantinopleBlock": 0,
    "petersburgBlock": 0,
    "istanbulBlock": 0,
    "berlinBlock": 0,
    "londonBlock": 0,
    "ethash": {}
  },
  "difficulty": "1",
  "gasLimit": "8000000",
  "alloc": {
    "0x4d6978636f6d436f696e5631536d617274436861696e":{ "balance": "1000000000000000000000000" }
  }
}
EOF

rm -rf data
geth --datadir ./data init genesis.json
rm genesis.json && rm -rf data
cat << 'EOF' > genesis.json
{
  "config": {
    "chainId": 8899,
    "homesteadBlock": 0,
    "eip150Block": 0,
    "eip155Block": 0,
    "eip158Block": 0,
    "byzantiumBlock": 0,
    "constantinopleBlock": 0,
    "petersburgBlock": 0,
    "istanbulBlock": 0,
    "berlinBlock": 0,
    "londonBlock": 0,
    "ethash": {}
  },
  "difficulty": "1",
  "gasLimit": "8000000",
  "alloc": {
    "0x4d6978636f6d436f696e5631536d617274436861696e": {
      "balance": "1000000000000000000000000000"
    }
  }
}
EOF

cat << 'EOF' > genesis.json
{
  "config": {
    "chainId": 8899,
    "homesteadBlock": 0,
    "eip150Block": 0,
    "eip155Block": 0,
    "eip158Block": 0,
    "byzantiumBlock": 0,
    "constantinopleBlock": 0,
    "petersburgBlock": 0,
    "istanbulBlock": 0,
    "berlinBlock": 0,
    "londonBlock": 0,
    "ethash": {}
  },
  "difficulty": "1",
  "gasLimit": "8000000",
  "alloc": {
    "0x4d6978636f6d436f696e5631536d617274436861696e": {
      "balance": "1000000000000000000000000000"
    }
  }
}
EOF

geth --datadir ./data init genesis.json
rm genesis.json && rm -rf data
cat << 'EOF' > genesis.json
{
  "config": {
    "chainId": 8899,
    "homesteadBlock": 0,
    "eip150Block": 0,
    "eip155Block": 0,
    "eip158Block": 0,
    "byzantiumBlock": 0,
    "constantinopleBlock": 0,
    "petersburgBlock": 0,
    "istanbulBlock": 0,
    "berlinBlock": 0,
    "londonBlock": 0,
    "ethash": {}
  },
  "difficulty": "1",
  "gasLimit": "8000000",
  "alloc": {
    "4d6978636f6d436f696e5631536d617274436861696e": {
      "balance": "1000000000000000000000000000"
    }
  }
}
EOF

geth --datadir ./data init genesis.json
node index.js
cd mixcom-coin/mixcom-mainnet
screen -S blockchain
sudo apt-get update && sudo apt-get install screen -y
geth --datadir ./data --networkid 8899 --http --http.addr 0.0.0.0 --http.port 8545 --http.corsdomain "*" --http.vhosts "*" --http.api eth,net,web3,personal --allow-insecure-unlock
sudo add-apt-repository -y ppa:ethereum/ethereum
sudo apt-get update
sudo apt-get install ethereum -y
# பழைய தரவுகளை நீக்க
rm -rf data genesis.json
# புதிய கோப்பை உருவாக்க
cat << 'EOF' > genesis.json
{
  "config": { "chainId": 8899, "homesteadBlock": 0, "ethash": {} },
  "difficulty": "1",
  "gasLimit": "8000000",
  "alloc": {
    "742d35Cc6634C0532925a3b844Bc454e4438f44e": { "balance": "1000000000000000000000000000" }
  }
}
EOF

geth --datadir ./data init genesis.json
nohup geth --datadir ./data --networkid 8899 --http --http.addr 0.0.0.0 --http.port 8545 --http.corsdomain "*" --http.vhosts "*" --http.api eth,net,web3,personal --allow-insecure-unlock > node.log 2>&1 &
sudo apt-get update && sudo apt-get install screen -y
geth --datadir ./data --networkid 8899 --http --http.addr 0.0.0.0 --http.port 8545 --http.corsdomain "*" --http.vhosts "*" --http.api eth,net,web3,personal --allow-insecure-unlock
D
200~rm -rf data genesis.json node.log~
rm -rf data genesis.json node.log
cat << 'EOF' > genesis.json
{
  "config": {
    "chainId": 8899,
    "homesteadBlock": 0,
    "eip150Block": 0,
    "eip155Block": 0,
    "eip158Block": 0,
    "byzantiumBlock": 0,
    "constantinopleBlock": 0,
    "petersburgBlock": 0,
    "istanbulBlock": 0,
    "berlinBlock": 0,
    "londonBlock": 0,
    "terminalTotalDifficulty": 0,
    "ethash": {}
  },
  "difficulty": "1",
  "gasLimit": "8000000",
  "alloc": {
    "742d35Cc6634C0532925a3b844Bc454e4438f44e": {
      "balance": "1000000000000000000000000000"
    }
  }
}
EOF

geth --datadir ./data init genesis.json
nohup geth --datadir ./data --networkid 8899 --http --http.addr 0.0.0.0 --http.port 8545 --http.corsdomain "*" --http.vhosts "*" --http.api eth,net,web3,personal --allow-insecure-unlock --miner.gaslimit 8000000 > node.log 2>&1 &
tail -f node.log
rm -rf data genesis.json node.log
cat << 'EOF' > genesis.json
{
  "config": {
    "chainId": 8899,
    "homesteadBlock": 0,
    "eip150Block": 0,
    "eip155Block": 0,
    "eip158Block": 0,
    "byzantiumBlock": 0,
    "constantinopleBlock": 0,
    "petersburgBlock": 0,
    "istanbulBlock": 0,
    "berlinBlock": 0,
    "londonBlock": 0,
    "terminalTotalDifficulty": 0,
    "ethash": {}
  },
  "difficulty": "1",
  "gasLimit": "8000000",
  "alloc": {
    "25CAa890AE23A387A77beD63d8eac8226C92eFF9": {
      "balance": "1000000000000000000000000000"
    }
  }
}
EOF

geth --datadir ./data init genesis.json
nohup geth --datadir ./data --networkid 8899 --http --http.addr 0.0.0.0 --http.port 8545 --http.corsdomain "*" --http.vhosts "*" --http.api eth,net,web3,personal --allow-insecure-unlock > node.log 2>&1 &
geth --datadir ./data --networkid 8899 --http --http.addr 0.0.0.0 --http.port 8545 --http.corsdomain "*" --http.vhosts "*" --http.api eth,net,web3,personal --allow-insecure-unlock &
sudo add-apt-repository -y ppa:ethereum/ethereum
sudo apt-get update
sudo apt-get install ethereum -y
nano start_mixcom.sh
./start_mixcom.sh
xx
o
chmod 777 start_mixcom.sh
./start_mixcom.sh
geth --datadir ./data --networkid 8899 --http --http.addr 0.0.0.0 --http.port 8545 --http.corsdomain "*" --http.vhosts "*" --http.api eth,net,web3,personal,miner,admin --allow-insecure-unlock &
start_mixcom.sh
./start_mixcom.sh
c
# GitHub-க்கு கோப்புகளை அனுப்ப
git add .
git commit -m "Upload blockchain files for mining"
git push -u origin main
git init
