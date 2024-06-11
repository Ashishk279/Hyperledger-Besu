// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Abacus {
    int private value;

    function addInteger(int n) public {
        unchecked {
            value = value + n;
        }
    }

    function sumOfIntegers() public view returns (int) {
        return value;
    }
}
