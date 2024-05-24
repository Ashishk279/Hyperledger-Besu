const { task } = require("hardhat/config");
require('dotenv').config()

require("@nomicfoundation/hardhat-toolbox");
task("accounts", "Prints the list of accounts", async (taskArgs, hre) => {
  const accounts = await hre.ethers.getSigners();

  for (const account of accounts) {
    // console.log(account.address);
    // console.log(account);
    const address = await account.getAddress();
    const balance = await account.provider.getBalance(address);
    const balanceETH = hre.ethers.formatEther(balance)
    console.log(account);
    console.log(address + " : " + balanceETH);
  }
});


/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.24",
  defaultNetwork: "besu",
  networks: {
    hardhat: {},
    besu: {
      url: process.env.URL, // URL of your Besu node
     accounts:[process.env.PRIVATE_KEY]
      // chainId: 1337 
        }
  },
  paths: {
    sources: "./contracts",
    tests: "./test",
    cache: "./cache",
    artifacts: "./artifacts"
  },
};
