# TRIZ skill for software and business

A Claude skill that applies TRIZ, the Theory of Inventive Problem Solving, to software, product, business and organisational problems. TRIZ treats a hard problem as a contradiction (improving one thing makes another worse) and looks for a solution that satisfies both sides instead of a compromise.

The skill is meant to stay installed. A gate keeps it out of ordinary questions, and by default it answers with concrete ideas, risks and a next experiment rather than TRIZ vocabulary. It covers:

- the contradiction workflow: problem model, ideal final result, contradiction matrix, 40 principles, separation, resources;
- Root Conflict Analysis (RCA+) for tangled situations with disputed causes;
- perception mapping for stakeholder conflicts;
- trimming for systems and processes that have become too complex;
- the system operator (9 windows) and evolution trends for "where is this heading?";
- a condensed ARIZ for hard problems.

Principles, parameters and examples are translated for software and business. Physical engineering is out of scope. Answers follow the user's language; German trigger terms are included.

## Install

**Claude apps and Cowork:** Customize → Plugins → Add → Add marketplace, enter `flofrie/triz-skill`, then install the `triz` plugin. Updates follow this repository.

**Claude Code:**

```bash
claude plugin marketplace add flofrie/triz-skill
claude plugin install triz@triz-skill
```

**Single-skill upload:** run `scripts/package.sh` and upload `dist/triz.zip` under Customize → Skills.

## Layout

```
.claude-plugin/marketplace.json     marketplace with one plugin
plugins/triz/
  .claude-plugin/plugin.json
  skills/triz/
    SKILL.md                        gate, router, contradiction workflow, answer format
    NOTICE.md                       sources and attribution
    references/
      problem-modeling.md           function model, operating zone, IFR, contradiction forms
      parameters.md                 39 parameters with software and business equivalents
      principles.md                 40 principles with software and business examples
      separation.md                 resolving physical contradictions
      resources.md                  resource checklist
      root-conflict-analysis.md     RCA+
      perception-mapping.md         stakeholder perception maps
      trimming.md                   trimming rules A, X, B, C, D, E
      system-operator.md            9 windows
      evolution.md                  S-curve and trends
      ariz.md                       condensed ARIZ
    scripts/
      matrix.py                     contradiction matrix lookup, no dependencies
      matrix.json                   classical 39×39 matrix, cross-checked
docs/                               design decisions, source review, backlog, notes
evals/cases.json                    test prompts, including cases where the skill must stay out
examples/                           worked example
tests/                              matrix data and script tests
```

## Development

```bash
python3 -m unittest discover -s tests     # matrix data and script
python3 plugins/triz/skills/triz/scripts/matrix.py --find latency
```

Design decisions are in `docs/design.md`, the review of existing TRIZ skills in `docs/source-review.md`, open items in `docs/backlog.md`. Notes from trying the skill on real problems go in `docs/notes/`.

## Credits

Built on [sampil/triz-skill](https://github.com/sampil/triz-skill) (core workflow, references, matrix script) and [truinorva/triz-skills](https://github.com/truinorva/triz-skills) (RCA+, system operator, perception mapping, trimming). Matrix data from [pytriz](https://github.com/mmysior/pytriz). All MIT-licensed; details in `NOTICE.md`.

## License

MIT, see `LICENSE`.
