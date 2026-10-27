# Agent skills

Do not edit these skill directories in place. Everything here except `impeccable`
is mirrored from the [agent-skills](https://github.com/S3n0001/agent-skills)
portfolio and will be overwritten by the next sync.

`.claude/skills` is a filesystem junction to this directory, so Codex and Claude
Code both read these files. Sync once, both see it.

## To change a skill

Edit it in the agent-skills repository, commit there, and the change is mirrored
here automatically by that repo's `post-commit` hook. To pull it in by hand:

```bash
npm run skills:sync
```

To see whether this directory has drifted without writing anything:

```bash
npm run skills:check
```

`skills:check` exits non-zero when stale, so it can gate CI.

## Exceptions

`impeccable` comes from a different source and is tracked in `skills-lock.json`
by its own installer. The sync script protects it by name and never touches it.

Skills deleted from the portfolio are deleted here too, so a removed skill cannot
linger and keep routing work to itself. Recover an overwritten or deleted skill
from this repo's git history.

The sync source defaults to `../../Agent Skills`; override it with the
`AGENT_SKILLS_PATH` environment variable. See `scripts/sync-agent-skills.mjs`.
