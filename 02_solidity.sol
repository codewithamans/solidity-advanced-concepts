// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;
// import "./2_Owner.sol";

contract Storage {

address adressb;

// Setting address of another account 
function setaddress(address a) public{
    adressb=a;
}


 function call() public view returns(string memory) {
    // Defining ponter for the another contract so that we can access its functions
     newContract a = newContract(adressb);
    return a.hello();
 }
}


contract newContract{
    function hello() external pure returns(string memory){
        return "hello world";
    }
}