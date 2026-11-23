# Flop Labs Devnet — Missing UI Refund Mechanism for Expired HTLC

## Project Overview
Flop Labs is a decentralized reasoning protocol. This report focuses on their Cross-Chain HTLC implementation on the Devnet network.

## Testing Objective
To verify the user flow for reclaiming funds from expired HTLC (Hash Time-Locked Contract) swaps.

## Initial Condition
The protocol states that senders can request a refund once the expiry block is finalized. 

## Steps to Reproduce
1. Navigate to the Flop Devnet Explorer.
2. Go to Cross-Chain -> Contracts tab -> "Expired, awaiting refund".
3. Select an expired HTLC (Hash Lock: `0xd810b8ddc7d9956149676478bdbaeb91300d8d4d316f209fcdf2205b6b82ed0e`).
4. Check the transaction details and the Bridge UI.

## Expected Behavior
The UI should provide a clear mechanism or button to refund the locked funds once the timelock has expired.

## Actual Behavior
There is no Refund button in the UI. The HTLC status remains "Created" with "Pending counter-chain reveal" even after the declared timelock (Block #4,459,777) has long passed. Over 9,549 transactions are marked as past timeout with no user-facing recovery path.

## Evidence
- **Explorer Link:** [Flop Devnet HTLC](https://explorer.devnet.flop.network/htlc/0xd810b8ddc7d9956149676478bdbaeb91300d8d4d316f209fcdf2205b6b82ed0e)
- **Reported Issue:** [Flop Labs Issue #665](https://github.com/flop-labs/network/issues/665)

## Current Status
Reported to the Flop Labs team via GitHub Issue #665. Awaiting developer response.
