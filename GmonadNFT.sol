// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract GmonadNFT is ERC721, Ownable {
    uint256 public nextTokenId;
    uint256 public mintPrice = 0.01 ether;

    constructor() ERC721("GmonadNFT", "GMNNFT") Ownable(msg.sender) {}

    function mint() external payable {
        require(msg.value >= mintPrice, "Not enough ETH to mint");
        _safeMint(msg.sender, nextTokenId);
        nextTokenId++;
    }

    function setMintPrice(uint256 _price) external onlyOwner {
        mintPrice = _price;
    }
}
