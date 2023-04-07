// 1. Transfer of ether from a account to the smart contract

// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract pay{
//  receive ether from the other account
    function  get() payable external {

    }

// Function for getting the balance
    function getbalance() view external returns(uint){
        return address(this).balance;
    }
}