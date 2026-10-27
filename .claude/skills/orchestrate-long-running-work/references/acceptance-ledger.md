# Durable acceptance ledger

Use this only when the existing task or plan system cannot preserve a real cross-session or cross-owner mission. Keep one ledger and update facts in place.

```markdown
# Mission: <observable outcome>

## Contract

- Non-goals: <explicit exclusions>
- Preserved invariants: <behavior or data that must not regress>
- Constraints: <compatibility, time, environment, policy>
- Authority already granted: <local and external actions>
- Authority still required: <remote, destructive, production, or scope-expanding actions>
- Contract changes: <dated, explicit changes and source of authority>

## Evidence snapshot

- Repository or artifact identity: <path, URL, or system>
- Base/head/tree or artifact hashes: <exact identifiers>
- Environment and dependency versions: <only material inputs>
- Bootstrap and smoke recipe: <commands and expected observations>
- Known baseline failures: <evidence and ownership>

## Acceptance coverage

| ID | Acceptance condition or material risk | Owning slice | Status | Current evidence | Drift or blocker |
|---|---|---|---|---|---|
| A1 | <observable condition> | S1 | unverified | none | none |

Statuses: `unverified`, `in_progress`, `verified`, or `blocked`. A status is not evidence.

## Slices

### S1 - <observable outcome>

- Owner and bounded write set:
- Prerequisites and consumers:
- Preserve constraints:
- Verification and falsifying result:
- Integration and rollback point:
- Stop condition:
- Current state and evidence:

## Durable decisions

| ID | Decision or approved deviation | Evidence and tradeoff | Invalidated by |
|---|---|---|---|
| D1 | <decision> | <why later work relies on it> | <drift condition> |

## Current handoff

- Last reconciled state:
- Completed conditions and bound evidence:
- Open blockers and required owner or authority:
- Failed approaches worth avoiding:
- Next exact step:
```

Replace stale evidence rather than accumulating contradictory claims. Do not paste transcripts, hidden reasoning, secrets, or transient status chatter into the ledger.
