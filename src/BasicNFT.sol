// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract BasicNFT is ERC721 {
    uint256 private tokenCounter;

    mapping(uint256 => string) private tokenIdToURI;

    constructor() ERC721("Dog", "DGT") {}

    function mintNFT(string memory tokenUri) public {
        tokenIdToURI[tokenCounter] = tokenUri;
        _safeMint(msg.sender, tokenCounter);
        tokenCounter++;
    }

    function tokenURI(
        uint256 tokenID
    ) public view override returns (string memory) {
        return tokenIdToURI[tokenID];
    }
}
