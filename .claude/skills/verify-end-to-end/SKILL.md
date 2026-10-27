---
name: verify-end-to-end
description: Prove a change works by running the real app, service, CLI, or job and observing outcomes across boundaries. For explicit end-to-end or runtime proof. Not for UI audits, tests, or diff review.
---

# Verify End to End

Close the gap between source-level checks and what a user, caller, operator, or downstream system actually experiences. A clean diff, build, type check, or unit suite is not end-to-end proof.

## Establish the proof contract

1. Read repository instructions and any launch, seed, and test guidance.
2. Derive observable acceptance conditions from the requested outcome, specification, public contracts, and preserved invariants. Use the diff only to locate affected surfaces, never to weaken or invent conditions.
3. Record the environment, starting state, primary changed path, highest-risk failure path, and behavior that must remain unchanged.
4. Reuse the project's supported commands, fixtures, accounts, and local services.

## Exercise the real surface

1. Run focused static, build, and automated checks first.
2. Launch the actual application, service, CLI, job, library consumer, or device flow in a safe environment.
3. Exercise the primary path with representative input.
4. Exercise one relevant failure, boundary, permission, or recovery path.
5. Observe outputs and side effects: persistence, events, files, logs, network failures, cleanup, and subsequent reads. Restart or reload when durability matters.
6. Check preserved behavior and an adjacent unaffected path when regression risk warrants it.

Trace cross-layer work through registration, configuration, transport, persistence, and consumption. Confirm new artifacts are actually referenced and that no stub or display-only behavior is mistaken for completion.

When the journey crosses a UI and craft-contextual-ui is not engaged, interact at representative viewport widths, inspect the rendered result, and check keyboard access plus loading, empty, and error states. For jobs, integrations, and migrations without their own owner, check repeat runs, partial progress, version skew, and rollback when reachable.

## Loop on evidence

When a check fails, preserve the evidence and decide whether it is a product defect, a broken test, a fixture, a dependency, or the harness. A verification-only request does not authorize fixing any of them: report. If fixes are authorized, use diagnose-root-causes and engineer-code-change, then rerun the exact failed path and any earlier evidence the fix could invalidate.

Never change an assertion, snapshot, seed, retry count, or timeout merely to obtain green. Never retry without a new hypothesis or changed condition.

## Stop and ask when

- proof requires seeding, resetting, migrating, deploying, or mutating a production, shared, credentialed, billed, or externally visible resource;
- the only available environment cannot represent the real surface;
- an observed failure contradicts an acceptance condition and fixing is not authorized.

## Done when

Each material acceptance condition has direct observable evidence and no observed failure contradicts it. Report conditions and results, exact commands or interactions, environment, failures and rechecks, omitted checks with reasons, and residual risk. Never claim end-to-end success unless the runnable outcome was observed.
