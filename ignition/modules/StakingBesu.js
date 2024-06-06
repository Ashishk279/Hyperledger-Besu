const  {buildModule } = require("@nomicfoundation/hardhat-ignition/modules")

module.exports =  buildModule("StakingBesu", (m) => {
  const stake = m.contract("StakeBesu");
  return { stake };
});