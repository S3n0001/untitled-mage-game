---
name: infer-intent-before-coding
description: Turn a vague, conflicting, high-impact, or mechanism-first request into a bounded intent contract before coding. Not for clear routine changes, implementation (engineer-code-change), or planning.
---

# Infer Intent Before Coding

Decide what outcome the change must produce and which boundaries it must respect. The user's stated outcome is authoritative; their proposed mechanism, their diagnosis, and the existing code are all hypotheses.

## Build the intent contract

Read the repository instructions, then inspect only as much current behavior, callers, tests, types, configuration, and history as it takes to resolve the ambiguity. Write down:

- actor, problem, and the observable outcome that counts as success;
- acceptance conditions and required failure behavior;
- invariants and public or compatibility contracts that must hold;
- scope to change, scope to preserve, scope not to touch;
- each consequential assumption and the evidence behind it.

Existing behavior is evidence, not a veto on an explicitly requested change. A prescribed mechanism ("add a cache") is a clue to the outcome ("search feels instant"); confirm the mechanism serves the outcome before adopting it.

## Classify each unknown

| Unknown | Do this |
| --- | --- |
| Discoverable from the repo, docs, tools, or running UI | Look it up. Never ask the user for facts the workspace can reveal. |
| Local and reversible | Pick the best-supported option; mention it only if it shapes the result. |
| Consequential: changes product behavior, architecture, public contracts, data, money, security, permissions, destructive scope, or a large amount of work | Ask one focused question that names the options and your recommended default. |

If evidence conflicts, describe the concrete conflict and the smallest outcome-preserving resolution rather than choosing silently.

## Check reachable blind spots

Consider only edge cases that can affect the requested outcome: invalid or stale input, partial failure and recovery, permission and tenant boundaries, concurrency and ordering, compatibility and rollback, and accessibility states for UI work. Scale the pass to uncertainty, blast radius, and reversibility.

For a vague greenfield brief, infer the smallest coherent journey: a real actor, meaningful input, a complete primary flow, a visible or durable result, and essential recovery states. Do not substitute a hollow demo or speculative breadth.

## Stop and ask when

- a consequential unknown remains after inspecting the workspace;
- the request and the evidence contradict each other in a way that changes the outcome;
- resolving the ambiguity would need an external write, a destructive action, or production access.

Stay read-only until those are resolved. Investigation never authorizes scope expansion.

## Done when

The contract (outcome, acceptance conditions, invariants, scope, assumptions) is written and every remaining question is one only the user can answer. Hand it to engineer-code-change for implementation, or to plan-decision-complete-change when material design decisions still need a plan.
