// SPDX-License-Identifier: MIT
pragma solidity ^0.8.37;

import "forge-std/Test.sol";
import "../src/MyIPFSNFT.sol";

contract MyIPFSNFTTest is Test {
    MyIPFSNFT public nft;
    address public owner;

    function setUp() public {
        owner = address(this);
        // 构造函数无参数！不要传owner
        nft = new MyIPFSNFT();
    }

    function testMintAndSetUri() public {
        uint256 tokenId = 1;
        // 先铸造
        nft.safeMint(owner, tokenId);
        // 再设置uri
        nft.setTokenURI(tokenId, "ipfs://testcid");

        string memory uri = nft.tokenURI(tokenId);
        assertEq(uri, "ipfs://testcid");
    }
}
