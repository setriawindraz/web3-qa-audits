# Devnet Transaction Explorer DNS Resolution Failed

## Environment
- **Network:** Devnet
- **Node:** wss://rpc.devnet.flop.network
- **Wallet:** SS58 prefix 42
- **Test Address:** 5HpBK2fbZPARkpNmuVtCY8zBaaSfJSN96ESYfWJYxCxp1wWu

## Execution Result
- **Faucet Claim:** Success (25 FLOP)
- **Tx Hash:** 0xc12506c02b83012dfc10e52bc7f325e667ebde0fb7267b55ea4a6...

## Bug Report
- **Severity:** P1 (Infrastructure/UI)
- **Title:** Devnet Transaction Explorer DNS Resolution Failed

## Steps to Reproduce
1. Go to `faucet.flop.network`
2. Request 25 FLOP quick fund
3. Click the generated transaction link

## Actual Result
Browser shows `DNS_PROBE_POSSIBLE` for `explorer.flop.network`. The host cannot be resolved.

## Expected Result
Transaction details page loads successfully.
