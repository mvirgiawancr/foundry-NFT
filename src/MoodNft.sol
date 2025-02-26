// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract MoodNft is ERC721 {
    error MoodNft__YouAreNotTheOwner();

    string private s_sadImageUri;
    string private s_HappyImageUri;
    uint256 private s_tokenCounter;

    enum Mood {
        HAPPY,
        SAD
    }

    mapping(uint256 => Mood) private s_tokenIdToState;

    constructor(string memory sadImageUri, string memory happyImageUri) ERC721("MoodNFT", "MNFT") {
        s_sadImageUri = sadImageUri;
        s_HappyImageUri = happyImageUri;
        s_tokenCounter = 0;
    }

    function _baseURI() internal pure override returns (string memory) {
        return "data:application/json;base64,";
    }

    function mint() public {
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenCounter++;
    }

    function flipMood(uint256 _tokenId) public {
        if (getApproved(_tokenId) != msg.sender && ownerOf(_tokenId) != msg.sender) {
            revert MoodNft__YouAreNotTheOwner();
        }

        if (s_tokenIdToState[_tokenId] == Mood.HAPPY) {
            s_tokenIdToState[_tokenId] = Mood.SAD;
        } else {
            s_tokenIdToState[_tokenId] = Mood.HAPPY;
        }
    }

    function tokenURI(uint256 _tokenId) public view override returns (string memory) {
        string memory imageURI = s_HappyImageUri;

        if (s_tokenIdToState[_tokenId] == Mood.SAD) {
            imageURI = s_sadImageUri;
        } else {
            imageURI = s_HappyImageUri;
        }
        return string(
            abi.encodePacked(
                _baseURI(),
                Base64.encode(
                    bytes( // bytes casting actually unnecessary as 'abi.encodePacked()' returns a bytes
                        abi.encodePacked(
                            '{"name":"',
                            name(), // You can add whatever name here
                            '", "description":"An NFT that reflects the mood of the owner, 100% on Chain!", ',
                            '"attributes": [{"trait_type": "moodiness", "value": 100}], "image":"',
                            imageURI,
                            '"}'
                        )
                    )
                )
            )
        );
    }
}
