// SushiItems.sol
// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.20;

import "../lib/openzeppelin-contracts/contracts/token/ERC1155/ERC1155.sol";
import "../lib/openzeppelin-contracts//contracts/utils/Strings.sol";

contract Erc1155Nft is ERC1155 {
    string baseMetadataURIPrefix;
    string baseMetadataURISuffix;

    // コントラクトデプロイ時に１度だけ呼ばれる
    constructor() ERC1155("") {
        baseMetadataURIPrefix = "YOUR_METADATA_URI";
        baseMetadataURISuffix = "YOUR_METADATA_URI_SUFFIX";
    }

    
    function uri(uint256 _id) public view override returns (string memory) {
        // "https://~~~" + tokenID + ".json" の文字列結合を行っている
	// OpenSeaはここのメタデータを読み取ることで画像等を表示している
        return string(abi.encodePacked(
            baseMetadataURIPrefix,
            Strings.toString(_id),
            baseMetadataURISuffix
        ));
    }

    function mint(uint256 _tokenId, uint256 _amount) public { 
        _mint(msg.sender, _tokenId, _amount, "");
    }

    function mintBatch(uint256[] memory _tokenIds, uint256[] memory _amounts) public { 
        _mintBatch(msg.sender, _tokenIds, _amounts, "");
    }

    function setBaseMetadataURI(string memory _prefix, string memory _suffix) public { 
        baseMetadataURIPrefix = _prefix;
        baseMetadataURISuffix = _suffix;
    }
}