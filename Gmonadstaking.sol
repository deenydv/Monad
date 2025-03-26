// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract GmonadStaking is Ownable {
    IERC20 public token;
    mapping(address => uint256) public stakedBalance;
    mapping(address => uint256) public stakingStartTime;
    uint256 public rewardRate = 5; // 5% per staking cycle

    constructor(address _token) Ownable(msg.sender) {
        token = IERC20(_token);
    }

    function stake(uint256 amount) external {
        require(amount > 0, "Cannot stake zero tokens");
        require(token.transferFrom(msg.sender, address(this), amount), "Transfer failed");
        stakedBalance[msg.sender] += amount;
        stakingStartTime[msg.sender] = block.timestamp;
    }

    function withdraw() external {
        uint256 amount = stakedBalance[msg.sender];
        require(amount > 0, "No staked balance");
        uint256 reward = (amount * rewardRate) / 100;
        require(token.transfer(msg.sender, amount + reward), "Transfer failed");
        stakedBalance[msg.sender] = 0;
    }
}
