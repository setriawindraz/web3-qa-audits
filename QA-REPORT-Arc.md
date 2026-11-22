# QA Report: Arc Testnet

**Tester:** @setriawindra_z
**Date:** 22 Nov 2026
**Network:** Arc Testnet (Chain ID: 5042002)
**Explorer:** explorer.testnet.arc.io

## Scope of Testing
- Environment: MetaMask (Mobile), Web UI
- Action: Faucet claim, USDC transfer, Transaction finality check.

## Test Results & Findings

### 1. USDC Transfer (Success)
- **Action:** Self-transfer 0.1 USDC.
- **Tx Hash:** `0x4e23eebda6ad794edb42b936c8ec36b8e79da705cced7b4ef03c0dff985cbf85`
- **Status:** Success. Confirmed in <= 0.5 secs.
- **Gas Used:** 27.7 Gwei. Fee: 0.000525 USDC.
- **Observation:** Arc uses USDC as native gas token. No separate ETH-like token. Native balance (18 decimals) vs ERC-20 interface (6 decimals) is a key architectural difference.

## Analysis
- **Finality:** Deterministic. Transaction is final as soon as included in a block (sub-second). No need for multiple confirmations.
- **Risk:** Low for simple transfers. High if contract logic does not account for USDC decimal differences (18 vs 6).

## Recommendations for Dev Team
1. Ensure all frontend/backend systems correctly handle the dual-decimal nature of USDC on Arc (18 decimals native, 6 decimals ERC-20).
2. Audit contract logic for any hardcoded gas token assumptions (e.g., expecting ETH).
