---
name: write-durable-documentation
description: Write a documentation-primary deliverable (README, decision record, runbook, changelog, explanation) with every claim verified against current code. Docs inside a code change stay with engineer-code-change.
---

# Write Durable Documentation

Own accuracy, audience fit, and maintainable placement for documentation-primary work, including an explanation with no file deliverable. Do not implement code, plan changes, or evaluate agents; hand defects found while documenting to their owning workflow.

## Establish scope and audience

1. Identify the audience, their starting knowledge, the questions the document must answer, and the moment it will be read.
2. Find the authoritative home first. Search existing documentation for the subject and update or restructure it rather than adding a parallel document. One authoritative location per subject; link from secondary locations.
3. Confirm the deliverable type: explanation, reference, procedure, decision record, or changelog. Each serves a different reader; do not blend them by default.
4. Agree what stays out: aspirational behavior, unreleased work, and internal detail the audience cannot act on.

## Verify every claim

- Derive statements from code, configuration, tests, schemas, history, and observed behavior, not memory or plausibility.
- Run every command, snippet, and procedure you document in a representative environment, or mark it explicitly as unverified. Record versions when behavior depends on them. Apply operate-production-safely when a documented command targets a live nonlocal environment.
- Document current behavior. Label intended or future behavior as such.
- Date or version drift-prone facts (external URLs, product names, limits, defaults) so staleness is detectable.
- Take examples from real runs. Never fabricate output. Sanitize secrets, credentials, and personal data.

## Write for the reader and the maintainer

- Lead with what the reader needs to act; put background and rationale after it.
- Prefer exact identifiers (paths, commands, flags, versions) over paraphrase, and keep terminology consistent with the code and interface.
- Keep structure proportionate: headings, tables, and diagrams must earn their place by navigation or comprehension value.
- Place the document where its owners will find and update it, follow repository conventions, and prefer generating reference material from source when drift risk is high.
- Update every neighboring artifact the change makes stale: tables of contents, indexes, cross-references, and now-contradicted claims.

## Stop and ask when

- the audience or deliverable type is ambiguous and the choice changes the document's shape;
- verifying a claim requires access, credentials, or a live environment you are not authorized to use;
- documenting reveals that the code, not the document, is wrong (report it; do not fix it here).

## Done when

Every claim is verified by execution or inspection or explicitly marked unverified, the document lives in its authoritative home, and stale neighbors are updated. Report what was verified how, the documents created or changed, the references updated, and any defects handed to engineer-code-change. An explanation delivered in conversation follows the same rules.
