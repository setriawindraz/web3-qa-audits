# QA-REPORT: Flop Labs Devnet

## Environment
- Network: Devnet
- Node: wss://rpc.devnet.flop.network
- Wallet: SS58 prefix 42

## Execution Result
- Faucet Claim: Success (25 FLOP)
- Tx Hash: 0xc12506c02b83012dfc10e52bc7f325e667ebde0fb7267b55ea4a6...
- Address: 5HpBK2fbZPARkpNmuVtCY8zBaaSfJSN96ESYfWJYxCxp1wWu

## Bug Report
- Severity: P1 (Infrastructure/UI)
- Title: Devnet Transaction Explorer DNS Resolution Failed
- Steps to Reproduce:
  1. Go to faucet.flop.network
  2. Request 25 FLOP quick fund
  3. Click the generated transaction link
- Actual Result: Browser shows DNS_PROBE_POSSIBLE for explorer.flop.network
- Expected Result: Transaction details page loads successfully.

## X Reply Draft (English + ID)
Found a P1 bug on @flop_labs Devnet. Faucet works smoothly, but the explorer link throws DNS_PROBE_POSSIBLE. Cannot verify tx on-chain. DNS config issue on explorer.flop.network. 
(ID: Bug P1 di Devnet @flop_labs. Faucet lancar, tapi link explorer error DNS. Tx tidak bisa diverifikasi.)
