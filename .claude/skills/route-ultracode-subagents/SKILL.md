---
name: route-ultracode-subagents
description: Claude Code only. Route Ultracode or dynamic-workflow stages to Sonnet 5 (easy), Opus 5 (medium), or Fable 5.1 (very complex) with exact worker prompts and resolved-model checks. Not ordinary single-agent work.
---

# Route Ultracode Subagents

Choose the lowest model tier that can reliably own each independently verifiable work item. Apply this only after Ultracode or a dynamic workflow is selected; it does not authorize settings changes, extra fan-out, or actions outside the user's authority.

## Establish runtime truth

1. Require an explicit human `ultracode` request, a direct dynamic-workflow request, or known `/effort ultracode` state. Difficulty alone never activates this skill.
2. Request a full model ID on every routed stage: `claude-sonnet-5`, `claude-opus-5`, or `claude-fable-5-1`. If a newer ID in the same family is the documented current release, use it and say so.
3. Check workflow and model availability when visible. Do not change `CLAUDE_CODE_SUBAGENT_MODEL`, an allowlist, provider settings, or the session model without authorization.
4. Distinguish requested from resolved models. Environment overrides and allowlist substitution can defeat routing; inspect runtime evidence or mark the resolved model unverified.
5. Apply confidentiality, retention, safety, provider, and budget constraints before capability routing.

Read the dated [model-routing evidence](references/model-routing-evidence.md) when availability, compatibility, privacy, or tier rationale matters, and refresh drift-prone facts against official documentation.

## Classify each work item

Classify the smallest coherent unit one worker can own and verify. Classify mixed requests stage by stage. Use the highest applicable risk or reasoning signal; line count is only a hint.

| Class | Model | Evidence | Example |
| --- | --- | --- | --- |
| Easy | `claude-sonnet-5` | One known seam, precise behavior, reversible, usually one or two files, no consequential contract, security, data, migration, or concurrency behavior | Change two known strings and run the focused check |
| Medium | `claude-opus-5` | A bounded feature, fix, review, or refactor with non-trivial reasoning across known components and understood failure and acceptance surfaces | Add validation across a handler, service, and tests |
| Very complex | `claude-fable-5-1` | Interacting systems, uncertain ownership, long-horizon work, large migration, difficult architecture, or consequential security, data-integrity, concurrency, compatibility, or rollback behavior | Implement a staged service split with mixed-version proof |

Escalate small but consequential edits: two authorization or migration lines are not easy. Classify discovery, implementation, and verification separately; a cheap discovery stage must not choose the implementation model.

## Shape the workflow

- One worker per coherent outcome, not per file. Use the minimum useful agent count.
- Parallelize only independent inputs with disjoint write sets. Serialize dependencies and shared-file edits.
- Give every worker an outcome, scope, preserve constraints, verification duty, and stop condition. Inspect its result before integration.
- Add an independent verifier when a medium or very complex implementation has a credible missed-failure path, and classify the verification on its own difficulty.
- When routed work spans sessions or owners, hand mission tracking to orchestrate-long-running-work; this skill owns only per-stage routing.

## Give Sonnet exact instructions

Never delegate with "make the small fix". For every Sonnet item, fill this contract with concrete evidence:

```text
Outcome: <one observable result>
Scope: <exact paths, symbols, or permitted write set>
Required change: <precise before/after behavior>
Preserve: <behavior, interfaces, formatting, and unrelated work that must not change>
Evidence: <focused command or inspection and the passing signal>
Return: <changed files, concise result, exact checks and outcomes, remaining uncertainty>
Stop if: <scope expands, evidence conflicts, or a consequential choice is missing>
```

Give Opus the same outcome, boundaries, integration contract, and falsifiable verification with method autonomy. Give Fable the full mission contract: architecture evidence, invariants, dependencies, failure and rollback semantics, integration ownership, and end-to-end acceptance. Verbosity is not evidence.

## Stop and ask when

- routing would require changing a model setting, allowlist, or provider configuration;
- a medium or very complex stage can only resolve to a weaker model and the user has not accepted that;
- the request is not actually an Ultracode or dynamic-workflow request.

## Done when

The integrated outcome is proven by inspecting the combined diff or artifact and running focused checks; every subagent returning is not completion. Report each item's class, requested and resolved model, result, verification, and any substitution, refusal, fallback, or unresolved risk. Never claim a requested model ran without evidence.
