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
