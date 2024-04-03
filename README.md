# contract-deploy-test

## Example

```sh
# start anvil with other console
anvil

# deploy
forge create src/Erc20TestToken.sol:Erc20TestToken --rpc-url http://127.0.0.1:8545 --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
forge create src/Erc721TestNft.sol:Erc721TestNft --rpc-url http://127.0.0.1:8545 --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
forge create src/Erc1155TestNft.sol:Erc1155TestNft --rpc-url http://127.0.0.1:8545 --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80

# Erc20TestToken example
cast call 0x5fbdb2315678afecb367f032d93f642f64180aa3 "symbol()(string)" --rpc-url http://localhost:8545
cast call 0x5fbdb2315678afecb367f032d93f642f64180aa3 "name()(string)" --rpc-url http://localhost:8545
cast call 0x5fbdb2315678afecb367f032d93f642f64180aa3 "totalSupply()(uint256)" --rpc-url http://localhost:8545
cast call 0x5fbdb2315678afecb367f032d93f642f64180aa3 "balanceOf(address)(uint256)" 0x70997970C51812dc3A010C7d01b50e0d17dc79C8 --rpc-url http://localhost:8545
cast send 0x5fbdb2315678afecb367f032d93f642f64180aa3 --private-key 0x59c6995e998f97a5a0044966f0945389dc9e86dae88c7a8412f4603b6b78690d "mint(address,uint256)" 0x70997970C51812dc3A010C7d01b50e0d17dc79C8 1000 --rpc-url http://localhost:8545
cast call 0x5fbdb2315678afecb367f032d93f642f64180aa3 "balanceOf(address)(uint256)" 0x70997970C51812dc3A010C7d01b50e0d17dc79C8 --rpc-url http://localhost:8545
cast send 0x5fbdb2315678afecb367f032d93f642f64180aa3 --private-key 0x59c6995e998f97a5a0044966f0945389dc9e86dae88c7a8412f4603b6b78690d "transfer(address,uint256)" 0x3C44CdDdB6a900fa2b585dd299e03d12FA4293BC 600 --rpc-url http://localhost:8545
cast call 0x5fbdb2315678afecb367f032d93f642f64180aa3 "balanceOf(address)(uint256)" 0x70997970C51812dc3A010C7d01b50e0d17dc79C8 --rpc-url http://localhost:8545
cast call 0x5fbdb2315678afecb367f032d93f642f64180aa3 "balanceOf(address)(uint256)" 0x3C44CdDdB6a900fa2b585dd299e03d12FA4293BC --rpc-url http://localhost:8545
cast send 0x5fbdb2315678afecb367f032d93f642f64180aa3 --private-key 0x5de4111afa1a4b94908f83103eb1f1706367c2e68ca870fc3fb9a804cdab365a "burn(address,uint256)" 0x3C44CdDdB6a900fa2b585dd299e03d12FA4293BC 600 --rpc-url http://localhost:8545
cast call 0x5fbdb2315678afecb367f032d93f642f64180aa3 "balanceOf(address)(uint256)" 0x3C44CdDdB6a900fa2b585dd299e03d12FA4293BC --rpc-url http://localhost:8545
cast send 0x5fbdb2315678afecb367f032d93f642f64180aa3 --private-key 0x59c6995e998f97a5a0044966f0945389dc9e86dae88c7a8412f4603b6b78690d "burn(address,uint256)" 0x70997970C51812dc3A010C7d01b50e0d17dc79C8 400 --rpc-url http://localhost:8545
cast call 0x5fbdb2315678afecb367f032d93f642f64180aa3 "balanceOf(address)(uint256)" 0x70997970C51812dc3A010C7d01b50e0d17dc79C8 --rpc-url http://localhost:8545

# Erc721TestNft example
cast send 0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512 --private-key 0x59c6995e998f97a5a0044966f0945389dc9e86dae88c7a8412f4603b6b78690d "mint(address,uint256)" 0x70997970C51812dc3A010C7d01b50e0d17dc79C8 1 --rpc-url http://localhost:8545
cast call 0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512 "tokenURI(uint256)(string)" 1 --rpc-url http://localhost:8545
cast call 0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512 "ownerOf(uint256)(address)" 1 --rpc-url http://localhost:8545
cast call 0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512 "balanceOf(address)(uint256)" 0x70997970C51812dc3A010C7d01b50e0d17dc79C8 --rpc-url http://localhost:8545
cast send 0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512 --private-key 0x59c6995e998f97a5a0044966f0945389dc9e86dae88c7a8412f4603b6b78690d "safeTransferFrom(address,address,uint256)" 0x70997970C51812dc3A010C7d01b50e0d17dc79C8 0x3C44CdDdB6a900fa2b585dd299e03d12FA4293BC 1 --rpc-url http://localhost:8545
cast call 0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512 "balanceOf(address)(uint256)" 0x70997970C51812dc3A010C7d01b50e0d17dc79C8 --rpc-url http://localhost:8545
cast call 0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512 "balanceOf(address)(uint256)" 0x3C44CdDdB6a900fa2b585dd299e03d12FA4293BC --rpc-url http://localhost:8545
cast send 0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512 --private-key 0x5de4111afa1a4b94908f83103eb1f1706367c2e68ca870fc3fb9a804cdab365a "burn(uint256)" 1 --rpc-url http://localhost:8545
cast call 0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512 "balanceOf(address)(uint256)" 0x3C44CdDdB6a900fa2b585dd299e03d12FA4293BC --rpc-url http://localhost:8545

# Erc1155TestNft example
cast send 0x9fE46736679d2D9a65F0992F2272dE9f3c7fa6e0 --private-key 0x59c6995e998f97a5a0044966f0945389dc9e86dae88c7a8412f4603b6b78690d "mint(address,uint256,uint256,bytes)" 0x70997970C51812dc3A010C7d01b50e0d17dc79C8 1 100 0x --rpc-url http://localhost:8545
cast call 0x9fE46736679d2D9a65F0992F2272dE9f3c7fa6e0 "balanceOf(address,uint256)(uint256)" 0x70997970C51812dc3A010C7d01b50e0d17dc79C8 1 --rpc-url http://localhost:8545
cast send 0x9fE46736679d2D9a65F0992F2272dE9f3c7fa6e0 --private-key 0x59c6995e998f97a5a0044966f0945389dc9e86dae88c7a8412f4603b6b78690d "safeTransferFrom(address,address,uint256,uint256,bytes)" 0x70997970C51812dc3A010C7d01b50e0d17dc79C8 0x3C44CdDdB6a900fa2b585dd299e03d12FA4293BC 1 10 0x --rpc-url http://localhost:8545
cast call 0x9fE46736679d2D9a65F0992F2272dE9f3c7fa6e0 "balanceOf(address,uint256)(uint256)" 0x70997970C51812dc3A010C7d01b50e0d17dc79C8 1 --rpc-url http://localhost:8545
cast call 0x9fE46736679d2D9a65F0992F2272dE9f3c7fa6e0 "balanceOf(address,uint256)(uint256)" 0x3C44CdDdB6a900fa2b585dd299e03d12FA4293BC 1 --rpc-url http://localhost:8545
cast send 0x9fE46736679d2D9a65F0992F2272dE9f3c7fa6e0 --private-key 0x59c6995e998f97a5a0044966f0945389dc9e86dae88c7a8412f4603b6b78690d "burn(address,uint256,uint256)" 0x70997970C51812dc3A010C7d01b50e0d17dc79C8 1 10 --rpc-url http://localhost:8545
cast send 0x9fE46736679d2D9a65F0992F2272dE9f3c7fa6e0 --private-key 0x5de4111afa1a4b94908f83103eb1f1706367c2e68ca870fc3fb9a804cdab365a "burn(address,uint256,uint256)" 0x3C44CdDdB6a900fa2b585dd299e03d12FA4293BC 1 10 --rpc-url http://localhost:8545
cast call 0x9fE46736679d2D9a65F0992F2272dE9f3c7fa6e0 "balanceOf(address,uint256)(uint256)" 0x70997970C51812dc3A010C7d01b50e0d17dc79C8 1 --rpc-url http://localhost:8545
cast call 0x9fE46736679d2D9a65F0992F2272dE9f3c7fa6e0 "balanceOf(address,uint256)(uint256)" 0x3C44CdDdB6a900fa2b585dd299e03d12FA4293BC 1 --rpc-url http://localhost:8545
cast send 0x9fE46736679d2D9a65F0992F2272dE9f3c7fa6e0 --private-key 0x59c6995e998f97a5a0044966f0945389dc9e86dae88c7a8412f4603b6b78690d "burn(address,uint256,uint256)" 0x70997970C51812dc3A010C7d01b50e0d17dc79C8 1 80 --rpc-url http://localhost:8545
cast call 0x9fE46736679d2D9a65F0992F2272dE9f3c7fa6e0 "balanceOf(address,uint256)(uint256)" 0x70997970C51812dc3A010C7d01b50e0d17dc79C8 1 --rpc-url http://localhost:8545
```

## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

- **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
- **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
- **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
- **Chisel**: Fast, utilitarian, and verbose solidity REPL.

### Documentation

<https://book.getfoundry.sh/>

### Usage

#### Build

```shell
forge build
```

#### Test

```shell
forge test
```

#### Format

```shell
forge fmt
```

#### Gas Snapshots

```shell
forge snapshot
```

#### Anvil

```shell
anvil
```

#### Deploy

```shell
forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

#### Cast

```shell
cast <subcommand>
```

#### Help

```shell
forge --help
anvil --help
cast --help
```
