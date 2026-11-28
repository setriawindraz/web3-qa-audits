## Bridge UI "processing response error" and "Status unavailable" due to CSP `eval` restriction

**Context:**
- **Severity:** P2 — Withdrawal (burn) transaction succeeds on LitVM, but the frontend crashes due to a Content Security Policy (CSP) block, preventing the automated relayer from processing the claim. Funds are stuck, and UI misleads the user.
- **Network/Environment:** LitVM LiteForge (Zeeve RPC), Chain ID: 4441, RPC URL: https://rpc.testnet.liteforge.zeeve.net/, OS/Tools: MacBook Mid-2012 / Brave (Hardware Accel OFF), Wallet: MetaMask / Rabby, Timestamp: 2026-11-28 17:00 (UTC+7)
- **Objective:** Verify cross-chain withdrawal claim status after 0.05 zkLTC withdrawal from LitVM to Sepolia.

**Steps to Reproduce:**
1. Go to `https://bridge.liteforge.zeeve.net` and connect wallet.
2. Execute a Withdraw of 0.05 zkLTC from LitVM LiteForge to Ethereum Sepolia.
3. Wait for the LitVM transaction to succeed (Tx: `0x4d94133ca4af29bf5da62b84ffb873cbf65dd6eab022ded6a013476895b4c945`).
4. Navigate to the **Activity** tab.
5. Observe the card for the withdrawal showing **"Status unavailable"** and **"processing response error"**.
6. Click the "Refresh" button on the card.
7. Open DevTools (Inspect) -> Console / Issues tab.

**Expected Result:**
The UI should fetch the latest claim status from the relayer/API, display "Success", and the 0.05 zkLTC should be minted to the user's Sepolia address.

**Actual Result:**
The UI displays "processing response error". Inspecting the browser Console reveals a critical error: **"Content Security Policy of your site blocks the use of 'eval' in JavaScript"**. This causes the frontend JavaScript to crash, preventing the refresh button from making any network requests (Network tab remains empty upon clicking refresh), halting the automated relayer claim process.

**Evidence:**
- **cURL:** N/A (Network tab is empty because the JS execution crashes before making a request).
- **HAR File:** N/A (No request initiated).
- **RPC Verification (curl+jq):** Tx `0x4d94133ca4af29bf5da62b84ffb873cbf65dd6eab022ded6a013476895b4c945` returns `status: 0x1` (Success) on LitVM.
- **Tx Hash/Log:** `0x4d94133ca4af29bf5da62b84ffb873cbf65dd6eab022ded6a013476895b4c945`
- **Explorer Link/Status:** `https://explorer.testnet.liteforge.zeeve.net/tx/0x4d94133ca4af29bf5da62b84ffb873cbf65dd6eab022ded6a013476895b4c945` (SUCCESS).
- **X Thread:** https://x.com/setriawindra_z/status/2126638994960285947
- **Status:** Draft

**Reproducibility:**
2/2 (Consistent across MetaMask and Rabby).

**Duplicate Check:**
No identical CSP issue reported in Discord `#liteforge-testnet` yet, though general "pending/stuck" withdrawal reports exist.

**DevTools/Console Error:**
`Content Security Policy of your site blocks the use of 'eval' in JavaScript` (Refused to evaluate a string as JavaScript because 'unsafe-eval' is not an allowed source of script).
