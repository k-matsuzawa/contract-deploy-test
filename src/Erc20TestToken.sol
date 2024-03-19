// Erc20TestToken.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "../lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

contract Erc20TestToken is ERC20 {
    constructor() ERC20("Erc20TestToken", "TKET") {
        // コントラクトデプロイ時に１度だけ呼ばれる
    }

    function mint(address account, uint256 value) public {
        _mint(account, value);
    }

    function burn(address account, uint256 value) public {
        _burn(account, value);
    }
}