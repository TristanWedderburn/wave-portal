// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0; // version of Solidity we want our program to use

import "hardhat/console.sol";

contract WavePortal {
    // State Variables
    uint256 totalWaves; // Automatically initialized to 0 & permanently stored in contract storage.
    mapping(address => uint256) public waversMap;
    address[] waverAddresses;

    constructor() {
        console.log("Wave Portal activated.");
    }

    function wave() public {
        totalWaves+=1;
        waversMap[msg.sender]+=1;
        waverAddresses.push(msg.sender);
        console.log("%s waved.", msg.sender); // msg.sender is the wallet address that invoked the function.
    }

    function getTopWaver() public view {
        if (waverAddresses.length == 0) {
            console.log("No waves received yet so there's no top waver.");
            return;
        }

        address topWaver;
        uint256 maxWaves;

        for(uint i; i < waverAddresses.length; i++){
            address currentAddress = waverAddresses[i];
            uint256 numOfWaves = waversMap[currentAddress];
            if (numOfWaves > maxWaves) {
                maxWaves = numOfWaves;
                topWaver = currentAddress;
            }
        }

        console.log("The current top waver is %s with %d wave(s)!", topWaver, maxWaves);
    }

    function getTotalWaves() public view returns (uint256) {
        console.log("We've received %d total waves.", totalWaves);
        return totalWaves;
    }
} 