---
name: orchestrate-long-running-work
description: Keep intent, acceptance evidence, and resumability intact when work spans sessions, owners, external waits, or gated phases. Not for ordinary planning, routine changes, or mere parallelism.
---

# Orchestrate Long-Running Work

Own durable continuity across phases and handoffs. Inside each phase, the normal design, implementation, verification, release, or operational workflow does the work; this skill only keeps the mission intact across them.

Use it only when at least one is true: accepted completion cannot fit in one bounded session; independent owners or external waits require durable handoffs; rollout, migration, or integration phases have separate gates that must survive context loss; the user explicitly asked for persistent long-running execution and there is a genuine continuity burden. Many files, difficulty, available subagents, or the need for a good plan do not qualify; route those to plan-decision-complete-change or engineer-code-change.

## Establish one durable mission

1. Read repository instructions, current plans, specifications, issue state, history, and in-progress work.
2. Record the mission outcome, non-goals, preserved invariants, acceptance conditions, constraints, consequential unknowns, and authorization boundary.
3. Establish a reproducible bootstrap, launch, and smoke recipe from repository guidance. Run it when safe and record pre-existing failures.
4. Map dependencies, integration points, irreversible decisions, external waits, and the smallest vertical slices that produce observable progress. Order by prerequisites, uncertainty retired, user value, and integration risk.

Use the existing persistent task or plan mechanism as the single acceptance ledger. Create one durable file only when no such mechanism exists and a real handoff is expected; the [acceptance ledger](references/acceptance-ledger.md) is a compact structure. Never create a second tracker. Every material condition stays unverified until current evidence proves it; change a condition only through an explicit recorded contract change.

Persistence never broadens authority. Commits, pushes, deployments, production access, external writes, destructive actions, and scope expansion keep their own authorization requirements, including after a "do not stop" request.

## Define independently provable slices

Each slice has one observable outcome and explicit preserve constraints; prerequisites, consumers, a bounded write set, and one owner; a proving check and a falsifying result; an integration point and a rollback or containment boundary; a stop condition for evidence that invalidates its approach.

Prefer end-to-end vertical increments over finishing every layer before any usable path exists. Test uncertain architecture with the smallest useful slice first. Record only decisions later work depends on.

Parallelize only genuinely independent work with disjoint write sets, using isolated worktrees when edits may conflict. Give each owner the mission context, exact deliverable, boundaries, and verification duty. One lead owner keeps architectural decisions, integration, conflict resolution, and acceptance. Delegated output is a candidate until inspected and verified.

## Resume and hand off from evidence

At every resumption: read the mission, ledger, durable decisions, latest handoff, and repository state; check for contract, dependency, base, environment, or authorization drift; run the smoke recipe before trusting a stale handoff when practical; select the next unblocked slice from dependencies and evidence, not from the old narrative.

For each slice: confirm its baseline, implement through the applicable workflow, run focused and observable checks, integrate promptly, inspect the combined result for contract drift, and leave a safe continuation point.

A handoff records durable facts only: verified and open acceptance conditions with evidence bound to current artifacts, decisions and approved deviations, changed surfaces, commands and results, failed approaches worth avoiding, blockers, and the next exact step. Correct or remove a claim when later evidence disproves it. Never paste transcripts or chain-of-thought.

## Stop and ask when

- the critical path is blocked on missing authority or a user-owned decision (continue only useful, reversible, independent in-scope work meanwhile);
- the mission contract must change to proceed;
- external state has not changed since the last blocked attempt (do not retry unchanged).

Never hide a blocked critical path behind unrelated activity, and never count plans or trackers as delivered progress.

## Done when

Every material acceptance condition is verified against the integrated state, durable records match reality, the strongest practical end-to-end path has run, and rollback, cleanup, monitoring, and follow-up ownership are explicit. Report the final evidence, remaining risk, and anything intentionally unexecuted.
