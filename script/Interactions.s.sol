// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";
import {BasicNft} from "src/BasicNft.sol";

contract MintBasicNft is Script {
    string public constant SHIBURI =
        "ipfs://QmVhC43M5bpyY59t8TXKtiVCyYzGxCHjePu8TJWbbQ1BWe";

    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment(
            "BasicNft",
            block.chainid
        );
        mintNftOnContract(mostRecentlyDeployed);
    }

    function mintNftOnContract(address basicNftAddress) public {
        vm.startBroadcast();
        BasicNft(basicNftAddress).mint(SHIBURI);
        vm.stopBroadcast();
    }
}
