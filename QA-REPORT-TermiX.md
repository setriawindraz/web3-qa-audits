# QA Report: TermiX

**Tester:** @setriawindra_z
**Date:** 21 Nov 2026
**Network:** BNB Mainnet (Chain ID: 56)
**Explorer:** bscscan.com
**RPC Tested:** bsc-dataseed.binance.org

## Scope of Testing
- Environment: Foundry (Forge & Cast)
- Action: Agent NFT Minting, Smart Contract Interaction.
- Target: TermiX Agent Registry.

## Test Results & Findings

### 1. CLI Execution (Failed)
- **Action:** Executed `cast send $NFT "mint()"` via terminal.
- **Result:** Transaction failed. Error: `execution reverted`.
- **Gas Used:** Failed to estimate gas. RPC connection reset by peer (OS error 54).
- **Status:** Failed.

### 2. Web UI Execution (Success)
- **Action:** Manual fallback via Web UI.
- **Result:** Transaction succeeded. Agent identity registered on-chain.
- **TX 1:** `0xc7310dc8a48d9a53f6ea739b9765f411749f046bf1ccb7f20feb6350f9bbf2bf`
- **TX 2:** `0x8c796c176309bf1258b3b48339e64a396b9f9a75cd2a7b0aa5fdf4dea83a90d7`
- **Status:** Passed.

## Recommendations for Dev Team
1. Investigate the CLI `execution reverted` error during gas estimation. UI transaction succeeds, suggesting a parameter mismatch or missing contract state initialization in the CLI method.
2. Check RPC node stability. Connection reset by peer occurred on the default public RPC endpoint.
