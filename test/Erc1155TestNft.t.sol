// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import {Test, console} from "forge-std/Test.sol";
import "forge-std/Vm.sol";
import {Erc1155TestNft} from "../src/Erc1155TestNft.sol";

contract Erc1155TestNftTest is Test {
    Erc1155TestNft public nft;

    address public admin;
    uint256 public adminPrivKey;

    address public other;
    uint256 public otherPrivKey;

    function setUp() public {
        nft = new Erc1155TestNft();
        (admin, adminPrivKey) = makeAddrAndKey("admin");
        (other, otherPrivKey) = makeAddrAndKey("other");
    }

    function test_Mint() public {
        nft.mint(admin, 1, 1000, "");
        nft.mint(other, 2, 2000, "");
        assertEq(nft.balanceOf(admin, 1), 1000);
        assertEq(nft.balanceOf(other, 2), 2000);
    }

    function test_Burn() public {
        nft.mint(admin, 1, 1000, "");
        nft.mint(other, 2, 2000, "");
        vm.prank(admin);
        nft.burn(admin, 1, 500);
        assertEq(nft.balanceOf(admin, 1), 500);
        vm.prank(other);
        nft.burn(other, 2, 1000);
        assertEq(nft.balanceOf(other, 2), 1000);
    }

    function test_SafeTransferFrom() public {
        nft.mint(admin, 1, 1000, "");
        nft.mint(other, 2, 2000, "");
        vm.prank(admin);
        nft.safeTransferFrom(admin, other, 1, 1000, "");
        assertEq(nft.balanceOf(admin, 1), 0);
        assertEq(nft.balanceOf(other, 1), 1000);
        assertEq(nft.balanceOf(other, 2), 2000);
    }
}
