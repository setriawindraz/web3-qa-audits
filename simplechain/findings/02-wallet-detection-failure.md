## Wallet Detection Failure for EIP-6963 Compatible Wallets (Rabby)

**Context:**
- **Severity:** P2 (High - Blocks onboarding for non-MetaMask users)
- **Network/Environment:** SimpleChain Testnet, Chain ID: 1913, OS/Tools: MacBook Mid-2012 (Catalina) / Brave, Wallet: Rabby Wallet v0.94.18, Timestamp: 2026-11-28 23:47 (UTC+7)
- **Objective:** Connect to SimpleChain Task Hub using Rabby Wallet.

**Steps to Reproduce:**
1. Install and activate Rabby Wallet (v0.94.18) on Brave browser. Ensure MetaMask is disabled.
2. Open SimpleChain Task Hub (`https://task.simplechain.com`).
3. Click "Connect Wallet".
4. Observe the modal: It only displays "ChainBox" and "MetaMask". Rabby is not listed.
5. Click "MetaMask" to attempt connection (as Rabby injects as an EIP-1193 provider).
6. The DApp incorrectly shows "Install MetaMask Wallet" instead of triggering the Rabby pop-up.

**Expected Result:**
DApp should detect Rabby via EIP-6963 (Multi Injected Provider Discovery) or trigger the Rabby extension pop-up when clicking MetaMask.

**Actual Result:**
DApp fails to detect Rabby entirely. Clicking MetaMask forces a "Please install MetaMask" screen, completely blocking Rabby users from logging in.

**Evidence:**
- **cURL:** N/A
- **HAR File:** N/A
- **RPC Verification (curl+jq):** N/A
- **Tx Hash/Log:** N/A
- **Explorer Link/Status:** N/A
- **X Thread:** https://x.com/setriawindra_z/status/2126729305019584799
- **Status:** Draft

**Reproducibility:**
3/3 (Always fails)

**Duplicate Check:**
No similar issues found on GitHub/Discord.

**DevTools/Console Error:**
- EIP-6963 provider object is not parsed by the DApp.

<img width="967" height="533" alt="Screen Shot 2026-11-29 at 00 11 59" src="https://github.com/user-attachments/assets/9d3e1434-b50a-4d19-bae7-04e9c544696f" />
