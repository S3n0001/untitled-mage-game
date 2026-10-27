# Agent behavior case schema

Use one record per predeclared case. Omit fields that cannot affect the result rather than filling them with ceremony.

```yaml
id: stable-case-id
purpose: behavioral claim this case can falsify
dimension: invocation | capability | safety | regression | recovery
candidate: immutable version or content identifier
comparison:
  treatment: assigned label; omit for one candidate
  manifest: immutable id for candidate/context, model/tools, fixture, grader, budget, and allocation
  exposure: isolated | instruction-scoped | unknown
  credential_gate: pass | n/a | blocked
input:
  user_request: faithful task text
  supplied_context: files, messages, or facts available at invocation
  starting_state: repository, fixture, services, permissions, and relevant hashes
  tools: allowed and unavailable tools
expected:
  trigger: trigger | do-not-trigger | explicit-only | not-applicable
  outcomes:
    - observable result or artifact
  preserve:
    - behavior or state that must remain unchanged
  anti_behaviors:
    - observable failure or scope violation
oracle:
  type: deterministic | reference | rubric
  procedure: exact check or evaluator instructions
  evidence_required: artifacts, state reads, commands, or observations
  result_values: [PASS, FAIL, UNKNOWN]
  calibration: good-pass-wrong-fail | n/a-one-candidate | blocked
trials:
  count: 1
  aggregation: all-pass | minimum-rate | capability-at-least-once
  disqualifiers:
    - failure that cannot be averaged away
safety:
  mutation_target: none | disposable-copy | isolated-worktree
  prohibited_effects:
    - production or shared external mutation
```

Record each run separately:

```yaml
run_id: stable-run-id
case_id: stable-case-id
candidate: exact candidate identifier
environment: model, tools, fixture, and material configuration versions
result: PASS | FAIL | UNKNOWN | INFRA_FAILURE
observations:
  - requirement: expected outcome or anti-behavior
    evidence: exact artifact, state read, command result, or evaluator observation
grader: version and evaluator identity or deterministic command
earliest_failure: first observable wrong decision, if any
cause_class: instructions | trigger | context | tool | capability | harness | fixture | grader | unknown
artifacts: retained raw-output and evidence locations
```

For comparisons, keep case definitions stable, report per-case outcomes before any aggregate, and never reuse a `run_id` across arms.
