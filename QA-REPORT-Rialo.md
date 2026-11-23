# QA Report: Rialo Playground (AGP)

**Tester:** @setriawindra_z
**Date:** 23 Nov 2026
**Environment:** MacOS, Node.js v20.20.1, Terminal
**Target:** Rialo Playground / Agent Grand Prix (AGP)

## Scope of Testing
- Environment: Web UI, Terminal (MCP Remote)
- Action: Login, AGP Wallet provisioning, MCP Agent connection.

## Test Results & Findings

### 1. AGP Race Wallet Provisioning (Failed)
- **Action:** Logged into AGP dashboard for the first time.
- **Result:** Race Wallet status is FAILED. Balance is 0.00 AGP.
- **Observation:** UI provides no error message or retry button. User is blocked from creating an agent or entering a race.

### 2. MCP Agent Connection (Critical Bug Found)
- **Action:** Copied the official MCP config from the dashboard and ran it in Mac Terminal.
- **Command:** `npx -y mcp-remote https://api.agp.onlatch.com/track/mcp --header "Authorization: Bearer [TOKEN]"`
- **Result:** `Fatal error: RegistrationRejectedError: Dynamic Client Registration rejected (HTTP 404)`
- **Analysis:** The Rialo backend server fails to handle the dynamic client registration (`/register`) required by the `mcp-remote` package. The endpoint returns `404 Not Found`. This makes the entire AGP feature inaccessible for users.

## Recommendations for Dev Team
1. Fix the wallet provisioning system so new users get a working AGP wallet automatically.
2. Fix the MCP server backend. Ensure the `/register` endpoint is implemented and accessible for the `mcp-remote` client. The current setup is broken out of the box.
