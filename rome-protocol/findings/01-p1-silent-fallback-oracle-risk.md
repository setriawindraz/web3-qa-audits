# P1: Silent Fallback in Price Shims Bypasses PriceOracleSentinel

## Environment
- Network: Rome Hadrian Testnet (Chain ID 200010)
- Contracts: `PriceOracleSentinel.sol`, `BookFeedToV2ShimResilient.sol`
- Repo: `rome-protocol/rome-aave-v3`

## Summary
The `BookFeedToV2ShimResilient` contract silently falls back to a hardcoded `fallbackSource.latestAnswer()` if the primary `BookFeedAdapter` reverts (stale, paused, or low confidence). However, the `PriceOracleSentinel` only monitors the `ISequencerOracle` (Solana network uptime) and does not check the health of the price feeds. 

## Impact (P1/P2)
If the Pyth/PriceBook feed becomes stale while the Solana sequencer remains online, the market will continue to allow borrowing and liquidations using the static fallback price. This can lead to:
1. Bad debt for the protocol (users borrowing against inflated static collateral).
2. Unfair liquidations (if the real price pumped but the fallback price is low).

## Proof of Concept / Code Evidence
1. `BookFeedToV2ShimResilient.latestAnswer()` explicitly catches reverts from the primary feed and returns `fallbackSource.latestAnswer()` (a constant hardcoded price).
2. `PriceOracleSentinel._isUpAndGracePeriodPassed()` only queries `_sequencerOracle.latestRoundData()` and ignores price feed health.

## Recommendation
Modify the `PriceOracleSentinel` to query the status of the `PriceBook` or the shims. Alternatively, design the shims to revert (or emit a flag) when using the fallback, so the Sentinel or AaveOracle can pause the market until the feed recovers.
