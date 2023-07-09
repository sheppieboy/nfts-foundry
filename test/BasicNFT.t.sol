// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;
import "forge-std/Test.sol";
import "../script/DeployBasicNFT.sol";
import "../src/BasicNFT.sol";

contract BasicNFTTest is Test {
    DeployBasicNFT public deployer;
    BasicNFT public basicNFT;

    function setUp() public {
        deployer = new DeployBasicNFT();
        basicNFT = deployer.run();
    }
}
