// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";
import {BasicNft} from "src/BasicNft.sol";
import {MoodNft} from "src/MoodNft.sol";

contract MintBasicNft is Script {
    string public constant SHIBURI = "ipfs://bafkreieuzbrvf4kurxc4juku2vpg5p2yualytogdtkcbzuwqbjqwuowzou";

    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment("BasicNft", block.chainid);
        mintNftOnContract(mostRecentlyDeployed);
    }

    function mintNftOnContract(address basicNftAddress) public {
        vm.startBroadcast();
        BasicNft(basicNftAddress).mint(SHIBURI);
        vm.stopBroadcast();
    }
}

contract MintMoodNft is Script {
    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment("MoodNft", block.chainid);
        mintNftOnContract(mostRecentlyDeployed);
    }

    function mintNftOnContract(address moodNftAddress) public {
        vm.startBroadcast();
        MoodNft(moodNftAddress).mint();
        vm.stopBroadcast();
    }
}

contract FlippingMoodNft is Script {
    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment("MoodNft", block.chainid);
        flipNftOnContract(mostRecentlyDeployed);
    }

    function flipNftOnContract(address moodNftAddress) public {
        vm.startBroadcast();
        MoodNft(moodNftAddress).flipMood(0);
        vm.stopBroadcast();
    }
}
