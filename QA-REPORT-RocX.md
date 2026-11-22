# QA Report: RocX (ZK Testnet)

**Tester:** @setriawindra_z
**Date:** 22 Nov 2026
**Network:** Base Sepolia
**Wallet:** Burner wallet (Mandatory)

## Scope of Testing
- Environment: Web UI, MetaMask Mobile Extension
- Action: Daily check-in, PoA Task execution, Wallet connection.

## Test Results & Findings

### 1. Wallet Connection (Critical Bug Found)
- **Action:** Connect wallet and sign-in message.
- **Result:** First attempt successful. Subsequent attempts fail with "Sign-in failed".
- **Console Error:** `MetaMask - RPC Error: Unrecognized chain ID 0x14a34` and `not authorized`.
- **Analysis:** Frontend session management is broken. Page requires hard reload to reconnect. Persistent issue for 2 weeks.
- **Workaround:** Clear `localStorage` and `sessionStorage` via DevTools, lock/unlock MetaMask, then refresh.

### 2. Daily Check-in (Success)
- **Action:** Explore menu interaction.
- **Status:** Passed (after workaround).

### 3. PoA Task Execution (Success)
- **Action:** Post on X, copy link, submit in PoA form, click Verify.
- **Constraint:** 1 link per day. No token guarantee.
- **Status:** Passed.

## Risk Isolation
- **Smart Contract Audit:** None (per official docs).
- **Data Integrity:** Site uses sample data.
- **Conclusion:** Early experiment. High risk. Zero cost only.

## Documentation
- **Binance Square Article:** https://app.binance.com/uni-qr/cart/388834782881478
- **X Thread:** 4 tweets posted (initial phase).
- **X Post (Bug):** Posted visual proof of the frontend bug.
