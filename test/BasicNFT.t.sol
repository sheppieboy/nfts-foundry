// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;
import "forge-std/Test.sol";
import "../script/DeployBasicNFT.sol";
import "../src/BasicNFT.sol";

contract BasicNFTTest is Test {
    DeployBasicNFT public deployer;
    BasicNFT public basicNFT;
    address public mockUser = makeAddr("testUser");
    string public constant mockURI = "ansklnalksn";

    function setUp() public {
        deployer = new DeployBasicNFT();
        basicNFT = deployer.run();
    }

    function test_NameISCorrect() public {
        string memory setName = "Dog";
        assertEq(setName, basicNFT.name());
    }

    function test_CanMintWithValidAddress() public {
        vm.prank(mockUser);
        basicNFT.mintNFT(mockURI);
        assertEq(basicNFT.balanceOf(mockUser), 1);
        assertEq(mockURI, basicNFT.tokenURI(0));
    }
}
