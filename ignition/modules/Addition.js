const  {buildModule } = require("@nomicfoundation/hardhat-ignition/modules")

module.exports =  buildModule("AdditionContract", (m) => {
  const abacus = m.contract("Abacus");
  return { abacus };
});
