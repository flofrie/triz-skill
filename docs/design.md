# Design

Status: first version, 26 November 2026. Owner: Florian Friedrich.

## Goal

One Claude skill that applies TRIZ to software development and business problems: architecture and delivery trade-offs, product and pricing conflicts, team and organisation issues, client situations in consulting work. Engineering of physical products is out of scope.

The skill should be safe to keep installed all the time. That means it must stay quiet when TRIZ does not help, and when it does help, the answer should consist of concrete ideas for the user's system rather than TRIZ vocabulary.

## Sources

The skill combines two MIT-licensed community projects. `docs/source-review.md` has the assessment that led to this choice.

| Part | Source | What we did with it |
|---|---|---|
| Workflow, gate, answer format | [sampil/triz-skill](https://github.com/sampil/triz-skill) | Kept as the core, extended with a router to the added tools |
| Matrix data and lookup script | sampil (data from [pytriz](https://github.com/mmysior/pytriz)) | Kept unchanged |
| 40 principles, 39 parameters, separation, resources, problem modelling, evolution, ARIZ | sampil | Kept; physical-engineering examples removed, software and business examples kept |
| Root Conflict Analysis (RCA+) | [truinorva/triz-skills](https://github.com/truinorva/triz-skills) (Träger, after Souchkov) | Condensed into one reference file, technical example replaced |
| System operator (9 windows) | truinorva (Adunka, Träger) | Rewritten as one reference file with software and business examples |
| Perception mapping | truinorva (Adunka, after Mann) | Rewritten; the missing "Business Matrix" step replaced with our 39-parameter translation |
| Trimming, rules A–E and X | truinorva (Träger; Pheunghua for the extended rules) | Merged into one reference file with software and business examples |

## Decisions

**D1. One skill with a router, not several skills.** Separate skills compete for the same triggers ("contradiction", "root cause", "simplify") and each adds a description to every session. One skill with one gate decides whether TRIZ applies and then picks the tool. The tools live in reference files and load only when needed.

**D2. Gate first.** Ordinary bugs, questions answered by a known pattern, questions that need data first, and matters of taste get a direct answer with no mention of TRIZ. This is sampil's design and the main reason we chose it as the core.

**D3. Ideas first, method on request.** The default answer is the core conflict, two to five concrete ideas with mechanism and risk, and the cheapest next experiment. The TRIZ trail (parameters, matrix cell, principle numbers, IFR wording) appears only when the user asks for it or runs a workshop.

**D4. Two working styles.** "Answer" mode (default) works the problem through and replies once. "Workshop" mode follows the truinorva facilitator style: present a step, wait for the user's input, continue. Workshop mode is for running a session with a client or team, and the user switches to it explicitly ("let's do this step by step", "run a perception mapping session").

**D5. Software and business only.** Physical-engineering examples were removed from principles and separation to save tokens and keep analogies close to the user's world. Su-field analysis and the 76 standard solutions were dropped: they model substances and fields, and the useful part for software (missing, insufficient or harmful interactions) is already in the function model in `problem-modeling.md`. Scientific-effects search, patent analysis and sustainability assessment were not taken over for the same reason.

**D6. Never recall matrix cells from memory.** The classical matrix is looked up with `scripts/matrix.py`. We checked sampil's data against truinorva's independently sourced copy: they agree on 1,246 of 1,248 filled cells. For the two cells that differ (7/28 and 18/35), triz40.com confirms sampil's values.

**D7. No Business Matrix, no Matrix 2003.** Both are Darrell Mann's published work and not openly licensed as far as we can tell. Business conflicts are mapped to the classical 39 parameters through the software and business translation table in `parameters.md`. Perception mapping uses that table too.

**D8. English skill text, German triggers.** The description lists the German terms (Widerspruch, Zielkonflikt, Neun-Felder-Denken, Grundkonfliktanalyse, Trimmen, ideales Endresultat) so the skill triggers in German conversations. Answers follow the user's language. Russian terms from sampil were kept in a short line because they cost little.

**D9. Distribution through the repo.** The repo is a Claude plugin marketplace with one plugin (`triz`) that contains one skill (`triz`). Installing from the marketplace keeps the full skill with reference files and script, and updates follow the repo. `scripts/package.sh` builds a ZIP for a single-skill upload as a fallback.

## Not done yet

See `docs/backlog.md`.
