# Silent Fallback in Price Shims Bypasses PriceOracleSentinel

## Context
- **Severity:** P1/P2 (security-adjacent — depends on Rome's classification)
- **Network/Environment:** Hadrian Testnet, Chain ID 200010, repo `rome-protocol/rome-aave-v3`
- **Objective:** Verify whether Price Shims enforce the same oracle-sentinel checks as the canonical Aave V3 `PriceOracleSentinel` path, particularly during fallback conditions.

## Steps to Reproduce
Withheld per responsible disclosure. Full reproduction steps and PoC are available in the public issue linked below; this repository intentionally does not duplicate exploit-level details.

## Expected Result
Price Shims should route through `PriceOracleSentinel` checks and fail closed when the sentinel is triggered — matching canonical Aave V3 behavior.

## Actual Result
Price Shims silently fall back, bypassing `PriceOracleSentinel`. This can allow operations that should be blocked during sentinel-triggered conditions, with potential for bad debt and unfair liquidations.

## Evidence
- **Issue:** [#19 — Silent Fallback in Price Shims Bypasses PriceOracleSentinel](https://github.com/rome-protocol/rome-aave-v3/issues/19)
- **Submitted:** 25 Nov 2026 via GitHub Issue + email + web form
- **Status:** Reported — awaiting developer response (no comment as of 25 Nov 2026)
- **Details:** Reproduction and PoC withheld until fix per responsible disclosure.

## Reproducibility
Reported as reproducible; full steps in Issue #19.

## Duplicate Check
Checked: yes — searched repo issues and discussions before submitting #19.
