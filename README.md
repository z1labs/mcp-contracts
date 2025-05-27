# 🧠 ContextStore – MCP Context Hash Registry

This repository contains the ContextStore smart contract, a minimal on-chain registry that anchors hashed model contexts (weights, prompts, memory logs) for AI agents.

Built for the Model Context Protocol (MCP), ContextStore provides a cheap, auditable, and chain-agnostic way to persist the "what" and "when" of AI agent memory—without storing any raw data on-chain.

---

## ✨ Features

- 💾 Store 64-byte content identifiers (e.g. SHA-256, Blake3, or IPFS CID)
- 🔏 Immutable + timestamped entries per user address
- 🔐 zk-friendly format: hash-only payloads
- 🪙 Gas-efficient: ~35k gas per write
- 🌍 Chain-agnostic: designed for any EVM chain with basic precompiles

---

## 🛠 Use Case: Contextual GPT Agent with Wallet Memory

Every time a user sends a message to the AI agent, a hashed summary of the conversation (CID) is uploaded to IPFS and recorded on-chain via ContextStore.

This enables:

- Proof-of-memory ("I really said this")
- Replayable agent state
- Auditable, composable inference flows
- Incentivized memory registries (on-chain royalties)

---

## 🚀 Contract Overview

```solidity
contract ContextStore {
    event ContextPut(address indexed user, bytes32 indexed contextHash, uint256 timestamp);

    function putContext(bytes32 contextHash) external;
}


Function: putContext(bytes32 contextHash)
- Stores the 32-byte hash for msg.sender with current block.timestamp.
- Emits ContextPut(user, hash, ts) event.
- Can be called multiple times—each put represents a new context snapshot.


🧩 Integrations
✅ MCP-compliant tooling
✅ IPFS and Filecoin gateways
✅ zk circuits (Poseidon-friendly)