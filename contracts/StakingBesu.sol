// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract StakeBesu {
    address contractOwner;
    struct stake {
        address userAddress;
        uint256 stakeAmount;
        uint256 lastStakeTime;
        uint256 rewardRate;
        uint256 claimedReward;
        bool isStakingActive;
    }

    mapping(address => stake) public stakeDetails;

    constructor() {
        contractOwner = msg.sender;
    }

    function _checkContractOwner() internal view {
        require(msg.sender == contractOwner, "Only Owner.");
    }

    modifier onlyContractOwner() {
        _checkContractOwner();
        _;
    }

    function depositeRewardCoin() external payable onlyContractOwner {}

    function startStaking() external payable {
        require(msg.sender != contractOwner, "Owner not allowed.");
        require(msg.value > 0, "Stake Amount > 0");

        stake memory stakeEthers = stakeDetails[msg.sender];
        require(!stakeEthers.isStakingActive, "You already start staking.");

        stakeEthers.userAddress = msg.sender;
        stakeEthers.stakeAmount += msg.value;
        stakeEthers.lastStakeTime = block.timestamp;
        stakeEthers.rewardRate = 10;
        stakeEthers.isStakingActive = true;
        stakeDetails[msg.sender] = stakeEthers;
    }

    function CalculateReward(uint256 amount, uint256 rewardRate)
        private
        pure
        returns (uint256)
    {
        uint256 getReward = (amount * rewardRate) / 100;
        return getReward;
    }

    function increaseStakeAmount() external payable {
        stake memory stakeEthers = stakeDetails[msg.sender];
        require(stakeEthers.userAddress == msg.sender, "Address not matached");
        require(stakeEthers.isStakingActive, "Staking is not active.");
        require(msg.value > 0, "Amount > 0");

        uint256 additionalAmount = msg.value;
        stakeEthers.stakeAmount += additionalAmount;
        stakeEthers.lastStakeTime = block.timestamp;
        stakeDetails[msg.sender] = stakeEthers;
    }

    function claimReward() public {
        stake memory stakeEthers = stakeDetails[msg.sender];
        require(stakeEthers.userAddress == msg.sender, "Address not matched.");
        require(stakeEthers.isStakingActive, "Staking is not active.");
        require(
            stakeEthers.lastStakeTime + 20 seconds <= block.timestamp,
            "wait for 20 seconds to claim reward."
        );
        stakeEthers.claimedReward += CalculateReward(
            stakeEthers.stakeAmount,
            stakeEthers.rewardRate
        );
        stakeEthers.lastStakeTime = block.timestamp;
        stakeDetails[msg.sender] = stakeEthers;
    }

    function Unstake() external {
        stake memory stakeEthers = stakeDetails[msg.sender];
        require(stakeEthers.isStakingActive == true, "Staking is not active");
        payable(msg.sender).transfer(
            stakeEthers.stakeAmount + stakeEthers.claimedReward
        );
        delete stakeDetails[msg.sender];
    }

    function widthdrawReward(uint256 reward) external {
        stake memory stakeEthers = stakeDetails[msg.sender];
        require(msg.sender == stakeEthers.userAddress, "You are not a user.");
        require(
            reward >= stakeEthers.claimedReward,
            "Please check the reward first."
        );
        stakeEthers.claimedReward -= reward;
        payable(msg.sender).transfer(reward);
        stakeDetails[msg.sender] = stakeEthers;
    }

    function checkReward() public view returns (uint256) {
        stake memory stakeDetail = stakeDetails[msg.sender];
        return stakeDetail.claimedReward;
    }
}
