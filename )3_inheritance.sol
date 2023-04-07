// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


// 1. Contract B will inherit everything from contract A

contract A{
  
  function f1() public pure returns(string memory){
      return "Hi I am f1 of contract A";
  }

//  2. Virtual keyword giving permission to change f2 function
  function f2() public pure virtual returns(string memory){
      return "Hi I am f2 of contract A";
  }

}

contract B is A {

    // 3. With the help of override we will change the function f2 and f1 will inherit same of A
 function f2() public pure override returns(string memory){
      return "Hi I am f2 of contract B";
  }
}