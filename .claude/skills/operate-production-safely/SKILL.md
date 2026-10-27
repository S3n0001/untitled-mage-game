---
name: operate-production-safely
description: Inspect or mutate a live nonlocal environment (host, cloud, IAM, queue, job, runtime) behind a target, authority, action, stop, recovery, and readback gate. Not for local code or infrastructure-as-code edits.
---

# Operate Production Safely

Bind every live action to the intended target, granted authority, an observable stop point, a recovery path, and a verified outcome. Live state is concurrent and perishable: read it again at the mutation boundary.

This skill is primary for a one-off live inspection or operational change, and the execution guardrail under release-production-changes, respond-to-production-incidents, change-production-data-safely, and the other production skills. Planning does not authorize access; read access does not authorize mutation; local source, configuration, or infrastructure-as-code edits are not live operations until an authorized action reaches a nonlocal environment.

## Choose proportionate depth

- **Lean:** read-only work, or a routine reversible action on a narrowly identified target with healthy observability and a known recovery path. Keep the full gate; keep the plan short.
- **Standard:** add a written baseline, preview, canary or bounded batch, observation between increments, and an explicit handoff for shared-service impact or multiple targets.
- **High-risk:** add policy-required approvals, independent target review, rehearsed recovery, stronger evidence preservation, and staged execution for destructive, access-critical, irreversible, unfamiliar, broad, weakly observed, or cross-boundary actions.

Take target limits, observation windows, stop conditions, and approvals from current policy, runbooks, topology, baselines, and accountable owners. If a required value is unknown, the action is blocked; never invent a number.

## Establish the operation

1. Read applicable ownership, change, incident, security, data, provider, and recovery guidance.
2. State the requested outcome and the mode: plan, inspect, or mutate.
3. Resolve control plane, organization, account or project, environment, region, exact resources, active identity and role, and authorization source.
4. Read current version, configuration, health, workload, dependencies, capacity, failover state, active jobs, recent changes, and any controller or automation that could race with or revert the action.
5. Define the smallest useful action, expected state transition, evidence of success, stop conditions, and recovery owner.

A credential, an open terminal, a copied command, a hostname fragment, or permission to inspect is not authority to mutate. Keep secrets out of commands, output, notes, and shell history; apply handle-sensitive-data-safely when inspection can reveal classified data.

## Gate every mutation

Immediately before each state-changing command, complete all six parts from current evidence, following [the live-command gate](references/live-command-gate.md):

- **Target:** exact environment and resources, verified from current state, with expected count.
- **Authority:** active identity and its permission for this action and scope.
- **Action:** the effective command or request, bounded effect, and expected transition.
- **Stop:** observable conditions that prevent, pause, or abort.
- **Recovery:** viable rollback or roll-forward, reversal boundary, and owner.
- **Readback:** direct target state plus aggregate service or user outcome afterward.

Do not carry a gate across commands whose target, state, authority, or recovery may differ. Lost observability, stale state, unexpected cardinality, concurrent mutation, ambiguous output, or an invalid recovery path blocks the next mutation.

## Execute in bounded increments

1. Inspect the effective command, request, query, selector, parameters, and target count. Use a trustworthy preview, plan, dry run, or policy simulation when one exists.
2. Prefer the approved declarative controller or audited API over unmanaged shell edits; keep the source of truth explicit.
3. Start with a canary or the smallest representative slice when staging is possible.
4. Read direct state and service outcomes after every command. Continue only when the expected transition is observed and no stop condition fired.
5. Reconcile partial or ambiguous success before retrying; make the next action idempotent and scoped to actual remaining state.

Treat delete, terminate, revoke, rotate, purge, truncate, detach, overwrite, reimage, failover, and broad network or IAM changes as destructive or access-critical. Avoid broad globs, implicit defaults, unresolved variables, ambiguous selectors, and unbounded recursion. If recovery is impossible, require explicit authority and record the irreversible consequence before acting.

## Stop and ask when

- any gate field is unresolved, stale, or unexpectedly broad;
- target, identity, scope, ownership, current state, or authority does not match the request;
- the action is destructive or irreversible and authority for that specific consequence has not been stated.

## Done when

The exact resource configuration, runtime state, permissions, health, and dependent behavior are read back and match the intended outcome, and temporary privilege, bypasses, debug paths, paused controllers, and recovery artifacts are removed or owned. Report targets, actor and authority, commands or change identifiers, start and end state, observed results, recovery status, and exceptions without secrets. Command success is not a healthy system; a preview is not completed work.
