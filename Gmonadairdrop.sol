// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract GmonadAirdrop is Ownable {
    IERC20 public token;

    constructor(address _token) Ownable(msg.sender) {
        token = IERC20(_token);
    }

    function airdrop(address[] calldata recipients, uint256 amount) external onlyOwner {
        for (uint256 i = 0; i < recipients.length; i++) {
            require(token.transfer(recipients[i], amount), "Transfer failed");
        }
    }
}
// contract address: 0x2F79CB560c59A605F249f194EA13503C0453087B
