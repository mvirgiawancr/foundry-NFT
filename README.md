# Foundry NFT Collection

This is a smart contract project for creating both basic NFTs and dynamic on-chain NFTs using Foundry. Based on the Cyfrin Solidity Course, this project implements ERC-721 tokens with both static and dynamic metadata that can change based on interactions.

## 📌 Features

- Basic NFT implementation with static metadata
- Dynamic NFT with on-chain SVG generation and mood-changing functionality
- Comprehensive testing suite across multiple environments
- Gas-optimized contract deployment and verification
- Built with Foundry for robust Ethereum development

## 🚀 Getting Started

### 1. Install Requirements

Make sure you have installed:

- Git
- Foundry
- Optional: Gitpod for cloud development

### 2. Clone the Repository

```bash
git clone https://github.com/mvirgiawancr/foundry-NFT.git
cd foundry-NFT
forge build
```

### 3. Configure Environment Variables

Create a `.env` file based on `.env.example`, then add:

```
SEPOLIA_RPC_URL=<your_rpc_url>
PRIVATE_KEY=<your_private_key>
ETHERSCAN_API_KEY=<your_etherscan_api_key>
```

## 🔧 Usage

### 1. Start a Local Node

```bash
make anvil
```

### 2. Connect MetaMask to Anvil Local Network

To view your NFTs in MetaMask while using Anvil:

1. Open MetaMask and add a new network with these settings:

   - Network Name: Anvil Local
   - RPC URL: http://127.0.0.1:8545
   - Chain ID: 31337
   - Currency Symbol: ETH

2. Import an Anvil test account to MetaMask:

   - Click on "Import Account" in MetaMask
   - Enter one of the private keys provided by Anvil when it starts (e.g., the default key: `0x59c6995e998f97a5a0044966f0945389dc9e86dae88c7a8412f4603b6b78690d`)
   - This account should have 10,000 test ETH

3. After minting NFTs on your local network, they will be visible in the "NFTs" tab of MetaMask
   - You may need to manually add the NFT with the collection contract address and token ID

### 2. Deploy Smart Contracts

For local deployment:

```bash
# Deploy Basic NFT
make deploy

# Deploy Dynamic Mood NFT
make deployMood
```

For testnet deployment:

```bash
make deploy ARGS="--network sepolia"
make deployMood ARGS="--network sepolia"
```

### 3. Minting NFTs

For local testing:

```bash
# Mint Basic NFT
make mint

# Mint Mood NFT
make mintMood
```

For testnet:

```bash
make mint ARGS="--network sepolia"
make mintMood ARGS="--network sepolia"
```

### 4. Change Dynamic NFT State

To flip the mood of your dynamic NFT:

```bash
make flipMood
```

### 5. Testing

Run various test suites:

```bash
# Local tests
forge test

# Forked network tests
forge test --fork-url $SEPOLIA_RPC_URL

# Test coverage
forge coverage
```

## 📊 Scripts and Utilities

### Gas Estimation

```bash
forge snapshot
```

### Code Formatting

```bash
forge fmt
```

### Interact with Deployed Contract

```bash
# Mint basic NFT
cast send <BASIC_NFT_ADDRESS> "mintNft()" --private-key <PRIVATE_KEY> --rpc-url $SEPOLIA_RPC_URL

# Mint mood NFT
cast send <MOOD_NFT_ADDRESS> "mintNft()" --private-key <PRIVATE_KEY> --rpc-url $SEPOLIA_RPC_URL

# Flip mood
cast send <MOOD_NFT_ADDRESS> "flipMood(uint256)" <TOKEN_ID> --private-key <PRIVATE_KEY> --rpc-url $SEPOLIA_RPC_URL
```

### 6. Viewing NFTs in MetaMask

To add your NFT to MetaMask for viewing:

1. Go to the "NFTs" tab in MetaMask
2. Click "Import NFT"
3. Enter the following details:
   - NFT Address: The deployed contract address
   - Token ID: The ID of your minted NFT (usually starting from 0)

For the dynamic mood NFT, when you flip the mood:

1. The transaction will update the NFT's on-chain data
2. Refresh MetaMask to see the updated image
3. If the image doesn't update immediately, you may need to clear your browser cache

Note: When using Anvil, your NFTs will persist only as long as your local node is running. Restarting Anvil will reset the blockchain state unless you've configured it to persist data.

## 🧩 Contract Architecture

### BasicNft

A simple ERC-721 implementation with static metadata pointing to IPFS or a centralized server.

### MoodNft

A dynamic NFT that stores SVG data on-chain and can switch between two moods (happy and sad) based on user interaction.

Key features:

- On-chain SVG storage and encoding
- Base64 encoding for tokenURI generation
- Interactive functions to change NFT appearance

## 🔗 Dependencies

This project uses the following libraries:

```bash
forge install openzeppelin/openzeppelin-contracts --no-commit
forge install cyfrin/foundry-devops --no-commit
```

## 📜 License

This project is created for learning purposes and is free to use for further development.

## 💙 Thank You!

If you like this project, don't forget to ⭐ the repository on GitHub!

Made with 💖 by Virgi
