---
name: diagnose-root-causes
description: Reproduce a bug, regression, hang, slow path, or flaky test and prove its root cause by testing hypotheses. Not for the fix (engineer-code-change) or live incidents (respond-to-production-incidents).
---

# Diagnose Root Causes

Find the earliest causally relevant divergence that explains the symptom. Separate the trigger, the root cause, and contributing conditions. Treat the user's theory, the error message, and suspicious-looking code as leads, not conclusions.

## Establish the failure

1. Read the repository instructions. Write down actual versus expected behavior, the triggering input, environment, version, timing, frequency, and last known good state.
2. Build the smallest faithful, safe reproduction through the real entry point or its closest substitute. Keep the exact command, request, fixture, interaction, and output.
3. Classify the symptom: deterministic, intermittent, environment-specific, or pre-existing baseline behavior.
4. If reproduction is unsafe or impossible, work from logs, traces, state, and history, and label every conclusion by the strength of its evidence.

## Falsify hypotheses

Trace backward from the failing boundary through inputs, transformations, state ownership, persistence, caches, external calls, configuration, concurrency, retries, and timeouts until the invariant first diverges.

Keep a short ledger and update it as you go:

```text
H1: <hypothesis> | explains: <evidence> | contradicted by: <evidence or "nothing yet"> | cheapest check: <command or inspection>
```

Change one discriminating variable at a time. Prefer focused instrumentation, history bisection, reduced inputs, comparison against a known-good reference, or delta debugging over speculative edits. Retire disproven hypotheses explicitly.

A root cause must explain the complete causal chain and why the reproduced conditions trigger it. A symptom that disappears is not proof.

## Do not mask the symptom

Never declare a cause after merely swallowing an error, adding a fallback, raising a timeout or retry count, clearing state, weakening a test, or wrapping an invariant in a defensive check. Those hide the divergence; they do not explain it.

Keep experiments reversible and isolated. Do not mutate production, shared data, credentials, or external systems without explicit authority. Remove temporary instrumentation before finishing unless durable observability is part of an authorized fix.

## Stop and ask when

- the only remaining discriminating check needs production access or a destructive action;
- the evidence supports two causes equally and only the user can supply the missing fact;
- the request said "diagnose only" and you are tempted to edit.

## Done when

For diagnosis-only work: the symptom, root cause, causal chain, evidence, remediation direction, and residual uncertainty are reported, and the workspace is clean. Say plainly when a cause is probable rather than proven.

When a fix is explicitly requested, hand the proven causal seam to engineer-code-change: add or name a regression check, correct the narrowest cause, rerun the original reproduction and an adjacent negative case, and inspect sibling paths without silently broadening scope.
