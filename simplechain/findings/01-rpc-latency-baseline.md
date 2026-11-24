# 01 - Testnet Explorer DNS Resolution Failure

**Severity:** P1 (Critical Infrastructure)
**Status:** Confirmed
**Date:** 24 November 2026

## Summary
The official SimpleChain Testnet Explorer and its associated RPC endpoint (`https://test.explorer.simplechain.com/rpc`) are completely unreachable due to a DNS resolution failure. However, the root domain (`simplechain.com`) resolves successfully, indicating an isolated issue with the explorer subdomains.

## Environment
- **Network:** SimpleChain Testnet
- **Endpoint:** `https://test.explorer.simplechain.com/rpc`
- **Tool:** `curl`, `nslookup`
- **DNS Resolver:** Cloudflare (`1.1.1.1`)
- **Location:** Batam, Indonesia

## Steps to Reproduce
1. Attempt to resolve the testnet explorer subdomain:
   ```bash
   nslookup test.explorer.simplechain.com 1.1.1.1
