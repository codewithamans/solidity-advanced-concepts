// SPDX-License-Identifier: MIT
// pragma solidity ^0.8.20;

contract RightAngledTriangle {
    //To check if a triangle with side lenghts a,b,c is a right angled triangle
   function max(uint x, uint y) private pure returns (uint) {
        return x > y ? x : y;
    }
function check(uint a, uint b, uint c) public pure returns (bool) {
uint longest = max(max(a, b), c);
       if (longest==0 || longest==1){
    return false;
}
        
   else if(longest == c) {
            return a*a + b*b == c*c;
        } else if(longest == b) {
            return a*a + c*c == b*b;
        } else {
            return b*b + c*c == a*a;
        }
        
    }
}
