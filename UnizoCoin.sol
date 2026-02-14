// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// OpenZeppelin ஓட தரமான கோட் இது
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract UnizoCoin is ERC20 {
    // இங்கதான் காயின் பேரு "Unizo" மற்றும் அடையாளம் "UNZ"னு செட் பண்றோம்
    constructor() ERC20("Unizo", "UNZ") {
        // நீங்க ஆரம்பத்துல எத்தனை காயின் வேணும்னு இங்க குடுக்கலாம்
        // உதாரணத்துக்கு 10 லட்சம் காயின்கள் (18 decimals ஓட)
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }
}
