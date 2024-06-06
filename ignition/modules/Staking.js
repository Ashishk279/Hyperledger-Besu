const  {buildModule } = require("@nomicfoundation/hardhat-ignition/modules")

module.exports =  buildModule("StakingDeployment", (m) => {
  const erc20 = m.contract("BlockTunixCoin");
  const staking = m.contract("Stake", [erc20])
  return { erc20, staking };
});