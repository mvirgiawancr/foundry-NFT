// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {Vm} from "forge-std/Vm.sol";
import {DeployNft} from "script/DeployNft.s.sol";
import {BasicNft} from "src/BasicNft.sol";

contract BasicNftTest is Test {
    DeployNft private deployer;
    BasicNft private basicNft;
    address public USER = makeAddr("user");
    string public constant SHIBURI = "ipfs://bafkreieuzbrvf4kurxc4juku2vpg5p2yualytogdtkcbzuwqbjqwuowzou";

    function setUp() external {
        deployer = new DeployNft();
        basicNft = deployer.run();
    }

    function testNameIsCorrect() external view {
        string memory expectedName = "ShibNFT";
        string memory actualName = basicNft.name();
        assert(keccak256(abi.encodePacked(expectedName)) == keccak256(abi.encodePacked(actualName)));
    }

    function testCanMintAndHaveBalance() external {
        vm.prank(USER);
        basicNft.mint(SHIBURI);
        assert(basicNft.balanceOf(USER) == 1);
        assert(keccak256(abi.encodePacked(basicNft.tokenURI(0))) == keccak256(abi.encodePacked(SHIBURI)));
    }
}
