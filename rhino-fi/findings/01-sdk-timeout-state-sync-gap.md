# SDK Bridge Timeout Without On-Chain Fallback Mechanism

## Context
- **Severity:** P2
- **Network/Environment:** SDK `@rhino.fi/sdk` (Documentation Review)
- **Objective:** Analyze the state sync and error handling flow in the `rhinoSdk.bridge()` method.

## Steps to Reproduce (Analytical)
1. Initiate a bridge with a low `timeoutSeconds` (e.g., 60 seconds) or leave it at the default (10 minutes).
2. Bridge from a chain with slow finality (e.g., Ethereum Mainnet to Solana) where the withdrawal process takes longer than the timeout limit.
3. The deposit to the bridge contract on the origin chain succeeds (`depositTxHash` is generated).
4. The SDK polls the Rhino API and hits the `timeoutSeconds` limit.

## Expected Result
If the polling times out, the SDK should still return the `depositTxHash` so the user can manually verify the status on a block explorer, or automatically fall back to querying on-chain RPC for the final status.

## Actual Result
According to the documentation, if the timeout is reached, the function returns an `error` object and `data` will be `null`. This deprives the user of the `depositTxHash` in the return value, leaving the transaction state ambiguous (funds appear stuck).

## Evidence
- **Log/Docs:** https://docs.rhino.fi/sdk/bridging
- **Quote:** "By default the polling will be aborted after a default timeout of 10 minutes."
- **Status:** Not reported.

## Impact
Users might assume the transaction failed and attempt to bridge again, potentially causing duplicate deposits (double-spend) or confusion when troubleshooting the funds' state on the origin chain.

## Reproducibility
N/A (Static Analysis / Documentation Review)

## Duplicate Check
Not checked (based on SDK documentation analysis).
