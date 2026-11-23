# SimpleChain — RPC Latency Baseline Test

## Project Overview
SimpleChain is a Layer 1 blockchain. This report documents the baseline performance of their public RPC endpoint.

## Testing Environment
- **OS:** macOS
- **Tool:** cURL (Terminal)
- **Date:** November 24, 2026
- **Endpoint:** `https://rpc.simplechain.com`

## Testing Objective
To measure the response time (latency) and stability of the public RPC endpoint using a lightweight call (`eth_blockNumber`).

## Methodology
A bash loop was executed to send 5 consecutive requests to the RPC endpoint with a 1-second delay between each request. 

Command used:
```bash
for i in {1..5}; do curl -s -X POST https://rpc.simplechain.com -H "Content-Type: application/json" -d '{"jsonrpc":"2.0","method":"eth_blockNumber","params":[],"id":1}' -w "Time: %{time_total}s\n" -o /dev/null; sleep 1; done
