---
name: evaluate-agent-behavior
description: Measure how an agent skill, prompt, tool, grader, or harness behaves with predeclared cases, controlled trials, and calibrated grading. Not for application tests or implementing the behavior under test.
---

# Evaluate Agent Behavior

Own the cases, graders, controlled trials, and evidence that show how an agent behaves. Do not implement the instruction or product under test; if remediation is requested, hand the bounded change to engineer-code-change or the candidate's own owner, then evaluate the revised candidate. Evaluation work is read-only except for requested cases, fixtures, graders, or harness artifacts.

## Define a measurable contract

Before any trial, record: the immutable candidate version; the observable outcome, pass conditions, anti-behaviors, safety boundaries, and preserved behavior; trigger, non-trigger, and near-match expectations; allowed tools, starting state, environment, and cost or latency budget; case and trial budget, aggregation rule, and release threshold.

Test invocation and capability separately: explicit invocation, automatic routing, and over-triggering are three different failures.

## Build cases and graders

Use the smallest falsifying matrix: representative work, target edge, tempting shortcut, non-trigger near match, and regression. Add adversarial cases only for a real recovery or safety contract. Specify each case before running it using the [case schema](references/case-schema.md).

Prefer deterministic artifact, state, command, or runtime checks; then stable reference comparison; then a narrow calibrated rubric. Grade outcomes before process; require process only to protect an observable invariant; never require hidden chain-of-thought. Prove the grader with a known-good result it accepts and a known-wrong result it rejects. Use UNKNOWN when evidence is unavailable.

## Gate comparative claims

For a single candidate, ordinary records suffice. For any comparison or causal claim:

1. Freeze an immutable manifest: candidate or treatment, context, model and tools, fixture, budget, grader, allocation.
2. Record exposure and isolation evidence. Instruction-scoped access is not process, filesystem, or credential isolation; missing evidence is UNKNOWN.
3. Give trials unique IDs; share no mutable state across arms unless declared.
4. Calibrate with good and wrong controls; keep intention-to-treat assignments; report load and tool failures.
5. For authenticated flows, verify the account or environment and credential rotation without recording secrets; block if unproven.

Never rank candidates on UNKNOWN or blocked evidence. Changed inputs invalidate the comparison.

## Run controlled trials

- Fresh agents and contexts with only real-invocation inputs. Hold task, tools, starting state, candidate, and grader constant.
- Run mutating cases only in disposable copies or isolated worktrees. Never mutate production, shared systems, or user work without authority.
- Use multiple trials when variance could change the decision. Declare whether success means one pass, a minimum rate, or consistency. Never average away a safety miss.
- Do not rescue trials with hints, accept unsupported verification claims, or change a grader after an inconvenient result without versioning and rerunning.
- Preserve prompts, outputs, tool evidence, grader versions, and scores; redact secrets.
- Keep author and subjective evaluator separate for high-impact or taste-dependent behavior. Treat timeouts, malformed output, and inaccessible evidence as UNKNOWN or infrastructure failure, not as pass or fail.

## Diagnose without implementing

For each failure, find the earliest wrong decision and classify its cause: instructions, trigger, context, tool, capability, harness, fixture, or grader. Look for reward hacking: changed tests, skipped steps, inert artifacts, brittle matching, verbose claims that satisfy the rubric without the outcome. Recommend the causal change; after it lands, rerun failed, regression, and non-trigger cases. Keep exploratory cases separate from release-blocking regressions until reliability justifies promotion.

## Stop and ask when

- the release threshold or aggregation rule was never declared and the result depends on it;
- a trial needs credentials, production systems, or user data;
- the candidate changed mid-evaluation.

## Done when

The candidate meets the predeclared threshold with no disqualifying safety or scope failure and no material regression or unjustified context cost, or the failing task class is reported plainly rather than hidden in an aggregate. Report versions, cases, graders, trial counts, raw evidence locations, failures and causes, threshold disposition, recommendations, and limits. Never claim untested improvement.
