// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

contract Storage{ 
   uint public data;
   
   function set(uint _data) external {
    data = _data;
   }
}