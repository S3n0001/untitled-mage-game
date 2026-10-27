---
name: release-production-changes
description: Promote a prepared app, config, flag, or infrastructure candidate through staged exposure, health comparison, and rehearsed rollback. Not for Git publication, code changes, incidents, or data repair.
---

# Release Production Changes

Move one understood candidate into service through bounded exposure, observable decisions, and a credible recovery path. A merge, artifact build, or controller success does not prove a release.

This skill is primary for planned promotion of a prepared candidate. migrate-contracts-safely owns durable compatibility design, change-production-data-safely owns production-record writes, respond-to-production-incidents takes command if harm becomes uncontrolled, and every live release command runs under the operate-production-safely gate. Readiness review is read-only; execution needs explicit authority per target environment, and authority for one stage does not cover the next.

## Choose proportionate depth

- **Lean:** routine, reversible release with a proven deployment path, narrow exposure, healthy observability, and a known-compatible recovery artifact. Short release record, all command gates.
- **Standard:** add explicit readiness evidence, staged exposure, candidate-versus-baseline observation, decision ownership, and recovery rehearsal.
- **High-risk:** add policy-required independent review, stronger compatibility proof, smaller stages, longer observation as policy requires, and staffed recovery for broad, novel, irreversible, security-sensitive, data-affecting, multi-region, or weakly observed releases.

Take stage sizes, hold periods, thresholds, and approvals from service objectives, baselines, topology, runbooks, and accountable owners. Mark unresolved gates BLOCKED rather than inventing values.

## Define the release unit

1. Identify service, environments, regions, traffic or tenant populations, dependencies, owners, change window, and final steady state.
2. Pin the candidate to complete immutable identifiers: source, artifact digest, image, manifest, configuration, flag, and infrastructure revisions. Verify existence, provenance, contents, and runtime compatibility through authoritative systems.
3. Pin the recovery artifact or roll-forward target independently and verify it stays compatible with current data, configuration, secrets, dependencies, and consumers.
4. State the user-visible outcome, preserved invariants, expected transition, highest-risk failure, success evidence, and conditions that make rollback unsafe.
5. Keep unrelated repair, drift correction, cleanup, and contract removal out unless they are authorized phases with their own decisions.

Never deploy a moving tag, truncated digest, guessed recovery version, or locally rebuilt substitute when an immutable artifact exists.

## Prove readiness

Collect, proportionate to risk: tests and runtime verification against the exact candidate; effective configuration and secret references without values; capacity, quota, dependency, database, queue, and downstream readiness; telemetry that distinguishes candidate from control and detects user, correctness, security, and cost harm; mixed-version behavior across callers, workers, schemas, events, caches, and recovery versions; a practiced rollback or roll-forward path with reconciliation for partial rollout; a named operator, decision owner, communication path, and stop authority.

Block promotion when candidate or recovery identity is uncertain, the baseline is unhealthy, observability cannot reveal harm, recovery is incompatible, or a required owner is unavailable.

## Plan and gate each stage

For every stage name the exact target population and version transition; the signals and representative workload to observe; continue and stop conditions; the observation rule; the decision owner; the next allowed action. Preserve a control population while comparison is useful. Start with the smallest representative canary and expand only after readback. Treat reconciliation, traffic shift, failover, feature enablement, cleanup, and controller restoration as separate gated actions unless the control plane performs them atomically.

Immediately before each state-changing command, including recovery and cleanup, complete the release form of the live-command gate:

- **Target:** account, environment, region, resource or cohort, current version, candidate version, expected count.
- **Authority:** active identity and role, approved endpoint, authorization for this action and stage.
- **Action:** one effective command, its bounded exposure, expected transition.
- **Stop:** pause and abort conditions including lost telemetry, unexpected scope, incompatible state.
- **Recovery:** exact rollback or roll-forward target, compatibility, latest safe reversal point, owner.
- **Readback:** direct deployed state plus aggregate user and service outcomes before the next command.

## Execute and decide

1. Apply the stage through the approved controller or source of truth.
2. Verify that only the intended targets received the exact candidate and effective configuration.
3. Observe the declared signals under representative workload. Do not average a serious cohort failure into a healthy global metric.
4. Continue only when every stage gate passes; pause on uncertainty.
5. On partial or ambiguous application, stop expansion, inventory actual state, and choose an idempotent completion, rollback, or roll-forward.

Rollback is another production change, not an undo button: gate it, stage it, and verify user outcomes, not the version label. Prefer roll-forward when rollback would corrupt state, break a contract, or restore a known vulnerability. If impact becomes an incident, hand command to respond-to-production-incidents with the release timeline intact.

## Stop and ask when

- candidate or recovery identity cannot be pinned to immutable artifacts;
- a stage gate value (size, hold, threshold) is unknown and no owner can supply it;
- the next stage needs authority that was granted only for the previous one.

## Done when

The final version and effective configuration are read back on every intended target, and service objectives, data and security invariants, dependency health, capacity, cost, cleanup, and restored automation are confirmed. Record candidate and recovery identities, stage populations, decisions, deviations, operator and authority, timestamps, recovery actions, final state, and the remaining monitoring owner. Name every unverified environment, cohort, dependency, cleanup step, or recovery path.
