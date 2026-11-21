# QA Report: SimpleChain

**Tester:** @setriawindra_z
**Date:** 21 Nov 2026
**Network:** SimpleChain Testnet

## Scope of Testing
- Environment: Foundry (Forge & Cast)
- Action: Write transaction, Read state, RPC latency check.

## Test Results & Findings

### 1. SimpleChain Execution (Bug Found)
- **Action:** Executed `cast send` and `cast call` via terminal.
- **Result:** Transactions executed.
- **Bug (RPC):** Found RPC endpoint bug and latency issue. Isolated the anomaly via explorer sync.
- **Status:** Passed with issues.

## Recommendations for Dev Team
1. Investigate the RPC endpoint latency on SimpleChain. It causes sync delays between terminal output and explorer state.
