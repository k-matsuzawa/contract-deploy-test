// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import {Test, console} from "forge-std/Test.sol";
import {Erc20TestToken} from "../src/Erc20TestToken.sol";

contract Erc20TestTokenTest is Test {
    Erc20TestToken public token;

    address public admin;
    uint256 public adminPrivKey;

    address public other;
    uint256 public otherPrivKey;

    function setUp() public {
        token = new Erc20TestToken();
        (admin, adminPrivKey) = makeAddrAndKey("admin");
        (other, otherPrivKey) = makeAddrAndKey("other");
    }

    function test_Mint() public {
        token.mint(admin, 1000);
        token.mint(other, 2000);
        assertEq(token.totalSupply(), 3000);
        assertEq(token.balanceOf(admin), 1000);
        assertEq(token.balanceOf(other), 2000);
    }

    function test_Burn() public {
        token.mint(admin, 1000);
        token.mint(other, 2000);
        vm.prank(admin);
        token.burn(admin, 500);
        vm.prank(other);
        token.burn(other, 1000);
        assertEq(token.totalSupply(), 1500);
        assertEq(token.balanceOf(admin), 500);
        assertEq(token.balanceOf(other), 1000);
    }

    function test_Transfer() public {
        token.mint(admin, 1000);
        token.mint(other, 2000);
        vm.prank(admin);
        token.transfer(other, 1000);
        assertEq(token.totalSupply(), 3000);
        assertEq(token.balanceOf(admin), 0);
        assertEq(token.balanceOf(other), 3000);
    }
}
