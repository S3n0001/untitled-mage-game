---
name: write-tests-that-prove-behavior
description: Author behavior and contract tests that reject wrong implementations and survive refactoring. Primary for test-only requests; under engineer-code-change for high-risk test design. Not for test runs or diagnosis.
---

# Write Tests That Prove Behavior

Create the smallest trustworthy test set that rejects meaningful wrong implementations and survives reasonable refactoring. Routine tests that accompany an implementation stay with engineer-code-change.

## Define the proof

1. Read repository and test instructions. Resolve the contract from the explicit outcome or specification first, documented public behavior second, repository evidence third. Current code describes what exists; it does not override an intended change.
2. List the success, failure, boundary, and state-transition cases that would change the decision to ship. Those are the tests.
3. Inspect nearby fixtures and helpers so new tests fit the existing harness.
4. For a bug, reproduce it first and make the regression test fail for the reproduced reason. If a faithful pre-fix failure cannot be shown, say so.

## Choose the observation boundary

Use the lowest level that can observe the real contract: unit for pure decisions; component or contract for one public boundary and its states; integration for coordination across real modules, persistence, queues, or protocols; end to end only when the critical journey cannot be proved below the running system.

Cross a real boundary when the risk lives there. Mock volatile external systems, time, randomness, and destructive effects only enough to gain control. Never mock the behavior being proved, and never assert private call sequences as a substitute for outcomes.

## Make each test trustworthy

- One clear behavioral reason to fail per test, with a name that states the behavior.
- Explicit representative inputs and small fixtures; assert outputs, state transitions, side effects, and error semantics.
- Control clocks, randomness, schedulers, concurrency, and shared state. No arbitrary sleeps, no live networks.
- Snapshots only when the whole stable representation is the contract and a human can review it.
- Cover reachable invalid, duplicate, boundary, permission, ordering, retry, and partial-failure cases without combinatorial noise.
- Reuse helpers that clarify setup; do not build a framework for one test.

Never obtain green by deleting, skipping, weakening, broadly refreshing snapshots, or changing expectations to match unexplained behavior.

## Challenge the evidence

Run the narrowest changed test, then the containing suite. Confirm a plausible faulty implementation would fail, using the pre-fix revision or mutation tooling when available; do any temporary mutation in a disposable copy so the original workspace is unchanged. Check for flakiness, environment coupling, leaked state, runtime cost, and redundant cases.

## Stop and ask when

- the contract itself is ambiguous and the choice changes what "correct" means;
- proving the behavior needs a production edit and the request was test-only;
- the only faithful proof needs credentials, live services, or destructive setup.

## Done when

The tests fail for the right reason against a wrong implementation and pass against the right one, run green in the containing suite, and the report lists the behavior proved, exact commands and results, and material contracts still untested. Test count and coverage percentage are supporting signals, not proof.
