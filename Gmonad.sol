// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Gmonad {
    string public greeting;

    constructor(string memory _greeting) {
        greeting = _greeting;
    }

    function setGreeting(string calldata _greeting) external {
        greeting = _greeting;
    }
}  // ✅ Only one closing brace at the end
