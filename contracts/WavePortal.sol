// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0; // version of Solidity we want our program to use

import "hardhat/console.sol";

contract WavePortal {
    // State Variables
    uint256 totalWaves; // Automatically initialized to 0 & permanently stored in contract storage.

    constructor() {
        console.log("Wave Portal activated.");
    }

    function wave() public {
        totalWaves+=1;
        console.log("%s waved", msg.sender); // msg.sender is the wallet address that invoked the function.
    }

    function getTotalWaves() public view returns (uint256) {
        console.log("We've received %d total waves", totalWaves);
        return totalWaves;
    }
} 