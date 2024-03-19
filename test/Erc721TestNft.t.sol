// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import {Test, console} from "forge-std/Test.sol";
import "forge-std/Vm.sol";
import {Erc721TestNft} from "../src/Erc721TestNft.sol";

contract Erc721TestNftTest is Test {
    Erc721TestNft public nft;

    address public admin;
    uint256 public adminPrivKey;

    address public other;
    uint256 public otherPrivKey;

    function setUp() public {
        nft = new Erc721TestNft();
        (admin, adminPrivKey) = makeAddrAndKey("admin");
        (other, otherPrivKey) = makeAddrAndKey("other");
    }

    function test_Mint() public {
        nft.mint(admin, 1);
        nft.mint(other, 2);
        assertEq(nft.balanceOf(admin), 1);
        assertEq(nft.ownerOf(1), admin);
        assertEq(nft.balanceOf(other), 1);
        assertEq(nft.ownerOf(2), other);
    }

    function test_Burn() public {
        nft.mint(admin, 1);
        nft.mint(other, 2);
        vm.prank(admin);
        nft.burn(1);
        assertEq(nft.balanceOf(admin), 0);
        vm.prank(other);
        nft.burn(2);
        assertEq(nft.balanceOf(other), 0);
    }

    function test_SafeTransferFrom() public {
        nft.mint(admin, 1);
        nft.mint(other, 2);
        vm.prank(admin);
        nft.safeTransferFrom(admin, other, 1);
        assertEq(nft.balanceOf(admin), 0);
        assertEq(nft.balanceOf(other), 2);
        assertEq(nft.ownerOf(1), other);
        assertEq(nft.ownerOf(2), other);
    }

}
