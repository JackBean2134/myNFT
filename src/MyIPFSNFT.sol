// SPDX-License-Identifier: MIT
pragma solidity ^0.8.37;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyIPFSNFT is ERC721, Ownable {
    // mapping 改名，避免和变量冲突
    mapping(uint256 => string) private _nftTokenURI;

    constructor() ERC721("MyIPFSNFT", "INFT") Ownable() {}

    // 设置tokenURI，参数改成 _uri 消除警告
    function setTokenURI(uint256 tokenId, string memory _uri) public onlyOwner {
        _nftTokenURI[tokenId] = _uri;
    }

    // 重写tokenURI，v4用 _exists 判断token是否存在
    function tokenURI(
        uint256 tokenId
    ) public view override returns (string memory) {
        require(_exists(tokenId), "Token does not exist");
        return _nftTokenURI[tokenId];
    }

    function safeMint(address to, uint256 tokenId) public onlyOwner {
        _safeMint(to, tokenId);
    }
}
