---
name: plan-decision-complete-change
description: Write a snapshot-bound, decision-complete implementation plan for a medium-to-large change, architecture choice, or handoff. Not for obvious low-risk edits or cross-session execution tracking.
---

# Plan a Decision-Complete Change

Produce one implementation-ready plan that removes consequential guesswork for a recorded evidence snapshot. This skill plans; it does not track execution or write the code.

## Set mode and authority

- **Plan only:** investigate and return the plan; change no code, tests, configuration, or external state.
- **Plan within authorized implementation:** plan read-only, then hand straight back to engineer-code-change with no artificial approval pause.
- **Skip this skill** when the correct low-risk diff and its verification fit in one sentence.

Planning never expands authority. Record what is already authorized, what needs new authority, and which destructive, production, credentialed, or external effects the plan must not cross. Persist a plan file only when asked, required by repository instructions, or needed for a real handoff. If execution must survive sessions or coordinate several owners, hand the accepted plan to orchestrate-long-running-work.

## Bind the plan to evidence

1. Read applicable repository instructions.
2. Inspect current behavior, owning seams, callers, public contracts, tests, configuration, and relevant history.
3. State the outcome, observable acceptance conditions, constraints, non-goals, preserved invariants, and consequential assumptions.
4. Trace control and data flow far enough to decide ownership, integration, failure handling, compatibility, and verification.
5. Record freshness-critical evidence only: repository identity plus base, head, and tree for Git; otherwise file hashes, artifact digest, or dated external source.

Name a file or symbol only when inspection supports it; otherwise name the responsibility the implementer must locate. Classify each unknown as a discoverable fact (resolve it now), an implementation-time check (name the check, expected evidence, and stop condition), a user-owned decision (ask only if it changes the outcome), or a bounded assumption (state evidence, consequence if false, and validation point).

## Decide what is expensive to reverse

Make the selected approach, its evidence, and its tradeoff explicit for: user-visible behavior and source of truth; domain ownership and public API, schema, event, or storage contracts; transaction, concurrency, retry, idempotency, and failure semantics; migration, rollout, observability, rollback, and cleanup; reuse of an existing seam versus a new abstraction.

Record a rejected alternative only when omitting it would cause re-litigation. Leave out speculative frameworks, broad refactors, code dumps, effort estimates, and fake precision.

## Write one vertical-slice plan

Use the smallest useful subset of: outcome and acceptance conditions; evidence snapshot and assumptions; scope, non-goals, invariants, and authority boundaries; selected design and tradeoffs; ordered slices; acceptance and risk coverage ledger; rollout, rollback, and stop conditions; review record.

Use 3 to 7 vertical slices organized by observable outcome, not by file or layer. For each slice state the observable outcome and owning components; contract and data-flow changes including failure behavior; prerequisites and ordering reason; focused verification plus a counterexample that would disprove completion; a stop condition that would invalidate the approach. Put tests beside the behavior they prove, migrations beside their compatibility gates, and cleanup after the replacement is verified. Map every acceptance condition and material risk to one slice and its evidence.

## Gate only difficult plans

Require independent plan review when one high-risk signal or two complexity signals are present.

- High-risk: security or authorization boundaries; destructive or irreversible actions; data migration or compatibility windows; public contract breaks; money, privacy, or data-integrity exposure; concurrency or distributed-state semantics; costly production rollback.
- Complexity: three or more interacting subsystems; unfamiliar or weakly tested critical paths; several viable architectures; uncertain ownership or source of truth; cross-process failure behavior; consequential assumptions the evidence does not prove.

File count alone never triggers review. When the gate is met and subagents are available, use two fresh reviewers: one for feasibility and architecture fit, one for risk and falsifiable verification. Give each the task, evidence snapshot, and raw evidence first and freeze their risk inventory; then give both the identical plan without your reasoning or desired verdict. Each returns a coverage ledger and one verdict: VERIFIED, REVISE (a supported BLOCKER or MAJOR remains), or BLOCKED (insufficient evidence or competence). Revise the same plan and re-review the identical revision, at most two recheck cycles. Never vote away a supported finding. If reviewers are unavailable, do two explicitly separate self-reviews with the same mandates and disclose that.

## Stop and ask when

- a user-owned decision changes the outcome and cannot be bounded as an assumption;
- the evidence snapshot drifted since planning began and the drift changes a decision, slice, or verification;
- the plan would require authority the request did not grant.

## Done when

Read the plan as a fresh implementer: every consequential choice is decided or explicitly blocking, every changed area serves an acceptance condition, mixed states are viable where relevant, and every condition has observable, falsifiable evidence. Return the canonical plan, snapshot, assumptions, unresolved user-owned decisions, coverage ledger, verification strategy, reviewer dispositions, and freshness status. Before implementation begins, recheck freshness-critical inputs against the snapshot and revise if drift changes a decision.
