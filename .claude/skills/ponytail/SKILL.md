---
name: ponytail
description: "Apply opt-in minimalism when the user invokes $ponytail or asks for Ponytail or lazy mode. Prefer reuse, deletion, platform features, and the smallest correct diff. Never auto-trigger for ordinary work."
---

# Ponytail

Apply an opt-in minimalism mode to coding. Lazy means efficient, not careless: understand the real flow first, then minimize the solution. Default to **full** intensity for the current task only. Honor `lite`, `full`, or `ultra` when named, and stop when the user asks for normal mode.

## Climb the ladder

Stop at the first rung that fully satisfies the request:

1. **Does it need to exist?** Skip speculative work.
2. **Does the codebase already have it?** Search and reuse the owning helper, type, pattern, or seam.
3. **Does the standard library solve it?** Use it.
4. **Does a native platform feature solve it?** Prefer HTML, CSS, database, framework, or operating-system behavior over custom code.
5. **Does an installed dependency already solve it?** Reuse it; do not add a package for a few clear lines.
6. **Can one readable local expression solve it?** Keep it local.
7. **Only then:** write the minimum new code that is correct.

The ladder follows comprehension, never replaces it. Read the task and repository instructions, trace the real callers and consumers, and identify the source of truth before choosing a rung.

## Keep the change genuinely small

- Fix the root cause at the shared owning seam. A one-line guard in the common path is smaller than patches in every caller.
- Preserve every explicit requirement and reachable security, privacy, accessibility, data-integrity, error-handling, and compatibility invariant.
- Prefer deletion over addition and boring code over clever code.
- Avoid one-implementation interfaces, one-product factories, speculative configuration, parallel frameworks, scaffolding "for later," and new dependencies without measured need.
- Use the fewest files that produce one coherent, readable outcome. Do not force a one-liner that hides behavior or moves complexity elsewhere.
- When two small solutions are equivalent, prefer the one with safer edge behavior and lower ownership cost.
- Mark a deliberate simplification with a real ceiling using a `ponytail:` comment that names the ceiling and upgrade trigger.

A complex request may have a simpler equivalent path. Use it and explain the substitution in one line, but never drop a requirement merely to reduce the diff.

## Verify proportionately

A lazy change without proof is unfinished. Follow existing repository test conventions:

- Non-trivial logic such as a branch, loop, parser, or money/security path gets at least one focused runnable check.
- Add more checks only for materially distinct risks or acceptance conditions.
- Do not introduce a test framework for one change.
- A trivial one-liner needs no new test when existing coverage already proves it.

## Set intensity

| Level | Behavior |
| --- | --- |
| **lite** | Build what was asked and name the lazier equivalent in one line. |
| **full** | Enforce the ladder; prefer reuse, standard library, native behavior, and the shortest readable correct diff. |
| **ultra** | Challenge speculative requirements, try deletion first, and ship only the smallest demonstrated need. |

User requirements and safety invariants always outrank intensity.

## Stop and ask when

- the lazier equivalent would drop an explicit requirement or a reachable safety, privacy, accessibility, or data-integrity invariant;
- the smallest correct change needs a consequential product, contract, or authority decision only the user can make.

## Report briefly

Lead with the delivered code or outcome. Then use at most three short lines for what was skipped and the condition that would justify adding it, unless the user explicitly requested a report or walkthrough.

Pattern: `[result] -> skipped: [X]; add when [Y].`

The shortest correct, readable path to done is the right path.

## Done when

The requested behavior works, is proven proportionately, and the report follows the pattern above. Ponytail governs what is built, not whether the task is understood or whether required evidence is reported.
