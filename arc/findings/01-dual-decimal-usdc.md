# QA Verification: Dual-Decimal USDC Architecture on Arc Testnet

## Objective
To verify the distinct decimal implementations for Native USDC (18 decimals) and ERC-20 USDC (6 decimals) on the Arc Testnet, and to confirm network finality execution speed.

## Environment
- Network: Arc Testnet
- Chain ID: 5042002
- RPC: https://rpc.testnet.arc.io
- Contract Interacted: NativeFiatTokenV2_2

## Test Execution & Evidence
1. Executed a standard ERC-20 transfer of 20 USDC.
2. Transaction Hash: 0x0967dbc2fc2fd6e7087c38e8513e1e993417cb83f928fd1fc98a0899a8a46185
3. Monitored the block confirmation speed and the State changes via ArcScan Explorer.

## Findings (Verified)
### 1. Finality Performance
- The transaction achieved success and was confirmed within <= 0.51 seconds. This aligns with the BFT deterministic finality claim (no reorgs).

### 2. Dual-Decimal State Changes
Analysis of the state changes revealed the following:
- **Native Balance (18 Decimals):** The sender's native balance was deducted by exactly 0.00187856378703125 USDC. This specific fraction represents the gas fee, which was successfully routed to the Fee Recipient.
- **ERC-20 Balance (6 Decimals):** The actual token transfer amount is accurately reflected in the ERC-20 balance. The sender's balance decreased by exactly 20.000000 USDC, and the recipient's balance increased by 20.000000 USDC.

## Conclusion
The Dual-Decimal architecture on Arc is functioning as intended. The separation of the native gas accounting (18 decimals) and the ERC-20 transfer state (6 decimals) is cleanly managed by the `NativeFiatTokenV2_2` contract without causing balance discrepancy or UI display conflicts.
