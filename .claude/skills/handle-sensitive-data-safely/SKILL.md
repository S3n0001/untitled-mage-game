---
name: handle-sensitive-data-safely
description: Access, export, disclose, retain, or erase sensitive data with purpose limitation, minimization, recipient checks, and lifecycle evidence. Erasure writes run under change-production-data-safely.
---

# Handle Sensitive Data Safely

Complete the authorized purpose while minimizing what is accessed, revealed, copied, retained, and propagated. Derived data, logs, exports, caches, and recovery copies are part of the same lifecycle.

This skill is primary when the outcome is access, disclosure, export, retention policy, or safe evidence and no other workflow owns the action. For privacy controls in code (redaction, log minimization), engineer-code-change is primary and this skill owns the data contract and proof. change-production-data-safely executes live record mutation including deletion and erasure; engineer-reliable-data-pipelines, migrate-contracts-safely, and respond-to-production-incidents keep their own outcomes. This skill rides alongside them to protect the full lifecycle.

## Choose proportionate depth

- **Lean:** metadata, aggregates, redacted output, or a familiar approved access path for a narrow purpose with no new copy or recipient.
- **Standard:** written purpose and field scope, least-privileged access, recipient and channel validation, copy inventory, expiry, and sanitized audit evidence for raw access or controlled transfer.
- **High-risk:** policy-required privacy, legal, security, or data-owner review, separation of duties, destination controls, and lifecycle verification for bulk, cross-tenant, externally disclosed, credential-like, highly sensitive, reidentifiable, cross-border, or irreversible work.

Use the organization's actual classification, retention, residency, approval, and breach rules. If policy or authority is unclear, stop or escalate; never invent a compliance conclusion or limit.

## Establish purpose and authority

1. Identify actor, approved purpose, data subjects or tenants, data classes, authoritative systems, geography, recipients, and the minimum fields and time range needed.
2. Read applicable privacy, security, retention, legal, residency, contractual, and operational policy. Separate requirements from optional risk reduction.
3. Verify that the requesting and executing identities may perform this purpose against this exact population. Tool access is not authorization.
4. Prefer metadata, counts, invariants, redaction, aggregation, synthetic data, or an approved isolated replica whenever they satisfy the purpose.
5. Decide what evidence may be retained, where, by whom, for how long, and how it will be disposed of.

Never ask users to paste secrets or raw records into chat, tickets, logs, commits, shell history, screenshots, fixtures, or evaluation artifacts. Never widen tenants, dates, fields, or systems because access happens to be available.

## Map the lifecycle and minimize use

Trace source, transformations, joins, derived attributes, indexes, stores, queues, caches, replicas, search, analytics, logs, exports, local downloads, vendors, and recipients, with the service and human identities, encryption and key boundaries, reidentification paths, retention clocks, holds, deletion queues, snapshots, and backups. Classify data by what it reveals, not its filename; masking, hashing, encryption, tokenization, and pseudonyms reduce exposure but do not remove sensitivity.

- Query only required rows, fields, tenants, and time ranges; prefer bounded counts and sanitized samples over dumps.
- Use the least-privileged approved identity and audited path; keep elevated access attributable, revocable, and short.
- Enforce tenant and authorization filters at the trusted boundary and revalidate them when data moves.
- Redact before display or transfer. Keep values out of exceptions, metric labels, traces, prompts, screenshots, source control, and build artifacts.
- Use approved encryption, key management, storage, and transfer channels; no unmanaged plaintext files or shared credentials.
- Verify recipient identity, destination, purpose, format, access controls, expiry, and onward-sharing limits before any disclosure or export.

If unexpected sensitive data appears, stop expanding the view, do not copy it, secure the output, and follow the exposure or incident process. Browsing further to estimate impact still requires authority.

## Gate sensitive-data state changes

Before granting access, exporting, disclosing, copying, changing retention, erasing, or otherwise changing sensitive-data state, complete:

- **Target:** systems, subjects or tenants, records, fields, time range, recipients, destinations.
- **Authority:** actor, approved purpose, policy or owner authorization, active execution identity.
- **Action:** exact access, transfer, transformation, retention, or deletion action and the copies or effects it creates.
- **Stop:** unexpected scope, field, recipient, destination, policy conflict, exposure, or loss of auditability.
- **Recovery:** revoke, quarantine, recall, expire, delete, or roll forward, with owner and any authorized irreversibility.
- **Readback:** source and destination state, effective access, audit trail, copy inventory, deletion or expiry evidence.

Recheck the gate for each distinct destination or destructive phase.

## Control retention and erasure

Resolve the authoritative population, systems of record, derived copies, processors, holds, minimum retention, and disposal obligation. Do not create or extend exports, snapshots, backups, rollback tables, or logs against policy merely to make deletion reversible. Hand the erasure mutation to change-production-data-safely; this skill owns the lifecycle result: verify erasure across replicas, caches, indexes, queues, logs, exports, downstream systems, local files, backups, and keys; distinguish immediate purge from governed expiry; confirm disposal with sanitized identifiers, counts, tombstones, key state, acknowledgements, and subsequent read behavior without recreating content. An application-row deletion does not prove lifecycle erasure.

## Stop and ask when

- purpose, authority, recipient, or population is unclear or broader than policy allows;
- the task needs a raw value you could satisfy with metadata, a count, or a redacted sample;
- unexpected sensitive data appears outside the approved scope.

## Done when

The purpose is met with the minimum access, every copy and recipient is inventoried with expiry or disposal evidence, temporary access and artifacts are removed or owned, and the record uses opaque IDs, bounded counts, schema names, timestamps, digests, and redacted examples only. Never claim data is anonymous, compliant, fully deleted, or safely shared without evidence covering the relevant policy and lifecycle boundary.
