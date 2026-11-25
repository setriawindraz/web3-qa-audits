# Latch 404 Response on Unmatched Path is By-Design

## Context
- **Severity:** P3 (Informational)
- **Network/Environment:** Rialo Devnet / Latch Beta (`https://latch-beta.rialo.io`), Timestamp: 2026-11-25
- **Objective:** To test the behavior of the Latch MCP endpoint when receiving a request to an unregistered path in the mount configuration.

## Steps to Reproduce
1. Prepare a valid Latch token (`lat_...`).
2. Send a request to the Latch endpoint with a path that does not match any mount (e.g., `/proxy/unknown-service/v1/test`).
3. Observe the HTTP response returned.

## Expected Result
According to official Rialo documentation, requests that do not match a mount path should return HTTP 404 without falling back to any upstream.

## Actual Result
The endpoint returns HTTP 404. No upstream request execution occurs. No credential leakage detected.

## Evidence
- **Source Documentation:** [X Post by @Zing_Xoro (Rialo.io)](https://x.com/Zing_Xoro/status/2104662030947143958)
- **Status:** Verified as intended behavior. No bug report filed.

## Reproducibility
3/3 (consistently returns 404 for unregistered paths).

## Duplicate Check
Checked: Yes. No public issues related to this, as it is a security feature, not a bug.
