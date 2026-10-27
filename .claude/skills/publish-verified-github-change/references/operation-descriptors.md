# Operation descriptors and high-assurance delivery

Select one descriptor per remote operation. Fill every applicable field with an exact value or an explicit sentinel (`ABSENT`, `SERVER_GENERATED`); never use a moving branch name as an object identity.

## Raw-object Git settings

When a review gates publication, take every identity, ancestry, diff, commit, and tree reading with raw-object semantics so a replace or graft overlay cannot change what the reviewer saw: set `GIT_NO_REPLACE_OBJECTS=1` or pass `--no-replace-objects` to every Git command; resolve the common directory with `git rev-parse --git-common-dir` and block when `git replace --list` is non-empty or an `info/grafts` or `shallow` file exists there; or use a proven clean object database. Never mix raw-object and default Git results in one evidence set.

## Direct push

- repository identity and canonical URL; remote and every fully qualified destination ref;
- exact expected old object per destination (`ABSENT` for creation) and exact proposed new object;
- target ref at its exact base object; raw-object merge base, outgoing range, head commit, head tree;
- PRs, auto-merge settings, and queue entries consuming each destination, with the provider-enforced barrier or the exact disclosed race;
- whether any destination is a non-fast-forward rewrite and, if so, its separate authority and recovery artifact;
- confirmation that tags, notes, follow-tags, extra refspecs, recursive submodule pushes, and implicit repository operations are disabled;
- required expected-old and expected-absent leases and multi-ref atomicity.

A separately authorized non-fast-forward rewrite needs the exact old and new objects, rewrite-specific review or confirmation, and a durable recovery artifact that already pins the old reachable graph with ownership, retention, restoration, and cleanup recorded. A lease alone never authorizes rewriting history.

## Direct provider merge or squash

- repository, PR number, provider operation; base and head repository and ref at exact objects, head tree;
- merge method and provider-visible title, message, and authorship; expected result tree; result object `SERVER_GENERATED` until read back;
- ordered parents: `[base, head]` for a merge commit, `[base]` for squash;
- a server guard binding both expected base and head, or the exact integration candidate to which checks and review bind; otherwise the disclosed base-movement race;
- relevant checks, approvals, threads, and merge-state prerequisites.

A head-only merge endpoint does not satisfy exact verification because the base may move. Provider-generated rebase is reviewable only when the complete generated commit sequence, order, parents, trees, and author, committer, message, and signature metadata are available as the actual candidate.

## Queue enrollment or auto-merge enablement

- repository and PR; base and head at exact objects, head tree; requested state transition and anticipated queue-controlled method; result merge group `SERVER_GENERATED`;
- a provider-enforced hold or required independent-review check keyed to every initial and rebuilt group object, with proof the publishing principal cannot bypass it; otherwise the exact disclosed automatic-integration race requiring fresh user confirmation;
- provider-visible queue, auto-merge, review, and check state before the transition.

Never enroll merely to obtain a merge-group candidate. Without a non-bypassable barrier, stop unless the user freshly confirms the disclosed possibility of integration before review; if the race wins, report the result as user-authorized but not independently verified.

## Merge-group integration

- repository; actual merge-group target ref and exact group object; exact base and head objects and head tree; included PRs and order; queue-controlled method;
- expected destination result tree and parent topology or generated sequence; checks and independent review bound to that exact group object; non-bypassable hold until eligibility;
- destination ref and expected old object at integration.

Any rebuild, reorder, retarget, base movement, or group-object change creates a new descriptor and candidate.

## Neutral review packet

```text
Independently review exact candidate commit <head object> against this task.

Task contract: <stable clause IDs with faithful sanitized text and typed redactions>
Clause crosswalk: <every material request clause mapped to the contract>
Repository: <identity and canonical URL>
Target: <fully qualified ref at exact raw base object>
Outgoing range: <base>..<head>; tree <head tree>
Operation descriptor: <one complete operation-specific descriptor>
Repository instructions: <paths the reviewer must read>
Change: inspect every commit and the aggregate raw-object diff in an immutable checkout
Verification: <commands, results, environment, and bound commit/tree>

Do not modify files or assume the author's conclusions. Return findings first,
a coverage ledger, and exactly one verdict: APPROVED, CHANGES_REQUIRED, or BLOCKED.
```

## Descriptor invalidation

Rebuild the descriptor and repeat review or confirmation when any field above changes, including any object, ref, tree, method, parent, guard, lease, hold, check, approval, disclosed race, or consumer state, or when a server-generated value's guarded inputs no longer match.
