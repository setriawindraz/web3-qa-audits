# QA Report: BOT Chain Testnet (Bohr)

**Tester:** @setriawindra_z
**Date:** 19 Nov 2026
**Network:** BOT Chain Testnet (Chain ID: 968)
**Explorer:** scan.bohr.life
**RPC Tested:** rpc.bohr.life

## Scope of Testing
- Environment: Foundry (Forge & Cast)
- Action: Contract deployment, Write transaction, Read state.
- Contract Address: 0xB05006D9d9f1E3195B3EE98d767d5e1b34b0fD66

## Test Results & Findings

### 1. Contract Deployment (Success)
- **Action:** Deployed `QAContract.sol` via `forge create`.
- **Result:** Transaction succeeded. Contract address generated.
- **Gas Used:** 211510 (Calculated via terminal).
- **Status:** Passed.

### 2. Write Transaction & Explorer UI (Bug Found)
- **Action:** Executed `setValue(123)` via `cast send`.
- **Result:** Transaction status `1 (success)`. Explorer shows transaction as `Finalized`.
- **Bug (UI):** In the explorer "Blockchain Info" tab, **GAS USED** displays `0`. However, terminal shows `211510` gas was actually used. Explorer fails to parse gas data for this contract creation/transaction.

### 3. Read State & RPC Sync (Critical Bug Found)
- **Action:** Attempted to read `value()` via `cast call` and check transaction via `cast tx`.
- **Result:** Both commands failed. 
- **Error:** `contract does not have any code` and `tx not found`.
- **Analysis:** The public RPC endpoint (`rpc.bohr.life`) is not synced with the explorer indexer. The explorer shows the transaction as `Finalized`, but the RPC node claims the transaction and contract do not exist. This is a severe state lag issue.

## Recommendations for Dev Team
1. Check the Blockscout indexer configuration for gas calculation on contract interactions.
2. Investigate RPC node sync status. Public RPC nodes must be in sync with the block production to allow developers to read contract states.
