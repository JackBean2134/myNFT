// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyArtNFT is ERC721URIStorage, Ownable {
    uint256 private _nextTokenId;

    // 部署时传入你的钱包地址作为 owner
    constructor(
        address initialOwner
    ) ERC721("MyArtNFT", "ART") Ownable(initialOwner) {}

    /// @notice 仅合约拥有者铸造，传入接收地址 + ipfs:// 格式metadata URI
    function mint(
        address to,
        string memory tokenURI
    ) public onlyOwner returns (uint256) {
        uint256 tokenId = _nextTokenId++;
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, tokenURI);
        return tokenId;
    }

    // 必须重写，ERC721URIStorage 要求
    function tokenURI(
        uint256 tokenId
    ) public view override returns (string memory) {
        return super.tokenURI(tokenId);
    }

    function supportsInterface(
        bytes4 interfaceId
    ) public view override returns (bool) {
        return super.supportsInterface(interfaceId);
    }
}
