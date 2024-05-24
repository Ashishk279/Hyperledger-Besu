# Hyperledger Besu with Hardhat Integration
This guide will help you set up a Hyperledger Besu node, create a test network, and deploy a smart contract using Hardhat.

# Prerequisites
Before you start, make sure you have the following installed:

Java 11+ (for running Hyperledger Besu)
Node.js and npm
Docker (optional, for running Besu in a container)

# Install Hyperledger Besu
Using Docker (Recommended)
Pull the Hyperledger Besu Docker image:

# Copy code
docker pull hyperledger/besu:latest

# Run a Besu node in a Docker container:

# Copy code
docker run -d --name besu-node -p 8545:8545 -p 30303:30303 hyperledger/besu:latest --network=dev --rpc-http-enabled --rpc-http-api=ETH,NET,IBFT,WEB3 --host-whitelist="*"

# Using Binary Distribution
Download the latest release from the official website.

Unzip the downloaded file:

# Copy code

besu --network=dev --miner-enabled --miner-coinbase=0xfe3b557e8fb62b89f4916b721be55ceb828dbd73 --rpc-http-cors-origins=all --host-allowlist=* --rpc-ws-enabled --rpc-http-enabled=true --data-path=/tmp/tmpDatdir

# Set Up Hardhat
Create a new Hardhat project

# Sample Hardhat Project

This project demonstrates a basic Hardhat use case. It comes with a sample contract, a test for that contract, and a Hardhat Ignition module that deploys that contract.

Try running some of the following tasks:

```shell
npx hardhat help
npx hardhat test
REPORT_GAS=true npx hardhat test
npx hardhat node
npx hardhat ignition deploy ./ignition/modules/Lock.js
