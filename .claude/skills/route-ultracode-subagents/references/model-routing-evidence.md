# Model-routing evidence

Last verified: 2026-09-04 (model IDs aligned to the current Claude Code runtime; product-behavior sources last re-read 2026-08-14). Re-check the primary sources when names, availability, retention, or workflow behavior may have changed.

## Ultracode and dynamic workflows

- Ultracode combines `xhigh` reasoning with automatic dynamic-workflow orchestration; a human can also invoke one workflow with the `ultracode` keyword. Source: [Claude Code dynamic workflows](https://code.claude.com/docs/en/workflows).
- Workflow workers inherit the session model unless a stage routes another model. `CLAUDE_CODE_SUBAGENT_MODEL` overrides both, and `availableModels` can substitute a request. Source: [Workflow cost and model routing](https://code.claude.com/docs/en/workflows#cost).
- Subagents accept family aliases or full IDs. Resolution order is environment override, per-invocation model, frontmatter, then main-session model. Source: [Subagent model selection](https://code.claude.com/docs/en/sub-agents#choose-a-model).

## Current model positioning

- **Sonnet 5 (`claude-sonnet-5`)**: best balance of speed and intelligence; used here for narrow, exact work. Source: [Sonnet 5](https://platform.claude.com/docs/en/about-claude/models/whats-new-sonnet-5).
- **Opus 5 (`claude-opus-5`)**: positioned for complex agentic coding, deep reasoning, and review; used here for medium work. Source: [Model choice](https://platform.claude.com/docs/en/about-claude/models/choosing-a-model).
- **Fable 5.1 (`claude-fable-5-1`)**: Anthropic's most capable generally available model; successor to Fable 5 (`claude-fable-5`). Fable models can return `stop_reason: "refusal"`; confirm retention and zero-data-retention terms before routing restricted work to them. Used here for very complex implementation only after policy checks. Source: [Fable](https://www.anthropic.com/claude/fable).

## Policy boundary

Anthropic does not prescribe this Sonnet/Opus/Fable ladder. It is the user's operating policy informed by product positioning. Validate it against real quality, cost, latency, refusal, and substitution evidence; family names are not benchmark proof.
