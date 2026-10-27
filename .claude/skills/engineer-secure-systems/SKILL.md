---
name: engineer-secure-systems
description: Threat-model a system, trace attack paths, and design or verify preventive and detective controls with evidence. Code runs under engineer-code-change; active compromise under respond-to-production-incidents.
---

# Engineer Secure Systems

Make realistic abuse difficult, limit its impact, make material attack paths observable, and prove controls at the boundary that owns them. A checklist, a configuration diff, or a clean scanner result is not security evidence.

This skill is primary for threat modeling, security requirements, control design, hardening strategy, security-focused assessment, and detection readiness. For authorized implementation, engineer-code-change is primary and this skill owns the security contract, attack paths, controls, and proof. operate-production-safely is primary for a live security inspection or change, respond-to-production-incidents during suspected active compromise, release-production-changes when a candidate is being promoted, and handle-sensitive-data-safely for restricted evidence. Assessment is read-only. Local implementation never authorizes scanning, exploitation, credential use, persistence, traffic interception, or mutation of a live target.

## Choose proportionate depth

- **Lean:** a narrow control or boundary with known actors, low novelty, no live intrusion, and straightforward positive and negative verification.
- **Standard:** trace material attack paths, define layered prevention and detection, test bypass and failure behavior, record residual risk and ownership.
- **High-risk:** add policy-required independent review, adversarial testing in an isolated environment, supply-chain and recovery analysis, and explicit risk acceptance for privileged, internet-facing, multi-tenant, cryptographic, safety-critical, or weakly observable systems.

Take severity, test scope, alert thresholds, key and access policy, and risk acceptance from organizational policy, system impact, evidence, and owners. Never invent compliance claims or numeric risk rules.

## Establish the security contract

1. Identify protected actors, assets, data, capabilities, availability needs, entry points, administrative paths, external integrations, and deployment topology.
2. Map identities, sessions, authorization decisions, tenant boundaries, storage, messages, trust transitions, build and deployment principals, and recovery access.
3. Define credible adversaries and abuse cases: compromised accounts and dependencies, malicious tenants, insiders, automation misuse, accidental exposure.
4. State required security outcomes, mandatory policy, compatibility constraints, acceptance evidence, risk owner, and residual-risk decision.
5. Confirm exact authorization before intrusive testing or any credential use. Credential availability is not permission; keep reconnaissance passive until scope is clear.

Use identifiers, metadata, synthetic values, and redacted evidence whenever raw secrets or records are unnecessary.

## Trace attack paths

For each material threat, follow attacker-controlled input or capability to a protected effect across, as applicable: identity proof, session lifecycle, recovery, impersonation, privilege elevation, and server-owned authorization; tenant isolation, ownership checks, parsing, injection, deserialization, file handling, outbound requests, and unsafe execution; data exposure, tampering, deletion, inference, and cross-boundary movement; secrets, keys, cryptographic purpose, rotation, revocation, and failure behavior; hosts, containers, orchestration, networks, metadata services, and control planes; build provenance, dependencies, artifacts, signing, CI identities, and deployment authority; quotas, concurrency, retry, automation, and business-logic abuse; logging, alerting, response access, recovery, and attempts to disable them.

Record prerequisites, existing barriers, reachable impact, confirming evidence, and the earliest owner able to break each path. Do not inflate severity from a suspicious pattern without a credible path, and do not dismiss a path because one intended layer should block it.

## Design prevention and detection together

- Minimize attack surface, privilege, data, connectivity, and default permissions. Deny by default at a server- or control-plane-owned boundary.
- Keep one authoritative policy decision; reauthorize sensitive actions against current state; fail closed for protected invariants.
- Use established cryptographic libraries and managed key boundaries. Never invent protocols or treat encoding as protection.
- Isolate untrusted workloads and administrative paths; constrain egress, metadata access, lateral movement, and blast radius.
- Pin and verify trusted build inputs and artifacts. Treat dependency and CI identities as production principals.
- Design recovery so responders are not forced to disable protection. Give temporary exceptions an owner, expiry, and residual-risk record.

For every high-impact path not made impossible, define a detection hypothesis, trustworthy data source, benign baseline, evasion opportunities, actionable rule, telemetry-health check, response owner, and runbook. Log actor, target, decision, outcome, time, correlation, and control version, never secrets or unnecessary payloads.

## Gate live security actions

Before changing IAM, keys, secrets, network policy, runtime hardening, detection enforcement, audit routing, or a live control, and before any intrusive live test, complete under the owning live workflow:

- **Target:** environment, resource, identity, tenant or traffic scope, effective current policy, control version.
- **Authority:** active identity plus explicit authorization for this control change or test method and scope.
- **Action:** one bounded change or test, expected security and service effect, evidence produced.
- **Stop:** denial, availability, tenant, data, observability, scope, or unexpected-access conditions that halt work.
- **Recovery:** revert or roll-forward state, protected break-glass access, reversal boundary, owner.
- **Readback:** effective runtime policy, intended denial or alert, audit evidence, aggregate service and user outcome.

Never run destructive, persistence-establishing, denial-of-service, or customer-impacting tests against live systems without explicit method, target, authority, and stop conditions.

## Implement and prove controls

Fix the earliest owning boundary while preserving legitimate behavior. Add negative tests for unauthorized actors, tenants, malformed input, stale state, bypass paths, and control failure, plus positive tests for supported administration and recovery. Verify effective runtime state including inheritance, precedence, identity, region, version, rollout, and drift. Exercise detection end to end from a controlled signal to the operator-visible alert when feasible. Reassess attack paths after changes.

## Stop and ask when

- authorization for an intrusive test, credential use, or live control change is not explicit;
- a finding needs a compliance or legal conclusion you cannot evidence;
- the fix would remove protection that a responder or another tenant depends on.

## Done when

Security outcomes, boundaries and paths assessed, controls changed or recommended, exact evidence, live actions not taken, and residual-risk ownership are reported. Never describe an untested control as effective or an automated scan as proof of safety.
