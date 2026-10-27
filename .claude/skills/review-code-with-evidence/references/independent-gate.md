# Independent-Gate Procedure

Exact mechanics for freezing candidate identity and operation descriptors when review-code-with-evidence gates another agent's candidate.

1. For Git, use raw-object semantics for the entire identity, ancestry, diff, and tree review: set GIT_NO_REPLACE_OBJECTS=1 or pass --no-replace-objects to every Git command and block on any active replace or graft overlay. Never mix raw-object and default Git results in one evidence set.
2. Pin the local candidate proportionately. For a commit or branch, record repository identity, exact base, merge base, outgoing range, head, and tree and inspect immutable objects in an isolated read-only checkout. For a bounded uncommitted patch, record its complete digest, base, status, and file inventory; it may approve local iteration but never publication.
3. Only when the review gates publication or another external mutation, also require the publishing workflow's complete operation descriptor: exact destination, old and proposed objects or versions, method, topology, concurrency guard, consumers, and residual race. Do not invent a remote operation descriptor for a local review.
4. For non-Git candidates, pin the relevant system, baseline revision, candidate version or export digest, resource scope, and local acceptance contract. Add a proposed mutation manifest only when an external state change is actually under review. If the candidate cannot be frozen or exported, return BLOCKED rather than inventing identifiers.
