# Proof Validator Bounty — Public Disclosure Review

## Context
- **Type:** Public disclosure review (not original testing)
- **Source:** Scroll bug bounty disclosure, November 2026
- **Network/Environment:** Scroll mainnet (batch finalization / proof validator)
- **Objective:** Analyze the disclosed proof validator bug, its exploit preconditions, and what the 7-day turnaround reveals about QA assumptions in ZK rollup batch validation.

## Summary
Scroll received a bounty report on 3 Nov 2026 and registered a validator fix for batch version 10 on 10 Nov 2026 — a 7-day turnaround. The bug allowed a previously valid proof to be accepted for a new public input, enabling arbitrary state root and withdrawal root finalization.

## Exploit Preconditions
Exploitation required **either**:
1. A **permissioned prover** role, or
2. **Forced batch mode** active after 7 days without finalization.

Scroll confirmed that forced mode never activated and that all 748 finalizations during the bug window used normal proofs.

## QA Takeaway
The guard held — but only because the precondition never triggered. A proof validator that accepts stale proofs for new inputs is a consensus-level risk regardless of whether the path was reachable in practice. The relevant QA question is not "did it happen" but "what assumption made it possible."

## Evidence
- **Source:** Scroll public bounty disclosure (Nov 2026)
- **Status:** Patched, no exploitation observed
- **Original testing by author:** No — this note reviews a public disclosure.

## Reproducibility
N/A — public disclosure review, not reproduced locally.

## Duplicate Check
N/A — external disclosure, not submitted by author.
