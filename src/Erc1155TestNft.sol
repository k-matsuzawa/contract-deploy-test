// Erc1155TestNft.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "../lib/openzeppelin-contracts/contracts/token/ERC1155/ERC1155.sol";
import "../lib/openzeppelin-contracts//contracts/utils/Strings.sol";

contract Erc1155TestNft is ERC1155 {
    constructor() ERC1155("https://k-matsuzawa.github.io/contract-deploy-test/erc1155nft.json") {
        // コントラクトデプロイ時に１度だけ呼ばれる
    }

    function mint(address to, uint256 id, uint256 value, bytes memory data) public {
        _mint(to, id, value, data);
    }

    function burn(address from, uint256 id, uint256 value) public {
        _burn(from, id, value);
    }
}