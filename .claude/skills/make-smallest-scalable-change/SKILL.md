---
name: make-smallest-scalable-change
description: Constrain code changes to the smallest coherent design when abstraction, dependency, or duplication is materially risky. Unless explicitly invoked, use under engineer-code-change. Not for routine edits, planning, or review.
---

# Make the Smallest Scalable Change

Primary role: control design complexity and change surface. Use this skill as primary for an explicit compatible request focused on design restraint; otherwise compose it under engineer-code-change, which retains integration and completion. Optimize total system simplicity, not raw line count; never trade away correctness, security, clarity, or required proof to make a diff look small.

## Find the owning seam

Read applicable repository instructions. Trace the nearest implementation seam, its callers, contracts, tests, owner, failure behavior, and closest analogous feature. Identify the invariants and files that have a direct reason to change. Expand only along dependencies that can affect the requested behavior.

Check first whether the behavior already exists under another name or can use an existing primitive.

## Choose in this order

1. Reuse an existing path unchanged.
2. Extend the closest existing path.
3. Add a focused local implementation.
4. Add or reshape a shared abstraction.

Choose the earliest option that satisfies today's contract and the nearest credible follow-on case. Justify a new abstraction with repeated behavior that shares a reason to change, a stable domain concept needing one owner, isolation of a volatile boundary, or removal of greater existing complexity.

Do not add a factory, registry, adapter, generic service, configuration layer, feature flag, shared utility, or dependency for an imagined future. A dependency must remove more durable complexity than its API, security, upgrade, bundle, and operational costs introduce.

## Keep the change coherent

- Preserve one source of truth, explicit ownership, narrow interfaces, and behavior near the data or boundary it governs.
- Extend established paths instead of building parallel ones; remove replaced task-local code when safe.
- Keep one-use logic local unless extraction gives a real concept or invariant a name.
- Preserve public APIs, schemas, persisted data, and compatibility unless their change is explicitly in scope.
- Exclude opportunistic cleanup and unrelated refactors.
- Handle failure at the owning boundary; do not swallow errors or hide broken invariants behind fallbacks.
- Give every touched file a direct role in behavior, proof, or removal of superseded code.

If the diff escapes the expected surface, remap the design. Continue only when the expansion is necessary, and obtain direction before a consequential scope or authority change.

## Run the reduction pass

Use focused behavioral evidence from the engineer-code-change lifecycle, then inspect the final design for duplicate state, unnecessary files or helpers, accidental API growth, dead code, dependency growth, and replaceable scaffolding. Confirm the next realistic case has one obvious owner and that the current solution can be replaced without contaminating unrelated code.

This skill does not authorize external writes, production changes, destructive actions, or omitted tests. Return control to engineer-code-change for integrated verification and handoff.
