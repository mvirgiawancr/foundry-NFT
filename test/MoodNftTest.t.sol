// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Test, console} from "forge-std/Test.sol";
import {Vm} from "forge-std/Vm.sol";
import {MoodNft} from "src/MoodNft.sol";

contract MoodNftTest is Test {
    MoodNft private moodNft;
    string private sadUri =
        "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMDAiIGhlaWdodD0iMTAwIiB2aWV3Qm94PSIwIDAgMTAwIDEwMCI+PCEtLSBMaW5na2FyYW4gZGFzYXIgLS0+PGNpcmNsZSBjeD0iNTAiIGN5PSI1MCIgcj0iNDUiIHN0cm9rZT0iYmxhY2siIHN0cm9rZS13aWR0aD0iMiIgZmlsbD0ibGlnaHRibHVlIi8+PCEtLSBNYXRhIGtpcmkgLS0+PGNpcmNsZSBjeD0iMzUiIGN5PSI0MCIgcj0iNSIgZmlsbD0iYmxhY2siLz4gIS0tIE1hdGEga2FuYW4gLS0+PGNpcmNsZSBjeD0iNjUiIGN5PSI0MCIgcj0iNSIgZmlsbD0iYmxhY2siLz4gIS0tIEVrc3ByZXNpIHNlZGloIC0tPjxwYXRoIGQ9Ik0zNSw3MCBRNTAsNTUgNjUsNzAiIHN0cm9rZT0iYmxhY2siIHN0cm9rZS13aWR0aD0iMiIgZmlsbD0ibm9uZSIvPjwvc3ZnPg==";

    string private happyUri =
        "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMDAiIGhlaWdodD0iMTAwIiB2aWV3Qm94PSIwIDAgMTAwIDEwMCI+PCEtLSBMaW5na2FyYW4gZGFzYXIgLS0+PGNpcmNsZSBjeD0iNTAiIGN5PSI1MCIgcj0iNDUiIHN0cm9rZT0iYmxhY2siIHN0cm9rZS13aWR0aD0iMiIgZmlsbD0ieWVsbG93Ii8+PCEtLSBNYXRhIGtpcmkgLS0+PGNpcmNsZSBjeD0iMzUiIGN5PSI0MCIgcj0iNSIgZmlsbD0iYmxhY2siLz4gIS0tIE1hdGEga2FuYW4gLS0+PGNpcmNsZSBjeD0iNjUiIGN5PSI0MCIgcj0iNSIgZmlsbD0iYmxhY2siLz4gIS0tIFNlbnl1bSAtLT4KPGNpcmNsZSBjeD0iMzUiIGN5PSI0MCIgcj0iNSIgZmlsbD0iYmxhY2siLz4KPGNpcmNsZSBjeD0iNjUiIGN5PSI0MCIgcj0iNSIgZmlsbD0iYmxhY2siLz4gIS0tIFNlbnl1bSAtLT4KPGNpcmNsZSBjeD0iMzUiIGN5PSI0MCIgcj0iNSIgZmlsbD0iYmxhY2siLz4KPGNpcmNsZSBjeD0iNjUiIGN5PSI0MCIgcj0iNSIgZmlsbD0iYmxhY2siLz4KPHBhdGggZD0iTTM1LDYwIFFNTCw3NSA2NSw2MCIgc3Ryb2tlPSJibGFjayIgc3Ryb2tlLXdpZHRoPSIyIiBmaWxsPSJub25lIi8+PC9zdmc+Cg==";

    address USER = makeAddr("user");

    function setUp() external {
        moodNft = new MoodNft(sadUri, happyUri);
    }

    function testView() external {
        vm.prank(USER);
        moodNft.mint();
        console.log(moodNft.tokenURI(0));
    }
}
