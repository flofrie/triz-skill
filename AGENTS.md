# Working on this repository

Instructions for coding agents (Claude Code, Codex and others) working on this repo. `CLAUDE.md` imports this file.

## What this is

A TRIZ skill for software, product, business and organisational problems, packaged in the open Agent Skills format (`SKILL.md` plus reference files and a script). The repo is also a Claude plugin marketplace with one plugin, `triz`. Physical engineering is out of scope.

Before changing anything substantial, read:

- `docs/design.md`: goal, sources and the numbered design decisions (D1, D2, …).
- `docs/backlog.md`: open ideas and known gaps.
- `docs/notes/`: dated notes from using the skill.

## Layout

- `plugins/triz/skills/triz/SKILL.md`: gate, router, contradiction workflow, answer format.
- `plugins/triz/skills/triz/references/`: one file per tool or knowledge area, loaded on demand.
- `plugins/triz/skills/triz/scripts/matrix.py` and `matrix.json`: contradiction matrix lookup.
- `plugins/triz/.claude-plugin/plugin.json` and `.claude-plugin/marketplace.json`: plugin manifests.
- `evals/cases.json`: test prompts, including cases where the skill must stay out.
- `tests/`: matrix data and script tests.

## Rules

- **Decisions go into `docs/design.md`** as a new numbered entry with the reason. Open ideas go into `docs/backlog.md`. Session notes go into `docs/notes/YYYY-MM-DD-topic.md`. Update existing entries instead of adding near-duplicates.
- **The repo is public.** No client names, client situations or other confidential details in code, docs, examples or evals. Use generic scenarios.
- **Never write matrix cells from memory.** Change `matrix.json` only with a cited source, add the cell to `tests/test_matrix.py`, and record the source in `NOTICE.md`.
- **Keep SKILL.md lean.** Detail belongs in `references/`; SKILL.md routes to it. Every file a reference mentions must exist.
- **Frontmatter stays portable:** `name` and `description` only, each on a single line, description under 1,024 characters and without angle brackets. OpenClaw's parser accepts only single-line keys.
- **Paths in SKILL.md are relative to the skill folder**, so the skill works wherever an agent installs it.
- **Skill text is English, with German trigger terms in the description.** Examples are software and business only.
- **Attribution:** when adapting third-party material, keep its licence terms and update `plugins/triz/skills/triz/NOTICE.md` (and the copy in the repo root).
- **Version:** bump `version` in `plugins/triz/.claude-plugin/plugin.json` when the skill's behaviour changes (patch for fixes, minor for new tools or routes).
- **Writing style for skill text and docs:** plain, specific prose. Lead with the point, use concrete examples, avoid filler phrases, stock vocabulary ("leverage", "seamless", "robust"), decorative "not X but Y" contrasts and summary paragraphs that repeat the opening.

## Checks before committing

```bash
python3 -m unittest discover -s tests
python3 plugins/triz/skills/triz/scripts/matrix.py --find latency   # smoke test
```

After changing SKILL.md, check the description length and that every `references/…` path it mentions exists. After changing routing or the gate, run a few prompts from `evals/cases.json`, including the `should_trigger: false` ones.
