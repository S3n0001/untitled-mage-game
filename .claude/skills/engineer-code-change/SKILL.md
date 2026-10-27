---
name: engineer-code-change
description: Implement a local code, config, dependency, or test change end to end, with tests and self-review. Default for add, fix, change, and refactor. Not for review, diagnosis, planning, docs-only work, or push and PR.
---

# Engineer Code Change

Deliver one integrated local outcome, not an edit. Specialist concerns compose under this skill without taking over integration and completion: craft-contextual-ui owns rendered interface decisions, engineer-secure-systems the threat model and controls, handle-sensitive-data-safely restricted data, migrate-contracts-safely durable contract transitions, and engineer-reliable-data-pipelines delivery and replay semantics. Each supplies its invariants and acceptance evidence; this skill still owns the diff, the proof, and completion.

## Establish the contract

1. Read every repository instruction that applies to the paths you will touch.
2. Inspect the working tree: branch, base, upstream, staged and unstaged changes, untracked files, generated artifacts. Preserve existing work. Never stash, reset, rebase, or switch away from it without authorization; use a worktree or branch when the checkout is dirty or shared.
3. Convert the request into observable acceptance conditions, required failure behavior, invariants to preserve, and explicit do-not-touch scope. Resolve discoverable facts from code, tests, and history. Use infer-intent-before-coding only when consequential ambiguity remains.
4. Separate local authority from remote authority. "Implement", "fix", and "refactor" authorize local edits only. Commit, push, PR, merge, deploy, migrate, and any external mutation each need their own explicit authorization; publish-verified-github-change defines that scope.
5. Never print or copy credentials while inspecting configuration.

## Trace the seam and choose the smallest coherent design

Inspect the smallest complete path: entry point, callers, state ownership, persistence, external boundaries, error handling, consumers. Find the source of truth and the closest analogous implementation before adding anything new.

Choose in this order and stop at the first option that satisfies today's contract and the nearest credible follow-on case:

1. reuse an existing path unchanged;
2. extend the closest existing path;
3. add a focused local implementation;
4. add or reshape a shared abstraction, justified only by repeated behavior with one reason to change, a stable domain concept that needs an owner, isolation of a volatile boundary, or net removal of complexity.

Do not add a factory, registry, adapter, generic service, configuration layer, feature flag, utility, or dependency for an imagined future. A dependency must remove more durable complexity than its API, security, upgrade, and operational cost adds.

Use diagnose-root-causes when the cause of a failure is not established. Use plan-decision-complete-change when consequential design choices need a snapshot-bound plan. Plan production code, tests, docs, compatibility, rollout, rollback, and cleanup together when they are part of the outcome; keep unrelated refactors and generated churn out.

## Implement

- Follow established architecture, naming, error conventions, and test style unless changing them is the task.
- Keep one source of truth and put behavior at the boundary that governs it. Validate untrusted input and authorization server-side; fail closed for security, privacy, billing, and data-integrity invariants.
- Handle reachable retries, concurrency, cancellation, partial failure, cleanup, and idempotency.
- Preserve public APIs, schemas, persisted data, accessibility, and compatibility unless changing them is in the contract.
- Add or update behavioral tests alongside the code. Update authoritative documentation when commands, contracts, configuration, or user-visible behavior change.
- Regenerate derived files with their generator and inspect the output.
- Give every touched file a direct role in behavior, proof, or removal of superseded code. If the diff escapes the expected surface, stop and re-map the design.

Never ship placeholders, fabricated data, disabled or weakened assertions, broad type escapes, swallowed errors, unexplained fallbacks, dead parallel paths, or TODOs standing in for acceptance conditions.

## Prove and self-review

Run evidence in increasing breadth: the original defect or new behavior, focused success and failure tests, affected integration checks, repository-required static, build, and regression checks, then the real interaction when automation cannot prove it. Use write-tests-that-prove-behavior for explicitly requested or high-risk test design and verify-end-to-end for explicitly requested runtime proof; otherwise write and run the tests directly.

Record exact commands, results, environment, and the commit or tree exercised. Separate baseline failures from ones you introduced, with evidence. Do not run destructive scripts, live migrations, deployments, provider calls, or shared-environment tests without explicit authority and a confirmed target.

Read the complete final diff. Map each acceptance condition and material failure case to code and evidence. Look for unrelated edits, secrets, debug artifacts, generated drift, dead code, duplicated state, unsafe defaults, and rollback hazards. Fix what you find and rerun the affected checks.

For independent review, use a person or a context-isolated reviewer that did not implement the change, following review-code-with-evidence on an immutable commit or hashed patch, given the sanitized task and raw diff but not your conclusions. A subagent verdict is agent evidence, not human or GitHub approval.

## Stop and ask when

- an unresolved choice materially changes behavior, architecture, data, money, security, permissions, compatibility, or destructive scope;
- the correct change requires touching files, systems, or scope the request excluded;
- proof requires an action that needs authority you do not have.

While a question is outstanding, finish the parts of the change that do not depend on the answer, then report the blocked part and what it is waiting on. Never resolve a consequential choice silently to keep moving, and never narrow the delivered scope instead of asking.

## Done when

Every acceptance condition maps to implementation and observed evidence, the diff is clean and self-reviewed, and the report states delivered behavior, material design choices, files changed, exact checks and results, review status, baseline failures, unexecuted checks, assumptions, and residual risk. Say exactly which commit, push, PR, merge, deployment, or production action occurred. Stop at a complete local change unless more was explicitly authorized. Never imply unrun CI, absent review, or an unpushed commit exists remotely.
