# Faucet UI Fails to Enable Claim Button on Mobile DApp Browsers

## Context
- **Severity:** P2 (Functional Bug / Core feature inaccessible via mobile)
- **Network/Environment:** Flop Testnet, Mobile Device (iOS/Android), SubWallet/Nova DApp Browser, Timestamp: 2026-11-25 15:02 UTC+7
- **Objective:** Claim 10 FLOP testnet tokens via the official faucet (faucet.flop.network).

## Steps to Reproduce
1. Open `faucet.flop.network` inside a mobile DApp browser (SubWallet/Nova).
2. Click "Connect Wallet" and approve the connection using the mobile wallet.
3. Observe the UI updates to "Have a wallet? OK polkadot-js".
4. Attempt to click the "Request 10 FLOP" button.

## Expected Result
The "Request 10 FLOP" button should become active (clickable) once the wallet is connected, allowing the user to claim the testnet tokens.

## Actual Result
The "Request 10 FLOP" button remains permanently disabled (unclickable), blocking the claim process entirely. 

## Evidence
- **Screenshot:** [Attach screenshot showing connected wallet but disabled button]
- **Status:** TBD

## Reproducibility
3/3 (Tested on standard mobile browser, DApp browser with Westend network, and DApp browser with custom Flop Testnet RPC).

## Duplicate Check
Yes (Checked Flop Network GitHub issues, no exact match for mobile DApp browser state failure found).
