# Live Command Gate

Read this immediately before every state-changing command against a live nonlocal environment. Complete each section from current evidence. If any applicable field is unresolved, stale, inconsistent, or unexpectedly broad, stop.

## Target

- Resolve provider or control plane, organization or tenant, account or project, environment, region and zone, service, exact resource identifiers, selector, and expected target count.
- Verify identity with authoritative metadata (resource IDs, labels, inventory, instance identity, deployed version). A prompt, shell title, hostname fragment, or copied command proves nothing.
- Read current version, configuration, health, workload, capacity and quorum, dependencies, jobs, queues, failover state, and recent changes relevant to the action.
- Identify operators, deployments, incidents, schedulers, autoscalers, controllers, and reconciliation loops that can race with or undo the action.

## Authority

- Verify the active execution identity and role through the approved endpoint.
- Name the authorization source, allowed action and scope, and any expiry or incident or change boundary.
- Confirm the authority covers this environment and this specific mutation. Access, urgency, or authorization for an adjacent target does not broaden it.
- Keep credentials out of commands, output, notes, and shell history.

## Action

- Inspect the effective command, API request, query, selector, parameters, target count, timeout, and expected state transition.
- Bound blast radius and duration. Prefer an idempotent, audited, declarative operation and a canary or representative slice when staging is possible.
- Use preview, plan, dry run, diff, or policy simulation only when it faithfully represents the real operation; resolve every difference before mutating.
- Separate independent state changes. A deployment, traffic shift, access change, cleanup, and controller restoration usually need distinct gates and readbacks.

## Stop

- State the observable continue, pause, abort, and escalation conditions from policy, runbooks, baselines, and service invariants.
- Stop on target or identity mismatch, unexpected cardinality, stale predicates, concurrent mutation, degraded dependencies, lost or contradictory observability, partial failure, ambiguous output, or expired authority.
- Define how the action is cancelled or contained without creating a worse partial state. Do not retry until actual state is reconciled.

## Recovery

- Name the exact known-safe rollback or roll-forward state, the steps to reach it, the latest safe reversal point, and the recovery owner.
- Verify recovery remains compatible with current data, configuration, dependencies, traffic, access, and version skew.
- Preserve break-glass and recovery access. For irreversible actions, record the authorized reason, affected scope, unavailable rollback, and follow-up obligation.

## Readback

- Read the exact target state from the authoritative control plane or data store, plus the aggregate service or user outcome and relevant dependency, security, data, capacity, and cost signals.
- Compare observed state with the expected transition and stop conditions. Inventory partial success before any retry or expansion.
- Continue only when both direct and aggregate evidence support the next action. Hand uncertainty to a named owner rather than claiming completion.
