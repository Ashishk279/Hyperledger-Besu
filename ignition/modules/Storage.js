const  {buildModule } = require("@nomicfoundation/hardhat-ignition/modules")

module.exports =  buildModule("LockModule", (m) => {
  const storage = m.contract("Storage");
  return { storage };
});


