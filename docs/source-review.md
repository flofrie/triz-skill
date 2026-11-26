# Source review

Assessment of existing TRIZ skills for Claude, done on 26 November 2026 before starting this repo. Both candidate repos were read file by file; their scripts were read but not executed.

## Candidates found

| Repo | Scope | Verdict |
|---|---|---|
| [sampil/triz-skill](https://github.com/sampil/triz-skill) | One skill: gate → model → contradictions → resources → evaluation; matrix script; ARIZ | Core of this repo |
| [truinorva/triz-skills](https://github.com/truinorva/triz-skills) | 27 skills in two plugins (technical, business) | Four tools taken over |
| [Cappe6969/triz-innovation-skill](https://github.com/Cappe6969/triz-innovation-skill) | Fixed 10-stage pipeline, Python CLI, MCP server; Claude Code oriented | Not used: heavy, and the fixed pipeline runs even for small problems |
| [sv/triz-skill](https://github.com/sv/triz-skill) | Skill plus MCP server for formal system analysis | Not reviewed (page did not load) |
| athola/claude-night-market `tome:triz` | About 450 tokens of cross-domain analogy and IFR | Too thin |
| lyndonkl/claude `morphological-analysis-triz` | Zwicky box plus 40 principles | Not reviewed in depth |

Anthropic publishes no TRIZ skill.

## sampil/triz-skill

Strengths for software and business use:

- Each of the 39 parameters has a software and a business translation, plus guidance for cost, UX, quality and security, which have no parameter of their own.
- Each of the 40 principles has software and business examples.
- Eight of ten example scenarios are software or business problems.
- The gate keeps ordinary questions out of TRIZ; the evals include negative cases.
- Method stays out of sight by default; "framework theater" is named as a failure.
- Matrix cells come from data via a script, not from model memory.

Weaknesses: a single commit (27 October 2026), no stars, anonymous author; no tools for messy multi-cause situations or stakeholder conflicts.

## truinorva/triz-skills

Strengths: content adapted from practitioners' prompts (Jens Träger, Robert Adunka); deep coverage of single tools; German terminology; facilitator style that suits workshops.

Weaknesses for our use:

- 24 of 27 skills target physical engineering; parameters stay in engineering language with no translation table.
- No gate; broad trigger words ("contradiction", "simplify system", "root cause analysis") pull the skills into unrelated conversations, and 27 descriptions load into every session.
- `perception-mapping` hands its output to a "TRIZ Business Matrix" that the repo does not ship, so the model would have to recall it.
- Ships Darrell Mann's Matrix 2003 under MIT; licensing of that data is unclear to us.

Tools taken over: Root Conflict Analysis (RCA+), system operator, perception mapping, trimming (classic and extended rules).

## Matrix cross-check

A comparison script read sampil's `matrix.json` and truinorva's `Altshuller_Contradiction_Matrix_AI.csv`, which come from different sources (pytriz vs. Träger's prompt data). Result: 1,248 filled cells in both, 1,246 identical. Differences:

| Cell | sampil | truinorva | triz40.com |
|---|---|---|---|
| 7/28 | 25, 26, 28 | 26, 28 | 25, 26, 28 |
| 18/35 | 15, 1, 19 | 15, 1, 1, 19 | 1, 15, 19 |

sampil's data is correct in both cases.
