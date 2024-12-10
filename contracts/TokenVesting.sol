// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

/**Created by Matt Lindborg
 * UAT MS582 Week 6
 * @title TokenVesting
 * @dev Token Vesting Contract
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */
 
 contract TokenVesting {
    // use expressions and control structures to ensure the vested tokens
    // are only claimable after the vesting duration is finished.
    address beneficiary;
    uint256 startTime;
    uint256 vestingDuration;
    uint256 totalTokens;

    constructor() {
        // initialize the four state variables
    }

    function claimTokens() public {
        // allows beneficiary to claim vested tokens
        // should only release them once the vesting duration is finished
    }

    function getVestedTokens() public view returns(uint256) {
        // calculates and returns the number of tokens vested based on the current time
    }
 }