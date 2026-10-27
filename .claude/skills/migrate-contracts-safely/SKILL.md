---
name: migrate-contracts-safely
description: Move a schema, API, event, protocol, config, or dependency contract through expand, migrate, switch, verify, and contract phases with mixed-version safety and real rollback. Code slices use engineer-code-change.
---

# Migrate Contracts Safely

Change a durable contract without losing data, stranding consumers, or making rollback fictional. A migration is a sequence of compatible states, not one diff or one deployment.

This skill is primary for the contract map, mixed-version guarantees, phase ordering, cutover criteria, rollback boundary, and retirement of the old path. Each local code slice runs under engineer-code-change with this skill owning its compatibility constraints. change-production-data-safely owns live backfills and record rewrites, release-production-changes owns candidate promotion, and engineer-reliable-data-pipelines owns delivery, replay, and time semantics. Local migration artifacts authorize no deployment, production access, backfill, cutover, or destructive contraction.

## Choose proportionate depth

- **Lean:** direct replacement only for a private contract with known consumers, truly atomic deployment or disposable state, and a verified recovery path.
- **Standard:** explicit expand, migrate, switch, verify, and contract phases with mixed-version tests, resumable movement, reconciliation, and owned cleanup.
- **High-risk:** add policy-required independent review, consumer discovery, representative rehearsal, longer compatibility preservation, and stronger cutover and irreversibility controls for public, externally consumed, high-volume, security-sensitive, data-destructive, cross-region, or weakly inventoried contracts.

Take coexistence windows, batch limits, performance gates, error thresholds, and approvals from actual consumers, service objectives, policy, baselines, and owners. An unknown value blocks that phase.

## Map the contract and its traffic

1. Identify current and target contracts, owner, producers, consumers, generated clients, persisted forms, caches, exports, jobs, pipeline stages, and external integrations.
2. Determine deployment topology and version skew: which components update independently, which states can coexist, and what rollback versions may return.
3. Inspect authorized metadata, sanitized samples, or safe replicas for volume, nulls, invalid legacy values, duplicates, constraints, retention, and concurrent writes.
4. State invariants for meaning, correctness, availability, authorization, auditability, performance, and recovery.
5. Record unknown consumers explicitly. Repository search does not prove every caller or stored representation is found.

Semantic compatibility is more than parseability: a rename, changed unit, new default, altered event meaning, different error, ordering change, or delete behavior can break a contract while types still validate.

## Choose a compatible state sequence

Use direct replacement only when every lean condition is evidenced. Otherwise:

1. **Expand:** add the new representation or behavior while old producers, consumers, and recovery versions remain valid.
2. **Migrate:** copy, backfill, or derive existing state through an idempotent, resumable, observable process that preserves authorization and tenant boundaries.
3. **Switch:** move authoritative writers and readers in a deliberate order. Declare one source of truth; if dual writes are unavoidable, define conflict authority, failure handling, reconciliation, and expiry.
4. **Verify:** compare constraints, counts, checksums, semantic samples, error behavior, latency, and consumer outcomes against sourced gates.
5. **Contract:** remove the old path only after old consumers and rollback versions are gone, reconciliation closes, the recovery decision is updated, and cleanup is authorized.

Keep phases independently deployable. At every boundary state the supported version combinations, who owns advancement, what pauses the migration, and whether rollback or roll-forward is safe. A runtime rename is usually add, copy, switch, remove.

## Make movement and failure recoverable

- Pin source scope, target representation, transformation version, reference data, checkpoints, and expected population.
- Make backfills idempotent and resumable across concurrent writes, retries, duplicates, partial batches, interruption, and restart.
- Never let a default turn unconvertible data into plausible but wrong data; quarantine exceptions with safe identifiers, counts, and an owner.
- Estimate locks, storage, logs, queues, replication, latency, and downstream impact before live movement.
- Identify the latest safe reversal point and every step that destroys rollback compatibility.

## Gate every live transition

Before a production backfill, writer or reader switch, schema enforcement, traffic cutover, old-path disablement, destructive contraction, rollback, roll-forward, or cleanup, complete:

- **Target:** environment, contract versions, components, consumers, data population, current authoritative path.
- **Authority:** active identity and authorization for this phase, target, and any destructive or public effect.
- **Action:** one bounded transition, expected mixed-version state, compatibility and data effects.
- **Stop:** consumer, correctness, authorization, performance, scope, observability, or reconciliation conditions that pause or abort.
- **Recovery:** rollback or roll-forward state, latest safe reversal point, preserved compatibility, owner.
- **Readback:** effective contracts and versions, authoritative reader and writer, reconciliation, consumer behavior, service outcome.

The execution skill (operate-production-safely, change-production-data-safely, or release-production-changes) is primary for the command itself; this gate preserves migration state across them.

## Verify reachable states and retire deliberately

Test fresh and upgraded instances, old and new producers and consumers, representative legacy data, partial migration, rerun, interruption and resume, rollback, and roll-forward. Exercise the real migration mechanism in a safe representative environment; generated SQL or a unit test alone proves nothing operational. Before contraction, prove old traffic has ceased through authoritative inventory and observation. Confirm cleanup of compatibility branches, shadow paths, dual writes, staging tables, temporary access, and migration jobs, or leave each with an owner and removal condition.

## Stop and ask when

- an unknown consumer or stored representation may exist and cannot be ruled out;
- a phase value (window, batch limit, threshold) is unknown;
- the next phase would destroy rollback compatibility and that irreversibility has not been explicitly accepted.

## Done when

The report states the phase sequence, deployment order, supported version matrix, known and unknown consumers, movement and reconciliation evidence, cutover state, rollback boundary, irreversible actions, cleanup status, and unresolved decisions. Never claim completion while an old consumer, data exception, or recovery assumption remains unexplained.
