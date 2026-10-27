---
name: craft-contextual-ui
description: Design, critique, or refine product-specific frontend UI for hierarchy, responsive and accessible states, and rendered polish, verified in a browser. Code runs under engineer-code-change.
---

# Craft Contextual UI

Own the interface decisions that make a surface fit its product, and the rendered evidence that they work. When files must change, engineer-code-change owns integration and completion unless the user invoked this skill as primary; either way this skill supplies the UI acceptance criteria and the browser loop.

Choose the mode first:

- **Critique or audit:** inspect the rendered interface and return prioritized, evidence-backed findings without editing.
- **Design only:** produce the direction or artifact without implying it is implemented.
- **Authorized implementation:** make the scoped UI changes through the code-change workflow, then validate the rendered result here.

## Ground the interface

1. Read repository, product, brand, and accessibility guidance.
2. Inspect the current rendered surface when possible, plus nearby screens, components, tokens, assets, content patterns, and breakpoints.
3. Identify the audience, the surface's primary job, the dominant action, what must be noticed first, and what should stay familiar.
4. For an established product, extend its visual language. For greenfield or aesthetic-direction work, infer a concrete product world from the brief and use the [aesthetic direction reference](references/aesthetic-direction.md) to avoid default looks.
5. Form one design thesis: hierarchy, layout logic, type and color roles, interaction character, and at most one or two distinctive moves rooted in the subject. Commit to it unless alternatives were requested.

## Shape the experience

Every visible choice should clarify importance, action, grouping, state, or identity.

- Reuse existing primitives, tokens, icons, and dependencies; add a primitive only when the system cannot express the pattern cleanly.
- Use real content. Write specific labels, stable action names, useful empty states, and errors that explain recovery.
- Design the applicable loading, empty, error, disabled, validation, hover, focus, active, selected, overflow, and long-content states.
- Recompose at narrow widths instead of shrinking. Preserve reading order, content priority, touch targets, and freedom from horizontal overflow.
- Use semantic elements, associated labels, logical headings, visible focus, keyboard-operable controls, sufficient contrast, and reduced-motion behavior.
- Use motion to explain change or reinforce one moment, not as scattered decoration.
- Check consumers before changing shared or global styles; keep DOM and styling complexity proportional to the idea.

Reject interchangeable output: repeated rounded containers without grouping value, fake metrics, decorative charts, arbitrary gradients or glass effects, generic marketing copy, and a familiar type-and-color recipe applied regardless of product. Use such a pattern only when the content or the established system makes it the clearest choice.

## Prove it in the browser

Source inspection is not visual verification.

1. Launch the real interface through the repository's supported path and exercise the primary flow.
2. Inspect representative desktop and mobile widths and any intermediate width where layout risk concentrates.
3. Check hierarchy, alignment, rhythm, density, contrast, clipping, wrapping, overflow, real content, and fit with adjacent surfaces.
4. Exercise the relevant states and failure behavior. Navigate by keyboard; inspect focus, labels, and reduced motion.
5. When implementation is authorized, fix visible and interaction defects through the code-change workflow, rerun affected non-visual checks, and repeat the rendered pass. Otherwise report the defects.

For a subjective, ambitious, or high-risk surface, use a fresh evaluator given the product job and an observable rubric, not the builder's rationale, and validate its evidence before revising.

## Stop and ask when

- a product-defining choice (brand direction, information architecture, primary action) cannot be inferred safely;
- no runnable browser or representative state exists and the request needs visual verification;
- the fix requires changing shared styles whose consumers are outside the requested scope.

## Done when

The primary flow and relevant states were exercised in a real browser at representative widths with keyboard access checked, or the missing proof is named explicitly (never call it visually verified otherwise). Report the design direction, surfaces changed or reviewed, widths and states exercised, defects corrected, unverified states, and residual accessibility or product-fit risk.
