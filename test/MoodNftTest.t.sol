// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Test, console} from "forge-std/Test.sol";
import {MoodNft} from "src/MoodNft.sol";
import {DeployMoodNft} from "script/DeployMoodNft.s.sol";

contract MoodNftTest is Test {
    MoodNft private moodNft;
    DeployMoodNft private deployMoodNft;
    string private sadUri =
        "data:application/json;base64,eyJuYW1lIjoiTW9vZE5GVCIsICJkZXNjcmlwdGlvbiI6IkFuIE5GVCB0aGF0IHJlZmxlY3RzIHRoZSBtb29kIG9mIHRoZSBvd25lciwgMTAwJSBvbiBDaGFpbiEiLCAiYXR0cmlidXRlcyI6IFt7InRyYWl0X3R5cGUiOiAibW9vZGluZXNzIiwgInZhbHVlIjogMTAwfV0sICJpbWFnZSI6ImRhdGE6aW1hZ2Uvc3ZnK3htbDtiYXNlNjQsUEhOMlp5QjRiV3h1Y3owaWFIUjBjRG92TDNkM2R5NTNNeTV2Y21jdk1qQXdNQzl6ZG1jaUlIZHBaSFJvUFNJeE1EQWlJR2hsYVdkb2REMGlNVEF3SWlCMmFXVjNRbTk0UFNJd0lEQWdNVEF3SURFd01DSStDaUFnUENFdExTQk1hVzVuYTJGeVlXNGdaR0Z6WVhJZ0xTMCtDaUFnUEdOcGNtTnNaU0JqZUQwaU5UQWlJR041UFNJMU1DSWdjajBpTkRVaUlITjBjbTlyWlQwaVlteGhZMnNpSUhOMGNtOXJaUzEzYVdSMGFEMGlNaUlnWm1sc2JEMGliR2xuYUhSaWJIVmxJaTgrQ2lBZ1BDRXRMU0JOWVhSaElHdHBjbWtnTFMwK0NpQWdQR05wY21Oc1pTQmplRDBpTXpVaUlHTjVQU0kwTUNJZ2NqMGlOU0lnWm1sc2JEMGlZbXhoWTJzaUx6NEtJQ0E4SVMwdElFMWhkR0VnYTJGdVlXNGdMUzArQ2lBZ1BHTnBjbU5zWlNCamVEMGlOalVpSUdONVBTSTBNQ0lnY2owaU5TSWdabWxzYkQwaVlteGhZMnNpTHo0S0lDQThJUzB0SUVWcmMzQnlaWE5wSUhObFpHbG9JQzB0UGdvZ0lEeHdZWFJvSUdROUlrMHpOU3czTUNCUk5UQXNOVFVnTmpVc056QWlJSE4wY205clpUMGlZbXhoWTJzaUlITjBjbTlyWlMxM2FXUjBhRDBpTWlJZ1ptbHNiRDBpYm05dVpTSXZQZ284TDNOMlp6NEsifQ==";

    string private happyUri =
        "data:application/json;base64,eyJuYW1lIjoiTW9vZE5GVCIsICJkZXNjcmlwdGlvbiI6IkFuIE5GVCB0aGF0IHJlZmxlY3RzIHRoZSBtb29kIG9mIHRoZSBvd25lciwgMTAwJSBvbiBDaGFpbiEiLCAiYXR0cmlidXRlcyI6IFt7InRyYWl0X3R5cGUiOiAibW9vZGluZXNzIiwgInZhbHVlIjogMTAwfV0sICJpbWFnZSI6ImRhdGE6aW1hZ2Uvc3ZnK3htbDtiYXNlNjQsUEhOMlp5QjRiV3h1Y3owaWFIUjBjRG92TDNkM2R5NTNNeTV2Y21jdk1qQXdNQzl6ZG1jaUlIZHBaSFJvUFNJeE1EQWlJR2hsYVdkb2REMGlNVEF3SWlCMmFXVjNRbTk0UFNJd0lEQWdNVEF3SURFd01DSStJRHdoTFMwZ1RHbHVaMnRoY21GdUlHUmhjMkZ5SUMwdFBpQThZMmx5WTJ4bElHTjRQU0kxTUNJZ1kzazlJalV3SWlCeVBTSTBOU0lnYzNSeWIydGxQU0ppYkdGamF5SWdjM1J5YjJ0bExYZHBaSFJvUFNJeUlpQm1hV3hzUFNKNVpXeHNiM2NpTHo0Z1BDRXRMU0JOWVhSaElHdHBjbWtnTFMwK0lEeGphWEpqYkdVZ1kzZzlJak0xSWlCamVUMGlOREFpSUhJOUlqVWlJR1pwYkd3OUltSnNZV05ySWk4K0lEd2hMUzBnVFdGMFlTQnJZVzVoYmlBdExUNGdQR05wY21Oc1pTQmplRDBpTmpVaUlHTjVQU0kwTUNJZ2NqMGlOU0lnWm1sc2JEMGlZbXhoWTJzaUx6NGdQQ0V0TFNCVFpXNTVkVzBnTFMwK0lEeHdZWFJvSUdROUlrMHpOU3cyTUNCUk5UQXNOelVnTmpVc05qQWlJSE4wY205clpUMGlZbXhoWTJzaUlITjBjbTlyWlMxM2FXUjBhRDBpTWlJZ1ptbHNiRDBpYm05dVpTSXZQaUE4TDNOMlp6NEsifQ==";

    address USER = makeAddr("user");

    function setUp() external {
        deployMoodNft = new DeployMoodNft();
        moodNft = deployMoodNft.run();
    }

    function testFlipMoodToSad() external {
        vm.prank(USER);
        moodNft.mint();

        vm.prank(USER);
        moodNft.flipMood(0);

        assert(keccak256(abi.encodePacked(moodNft.tokenURI(0))) == keccak256(abi.encodePacked(sadUri)));
    }

    function testFlipMoodToHappy() external {
        vm.prank(USER);
        moodNft.mint();

        vm.prank(USER);
        moodNft.flipMood(0);

        vm.prank(USER);
        moodNft.flipMood(0);

        assert(keccak256(abi.encodePacked(moodNft.tokenURI(0))) == keccak256(abi.encodePacked(happyUri)));
    }
}
