# Bridge UI State Sync Failure

## Context
- **Severity:** P2 (Data inconsistency, UI bug with workaround)
- **Network/Environment:** LitVM LiteForge (Zeeve RPC), Chain ID: 4441, RPC: https://rpc.testnet.liteforge.zeeve.net/, OS/Tools: iOS, MetaMask Mobile, Timestamp: 2026-11-20 23:45 (UTC+7)
- **Objective:** To verify UI state synchronization with on-chain transaction success.

## Steps to Reproduce
1. Connect MetaMask to LitVM LiteForge Testnet (Zeeve RPC).
2. Claim zkLTC from faucet.
3. Initiate a bridge transaction of 0.01 zkLTC to Sepolia via the Withdraw function.
4. Approve the transaction in MetaMask.
5. Observe the frontend UI status after transaction submission.

## Expected Result
The UI should display a "Success" or "Pending" status and update the user's balance accordingly after the transaction is confirmed on-chain.

## Actual Result
The UI returns a "Status unavailable" error. It fails to sync the frontend state with the on-chain data. Users may panic and attempt to re-submit the transaction multiple times, potentially causing bridge congestion.

## Evidence
- **Tx Hash/Log:** 0x0d4b66b9c01f2dd4af13adcd780711be90b621868b0fcd48b27b90b08ae41e1a
- **Explorer Link/Status:** SUCCESS (confirmed in 0.253s)
- **X Thread:** https://x.com/setriawindra_z/status/2123820084317782166
- **Status:** Published

## Reproducibility
1/1 (Observed consistently during the bridging attempt on 2026-11-20)

## Duplicate Check
No similar issue found in public discussions during the time of testing.
