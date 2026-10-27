---
name: change-production-data-safely
description: Backfill, correct, delete, purge, or reprocess production records with a frozen selector, preview, canary, resumable batches, and reconciliation. Not for read-only analysis or schema planning.
---

# Change Production Data Safely

Change exactly the intended production population, preserve required invariants, and make partial success reconcilable. The selector, transformation, input, checkpoints, and recovery decision are one versioned change unit.

This skill is primary for direct writes to persistent production data outside a pipeline's own versioned write path: correcting, creating, restoring, materializing, reprocessing, or deleting records or objects. migrate-contracts-safely owns compatibility and phase order; engineer-reliable-data-pipelines owns replay and backfill through a pipeline's own transformation and sinks; respond-to-production-incidents owns active response. Every command that reaches the live environment runs under the operate-production-safely gate. Inspection authority does not authorize mutation.

## Choose proportionate depth

- **Lean:** narrowly scoped, reversible correction with an exact selector, low contention, healthy readback, and a routine approved mechanism. Full gate and reconciliation still apply.
- **Standard:** add an immutable change artifact, read-only preview, representative canary, resumable batches, checkpoints, downstream observation, and explicit exception ownership.
- **High-risk:** add policy-required independent approval, stronger snapshot or manifest control, load rehearsal, protected-population checks, and staged recovery for destructive, irreversible, broad, sensitive, highly concurrent, cross-tenant, or weakly observed mutations.

Take batch sizes, rates, timeouts, windows, expected counts, and stop thresholds from current store behavior, policy, baselines, and owners. Unresolved values block execution.

## Freeze the change contract

1. Identify provider, account, environment, region, store, schema or bucket, table or collection, partition, tenant population, and active identity.
2. Pin the query or change code, parameters, source snapshot or input manifest, time window, transformation version, expected candidate population, and exclusions in an immutable reviewable artifact.
3. State the business outcome, preconditions, postconditions, tenant and authorization invariants, legal or retention constraints, downstream consumers, concurrency assumptions, and reconciliation authority.
4. Name who may approve, execute, pause, recover, and accept exceptions. Tool access is not data-change authority.
5. Apply handle-sensitive-data-safely when the selector, preview, logs, output, or recovery material can reveal restricted data.

## Preview the same population

Build a read-only baseline at the isolation boundary the write will use: candidate and excluded counts by tenant, partition, state, and risk category; protected records, duplicates, nulls, invalid legacy values, referential dependencies, holds, and version skew; write rate, locks, triggers, CDC, replicas, caches, search, exports, and downstream jobs; storage, log, queue, replication, timeout, and maintenance constraints; concurrent writers and the predicate that prevents stale selection or lost updates.

Preview matches and near misses and explain inclusion and exclusion with counts and sanitized identifiers. Stop on unexplained cardinality; never weaken the selector to match an expectation. Never rely on a default database, implicit tenant, wildcard, unresolved variable, or copied count.

## Make partial states safe

Use one bounded transaction only when locks, logs, duration, availability, and rollback are genuinely safe. Otherwise use version-checked idempotent batches over stable keys or an immutable manifest, with durable checkpoints and explicit pause and resume. Define how retries, deadlocks, timeouts, disconnects, concurrent writes, skipped rows, partial downstream effects, and ambiguous responses reconcile. A retry must not double-apply increments, repeat external side effects, or select a different population.

Use recovery material only when policy permits: a backup, export, before-value table, or rollback log is a new sensitive copy and may violate an erasure obligation. Prefer roll-forward when reversal would conflict with new writes, propagated effects, or retention rules.

## Gate every mutation

Immediately before the canary, each batch, each pause or resume, rollback, roll-forward, purge, and cleanup, complete:

- **Target:** environment, store, object set, tenant or partition, frozen selector or manifest, current candidate count.
- **Authority:** active identity and explicit permission for this data purpose, population, and action.
- **Action:** effective query or job version, parameters, bounded batch, expected record and invariant changes.
- **Stop:** mismatch, protected match, contention, lag, downstream divergence, lost visibility, or other pause and abort conditions.
- **Recovery:** idempotent retry, rollback, or roll-forward path; reversal boundary; allowed recovery material; owner.
- **Readback:** authoritative matched, changed, skipped, failed, and unchanged counts plus invariants and downstream outcomes.

Re-gate each batch from current state; an earlier preview does not describe the live population.

## Execute and reconcile

1. Run the smallest representative canary through the approved job runner, client, or control plane.
2. Verify counts, invariants, query or API behavior, replication, caches, indexes, streams, locks, latency, and resource pressure.
3. Continue in bounded batches only while the frozen contract and stop conditions hold; commit durable progress before advancing the checkpoint.
4. On partial or ambiguous execution, stop, determine which writes committed, and resume idempotently against remaining state.
5. At completion or abort, reconcile candidates against changed, unchanged, skipped, quarantined, and failed records and explain every difference.

For deletion or erasure, enumerate replicas, caches, indexes, queues, logs, exports, downstream processors, snapshots, backups, and key state. Distinguish immediate removal from governed expiry. Verify through sanitized keys, counts, tombstones, acknowledgements, and subsequent read behavior without recreating deleted content. If recovery copies are forbidden, record irreversibility and the authorized roll-forward repair path before executing.

## Stop and ask when

- preview cardinality or scope differs from expectation and cannot be explained;
- a batch size, rate, or stop threshold is unknown;
- the mutation is irreversible and authority for that consequence has not been stated;
- the write would touch a tenant, field, or system outside the frozen contract.

## Done when

Counts, invariants, downstream state, deletion obligations, and every batch are reconciled and explained. Record the immutable change artifact, targets, actor and authority, baseline, canary and batch results, checkpoints, pauses, retries, reconciliation, downstream status, recovery or irreversibility, temporary artifact disposition, and residual exceptions without raw sensitive values. Name an owner for every open item.
