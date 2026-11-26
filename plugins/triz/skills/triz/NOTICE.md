# Third-party notices

This skill combines and adapts material from three MIT-licensed projects. All were changed for
this skill: physical-engineering content was removed, software and business examples were added,
and several files were rewritten. See `docs/design.md` in https://github.com/flofrie/triz-skill for what came from where.

## sampil/triz-skill

https://github.com/sampil/triz-skill — MIT License, Copyright (c) 2026 Semyon Pilyukov.

Source of the workflow in `SKILL.md`, `scripts/matrix.py`, `scripts/matrix.json` and the reference
files `principles.md`, `parameters.md`, `problem-modeling.md`, `separation.md`, `resources.md`,
`evolution.md` and `ariz.md`.

## Contradiction matrix data

The cell values in `scripts/matrix.json` come from [pytriz](https://github.com/mmysior/pytriz)
(`resources/matrix_values.csv`, version 0.4.0), MIT License, Copyright (c) 2026 Marek Piotr Mysior,
with three typo fixes made by sampil (cells 1/38, 8/25, 19/9). The data was cross-checked against
an independently sourced copy in truinorva/triz-skills (1,246 of 1,248 filled cells identical) and
the two differing cells against triz40.com.

## truinorva/triz-skills

https://github.com/truinorva/triz-skills — MIT License, Copyright (c) 2025-2026 truinorva and the
individual authors named in each skill.

- `references/root-conflict-analysis.md`: adapted from the `root-conflict-analysis` skill by
  Jens Träger, based on Valeri Souchkov's RCA+ method.
- `references/system-operator.md`: adapted from the `system-operator` skill by Robert Adunka,
  based on prompts by Jens Träger and Robert Adunka.
- `references/perception-mapping.md`: adapted from the `perception-mapping` skill based on a
  prompt by Robert Adunka; the method is Darrell Mann's.
- `references/trimming.md`: adapted from the `trimming` skill (prompt by Jens Träger) and the
  `interactive-trimming` skill (prompt by Tanasak Pheunghua).
- The "Satisfy" and "Bypass" fallbacks in `references/separation.md` follow the Litvin strategy
  set as described in truinorva's `physical-contradictions` skill.
