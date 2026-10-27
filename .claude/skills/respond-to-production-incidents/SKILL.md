---
name: respond-to-production-incidents
description: Command an active outage, degradation, security event, data failure, or runaway load or cost through triage, containment, recovery, and communication. Post-incident causal analysis uses diagnose-root-causes.
---

# Respond to Production Incidents

Limit harm, restore a known-safe state, and keep one trustworthy record of facts, decisions, actions, and outcomes. Stabilization comes before complete diagnosis; urgency never removes target, authority, recovery, or verification boundaries.

Keep this workflow primary while impact is active, plausibly expanding, or not yet contained. Compose engineer-secure-systems for suspected compromise or security-control decisions, change-production-data-safely for corrective record writes, and handle-sensitive-data-safely for restricted evidence. After stabilization, move sustained causal analysis to diagnose-root-causes without losing the timeline. Tabletop, planning, and credential-free response are read-only; say so when no live action occurred.

## Choose proportionate depth

- **Lean:** localized, well-observed event with limited credible spread and at most one familiar reversible mitigation. One owner, compact timeline, minimum live-action gate.
- **Standard:** explicit command, operations, communications, and scribe roles; ranked hypothesis ledger; action log; stakeholder cadence; recovery criteria.
- **High-risk:** out-of-band coordination, specialist security, data, privacy, legal, vendor, or executive ownership as policy requires, stronger evidence custody, and independent review of irreversible containment for broad, cascading, integrity-threatening, or compromise-related incidents.

Set severity, cadence, decision times, and escalation from policy and observed impact. Never invent customer counts, thresholds, causes, deadlines, or regulatory duties.

## Declare and organize

1. Record symptom, detection source, start or detection time, affected services and populations, current impact, direction of change, and uncertainty.
2. Assign severity from actual and credible impact; do not wait for diagnosis to declare.
3. Establish an incident identifier, command channel, live state document, and decision authority, using an out-of-band path when normal access may be affected.
4. Assign command, operations, communications, and scribe. One person may hold several roles; keep the decisions distinct and hand them off explicitly.
5. Page owners for service, dependency, security, data, privacy, vendor, or business decisions.

Keep secrets, exploit material, and raw customer data out of the shared record.

## Build the live picture

Maintain a timestamped record of facts, hypotheses, decisions, actions, and results: impact and healthy cohorts and their rate of change; exact provider, account, environment, region, service, resources, versions, and active identity; service indicators, traffic, errors, latency, saturation, queues, correctness, security signals, dependencies, and cost; recent release, configuration, infrastructure, IAM, data, traffic, and vendor changes; automation, failover, recovery capacity, and concurrent operators; every action's actor, authority, target, expected effect, actual readback, and next decision.

Prefer direct state plus independent signals. Check whether telemetry, clocks, or communication paths are themselves failing. Preserve volatile evidence when doing so does not prolong harm.

## Stabilize with the smallest useful action

Prefer a bounded reversible mitigation: pause an unsafe process, stop exposure, shed optional load, isolate a failing cohort, constrain a compromised capability, or move to a known-compatible state. Change one discriminating variable at a time unless independent actions have separate owners and non-conflicting targets.

For every state-changing command, complete this emergency form of the operate-production-safely gate immediately before acting; apply the full gate when time permits:

- **Target:** exact live environment, resource or cohort, observed current state.
- **Authority:** active identity and the incident or change authority covering this action.
- **Action:** one bounded command, expected effect, likely blast radius.
- **Stop:** the observation that prevents, pauses, or aborts it, including lost visibility.
- **Recovery:** how to reverse or roll forward, who owns it, or the authorized reason reversal is impossible.
- **Readback:** direct target state and aggregate user or service outcome immediately afterward.

Do not omit a part when delay increases harm; write details that could not be captured beforehand into the record immediately afterward. Re-gate rollback, failover, traffic shifts, scaling, IAM changes, queue or data actions, cleanup, and restoration of access, traffic, controllers, or automation.

Never restart a fleet, revoke broad access, clear state, disable authentication, destroy evidence, or silence alerts merely to remove symptoms.

## Diagnose without delaying recovery

Keep a short ranked hypothesis ledger with supporting evidence, contradicting evidence, and the cheapest safe discriminating check. Distinguish the trigger, the root cause or earliest control defect, contributing conditions, and the recovery mechanism (which may not identify the cause). A clearly correlated safe rollback does not need root-cause proof first; a mitigation that helped does not make the correlation a root cause.

## Recover and validate

1. Verify supported user paths, authorization and tenant boundaries, data correctness, dependencies, backlog trajectory, and service indicators across affected populations.
2. Confirm the threat or failure cannot immediately recur through automation, retries, stale instances, credentials, caches, or queued work.
3. Reconcile partial writes, duplicates, missing events, temporary routes, elevated access, manual changes, disabled controls, and recovery artifacts.
4. Restore capacity, redundancy, alerts, controllers, traffic, and ownership in gated steps with readback after each.
5. Resolve only when observed exit criteria hold and a named owner accepts residual work; otherwise declare a stable degraded mode with its impact, next decision, and owner.

## Stop and ask when

- target mismatch, expired or unclear authority, unexpectedly broad scope, contradictory evidence, lost observability, unsafe destination capacity, or a recovery path that no longer holds;
- containment would be irreversible and policy requires independent review;
- the action needed exceeds the incident authority granted.

## Done when

Exit criteria are observed, integrity and security state are verified, and a sanitized timeline and evidence set are preserved with owned corrective actions that have observable completion tests. Each update separates confirmed impact, current mitigation, observed recovery, hypotheses, remaining risk, and next update; never promise an ETA or cause without evidence. Finish with the incident identifier, impact and duration, final service and security state, action readbacks, causal confidence, communications made, unresolved risk, and owners.
