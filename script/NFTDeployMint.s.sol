// SPDX-License-Identifier: MIT
pragma solidity ^0.8.37;

import "forge-std/Script.sol";
import "../src/MyNFT.sol";

contract NFTDeployMint is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address deployer = vm.addr(deployerPrivateKey);

        vm.startBroadcast(deployerPrivateKey);

        MyNFT nft = new MyNFT();
        console.log("Contract address:", address(nft));

        // 全部用 deployer，全程不再出现 msg.sender
        nft.safeMint(deployer, 0);
        nft.safeMint(deployer, 1);
        nft.safeMint(deployer, 2);

        // 替换成你的IPFS CID
        nft.setTokenURI(
            0,
            "ipfs://bafkreiasxlqlkiuccvs5z6ve46bowwszrwa5z34dmspyinsgca2dhrfute"
        );
        nft.setTokenURI(
            1,
            "ipfs://bafkreih52c4jy3nj4oyfzemgk4pgaz2trdkzn7qjr4tqw3klfecvlyndgq"
        );
        nft.setTokenURI(
            2,
            "ipfs://bafkreib7hjn4gngorqvz5naurvh6ro4r26ob3nsrszyzzkryus3px4e3cy"
        );

        console.log("Polygon OpenSea link:");
        console.log("https://opensea.io/assets/matic/%s/0", address(nft));
        console.log("https://opensea.io/assets/matic/%s/1", address(nft));
        console.log("https://opensea.io/assets/matic/%s/2", address(nft));

        vm.stopBroadcast();
    }
}
