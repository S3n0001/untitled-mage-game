---
name: engineer-reliable-data-pipelines
description: Design or assess batch, streaming, CDC, replay, or data-quality pipelines for idempotency, checkpoints, lineage, late data, and cutover. Code slices use engineer-code-change.
---

# Engineer Reliable Data Pipelines

Deliver the intended facts completely, with defined timing and correction behavior, and make retries, partial failure, replay, and drift observable and recoverable. A successful task run is not proof of correct data.

This skill is primary for pipeline design, assessment, live semantics, and a multi-phase cutover. Each local code slice runs under engineer-code-change with this skill owning contracts, correctness, replay, and proof. operate-production-safely is primary for a one-off live control-plane command; change-production-data-safely is primary when a job rewrites, corrects, or deletes stored records outside the pipeline's normal write path; migrate-contracts-safely owns durable compatibility; release-production-changes owns promotion; handle-sensitive-data-safely covers restricted fields and evidence. Local implementation never authorizes a production launch, replay, cutover, or backfill.

## Choose proportionate depth

- **Lean:** bounded single-source, single-sink path with a simple owned contract, deterministic transformation, routine replay, and no sensitive or critical downstream decisions.
- **Standard:** add versioned contracts, lineage, idempotency, durable checkpoints, late and invalid-data policy, end-to-end observability, controlled replay, and reconciliation ownership.
- **High-risk:** add failure rehearsal, shadow comparison, stronger isolation and capacity controls, consumer sign-off, and staged cutover for critical decisions, financial or regulated data, destructive overwrite, broad fan-out, novel stateful processing, weak lineage, or expensive replay.

Take freshness goals, lateness windows, batch and retry limits, alert thresholds, replay scope, and cutover gates from consumer requirements, baselines, platform constraints, and owners. Do not invent numbers.

## Define contracts and lineage

1. Identify sources, sinks, producers, consumers, owners, schemas, deployed versions, service objectives, and the authoritative system for each fact.
2. Specify keys, types, nullability, units, event and processing time, ordering, uniqueness, corrections, deletions, and invalid-data behavior.
3. State output invariants, freshness and completeness expectations, duplicate and late-data semantics, and reconciliation authority.
4. Map lineage through transformations, state stores, aggregates, indexes, exports, models, and downstream decisions; mark restricted fields and retention boundaries.
5. Record version-skew requirements. A parser accepting bytes does not prove semantic compatibility after a unit, default, meaning, or delete change.

## Make delivery recoverable

Assume retries, duplicates, delay, reordering, partial failure, and restarts.

- Define stable record or event identity and the idempotency boundary. Prefer deterministic upserts, compare-and-set transitions, or deduplication over unsupported exactly-once claims.
- Separate event, ingestion, and processing time. Define watermarks, lateness, correction, and window closure from the business contract.
- Bind checkpoints to input position, transformation version, reference data, and committed output; advance only after owned side effects are durable.
- Define transaction boundaries across acknowledgement, state, sink writes, emitted events, and metadata; make non-atomic partial states visible and repairable.
- Version nondeterministic dependencies, models, reference data, and rules needed for replay; preserve a reproducible input layer when policy and cost allow.
- Bound concurrency, batches, retries, backoff, timeouts, poison records, and dead-letter handling. Give quarantined data an owner, retention rule, replay path, and alert.

For CDC or replication, define snapshot-to-stream handoff, lag behavior, tombstones, conflict authority, and loop prevention. No unowned bidirectional sync, no dual sources of truth.

## Design replay and backfill as products

Pin input scope, source snapshot or offsets, transformation and contract versions, reference data, target partitions, and expected cardinality. Decide whether output appends, upserts, overwrites, or emits corrections, and prevent double counting and unintended downstream notification. Use bounded resumable partitions, durable checkpoints, idempotent retries, and isolation or labels that keep live traffic, capacity, cost, alerts, and lineage interpretable. Reconcile source, accepted, rejected, transformed, and committed counts plus domain invariants before cutover. Never launch a broad live replay because the code happens to support it.

## Gate live pipeline state changes

Before launching, pausing, resuming, replaying, switching authority, changing offsets, draining state, or retiring a live path, complete:

- **Target:** environment, pipeline version, source offsets or snapshot, partitions, sinks, consumers, current authoritative path.
- **Authority:** active identity and permission for the operation, data purpose, and affected systems.
- **Action:** one bounded control-plane action or job, expected state and data effects, workload scope.
- **Stop:** correctness, lag, capacity, cost, duplicate, loss, privacy, or observability conditions that pause or abort.
- **Recovery:** checkpointed resume, rollback, roll-forward, shadow path, or source-of-truth restoration, with boundary and owner.
- **Readback:** control-plane state, checkpoints, source-to-sink reconciliation, consumer outcomes, direct data-quality evidence.

## Observe and cut over

Measure freshness and lag, source-to-sink completeness, invalid, duplicate, late, retried, and quarantined records, checkpoint age, stuck partitions, schema and transformation versions, throughput, saturation, cost, downstream pressure, and restricted-field policy failures. Monitor the monitors: absent input, frozen offsets, missing heartbeats, or failed quality checks must not look healthy.

For a new path: test representative history and edge cases in isolation, compare shadow output with the authoritative path using declared invariants, canary a bounded slice, switch the authoritative reader or writer deliberately, reconcile, and retire the old path only after compatibility and recovery criteria close. Temporary dual writes need conflict authority, reconciliation, an expiry condition, and one declared source of truth.

## Prove the pipeline

Test normal, empty, invalid, duplicate, late, out-of-order, corrected, deleted, retried, partially committed, resumed, replayed, and version-skewed inputs at the boundary that owns the behavior. Reprocess the same bounded input to challenge idempotency; stop and resume at checkpoint boundaries.

## Stop and ask when

- a freshness, lateness, or replay-scope value is unknown and no consumer or owner can supply it;
- a replay or cutover would touch live traffic, cost, or downstream consumers without explicit authority;
- source-to-sink counts do not reconcile and the difference is unexplained.

## Done when

Contracts, lineage, ownership, delivery and time semantics, failure and replay behavior, privacy constraints, rollout state, reconciliation evidence, and unresolved consumers or historical state are reported. Never call a pipeline lossless, exactly once, current, or correct without evidence for that precise claim.
