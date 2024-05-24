const { ethers } = require('hardhat')
require('dotenv').config();

const provider =  ethers.provider

// Get the contract address and ABI
const contractAddress = "0x42699A7612A82f1d9C36148af9C77354759b210b";
const contractABI = [
    {
        "inputs": [],
        "name": "data",
        "outputs": [
            {
                "internalType": "uint256",
                "name": "",
                "type": "uint256"
            }
        ],
        "stateMutability": "view",
        "type": "function"
    },
    {
        "inputs": [
            {
                "internalType": "uint256",
                "name": "_data",
                "type": "uint256"
            }
        ],
        "name": "set",
        "outputs": [],
        "stateMutability": "nonpayable",
        "type": "function"
    }
];

// Create a contract instance
const contract = new ethers.Contract(contractAddress, contractABI, provider);

// Read a variable from the contract
const data = async () => {
    const value = await contract.data();
    console.log("Value:", value);
}

// data()

// Write to the contract

const setValue = async () => {
    const signer = await ethers.getSigner("0xFE3B557E8Fb62b89F4916B721be55cEb828dBd73")
    const contract = new ethers.Contract(contractAddress, contractABI, signer);
    const transaction = await contract.set(10);
    await transaction.wait();
    console.log("Transaction hash:", transaction);
}
setValue()