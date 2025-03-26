// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Gmonad is ERC20, Ownable {
    string public greeting;
    uint256 public rewardAmount = 10 * 10**18; // Reward 10 tokens per interaction

    event GreetingUpdated(string newGreeting, address indexed updater);
    event RewardSent(address indexed recipient, uint256 amount);

    // Constructor that correctly passes the Ownable constructor with msg.sender
    constructor(string memory _greeting) ERC20("GmonadToken", "GMN") Ownable() {
        greeting = _greeting;
        _mint(msg.sender, 1000000 * 10**18); // Mint 1M tokens to deployer
    }

    function setGreeting(string calldata _greeting) external {
        greeting = _greeting;
        _mint(msg.sender, rewardAmount); // Reward sender with tokens
        emit GreetingUpdated(_greeting, msg.sender);
        emit RewardSent(msg.sender, rewardAmount);
    }

    function updateRewardAmount(uint256 newAmount) external onlyOwner {
        rewardAmount = newAmount;
    }

    function mintExtraTokens(address recipient, uint256 amount) external onlyOwner {
        _mint(recipient, amount);
    }
}
