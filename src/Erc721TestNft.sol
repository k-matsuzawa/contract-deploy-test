// Erc721TestNft.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "../lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import "../lib/openzeppelin-contracts/contracts/token/ERC721/utils/ERC721Holder.sol";
import "../lib/openzeppelin-contracts/contracts/utils/Base64.sol";

contract Erc721TestNft is ERC721, ERC721Holder {
    constructor() ERC721("Erc721TestNft", "TKET") {
        // コントラクトデプロイ時に１度だけ呼ばれる
    }

    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        _requireOwned(tokenId);
        string memory enc = Base64.encode('{"name":"Erc721TestNft","description":"","image":"https://k-matsuzawa.github.io/contract-deploy-test/blue_tile.png"}');
        return string(abi.encodePacked('data:application/json;base64,', enc));
    }

    function mint(address to, uint256 tokenId) public {
        _mint(to, tokenId);
    }

    function burn(uint256 tokenId) public {
        _burn(tokenId);
    }
}