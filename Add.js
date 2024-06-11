const { ethers } = require('hardhat')
require('dotenv').config();

const provider =  ethers.provider

// Get the contract address and ABI
const contractAddress = "0x42699A7612A82f1d9C36148af9C77354759b210b";
const contractABI = [
    {
      "inputs": [
        {
          "internalType": "int256",
          "name": "n",
          "type": "int256"
        }
      ],
      "name": "addInteger",
      "outputs": [],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "inputs": [],
      "name": "sumOfIntegers",
      "outputs": [
        {
          "internalType": "int256",
          "name": "",
          "type": "int256"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    }
  ];

// Create a contract instance
const contract = new ethers.Contract(contractAddress, contractABI, provider);
const setValue = async () => {
    const signer = await ethers.getSigner("0xFE3B557E8Fb62b89F4916B721be55cEb828dBd73")
    const contract = new ethers.Contract(contractAddress, contractABI, signer);
    const transaction = await contract.addInteger(10);
    await transaction.wait();
    console.log("Transaction hash:", transaction);
}
setValue()