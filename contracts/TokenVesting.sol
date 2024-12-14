// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

/**Created by Matt Lindborg
 * UAT MS582 Week 6
 * @title TokenVesting
 * @dev Token Vesting Contract
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */

contract TokenVesting {

    // state variables
    address beneficiary;
    uint256 startTime;
    uint256 vestingDuration;
    uint256 totalTokens;
    uint256 vestedTokens;
    uint256 claimedTokens;

    // events
    event TokensClaimed(address beneficiary, uint256 amount);

    constructor(
        address _beneficiary,
        uint256 _totalTokens,
        uint256 _vestingDuration
    ) payable {
        require(_beneficiary != address(0), "Beneficiary cannot be the zero address");
        require(_vestingDuration > 0, "Vesting duration must be greater than zero");
        require(msg.value == _totalTokens, "Must send exact Ether amount");

        beneficiary = _beneficiary;
        startTime = block.timestamp;
        vestingDuration = _vestingDuration;
        totalTokens = _totalTokens;
        claimedTokens = 0;
    }

    // allows beneficiary to claim vested tokens
    // should only release them once the vesting duration is finished
    function claimTokens() public payable {

        require(
            beneficiary == msg.sender,
            "Only the beneficiary can claim tokens."
        );

        uint256 claimable = getClaimableTokens();
        require (
            claimable > 0, 
            "No tokens available to be claimed at this time."
        );

        claimedTokens += claimable;

        // Transfer Ether to the beneficiary
        (bool success, ) = beneficiary.call{value: claimable}("");
        require(
            success, 
            "Ether transfer failed"
        );
        
        emit TokensClaimed(beneficiary, claimable);
    }

    // calculates and returns the number of tokens vested based on the current time
    function getVestedTokens() public view returns (uint256) {
        if (block.timestamp < startTime) {
            return 0; // no tokens vested before start time
        }
        
        uint256 elapsedTime = block.timestamp - startTime;

        if(elapsedTime > vestingDuration) {
            elapsedTime = vestingDuration; // cap elapsed time at vesting duration
        }

        return (totalTokens*elapsedTime)/vestingDuration;
    }

    // returns the tokens available to be claimed
    function getClaimableTokens() public view returns (uint256) {
        uint256 vested = getVestedTokens();
        return vested - claimedTokens;
    }
}
