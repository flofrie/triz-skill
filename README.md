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

### Other agents

The skill follows the open [Agent Skills](https://agentskills.io) format, so other agents that read `SKILL.md` folders can use it. Copy or symlink the folder `plugins/triz/skills/triz` into the agent's skills directory:

- **OpenAI Codex:** `~/.agents/skills/triz` (all projects) or `.agents/skills/triz` in a repository.
- **OpenClaw:** `openclaw skills install ./plugins/triz/skills/triz` from a clone of this repo, or copy the folder to `~/.openclaw/skills/triz`.

The matrix lookup needs Python 3 on the machine where the agent runs. Without it, the agent can read `scripts/matrix.json` directly, as SKILL.md describes.

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
      psychological-inertia.md      hidden assumptions: real vs. habit constraints, plain words, STC, smart little people
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
AGENTS.md, CLAUDE.md                instructions for coding agents working on this repo
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

## About TRIZ

TRIZ is the Russian acronym for *teoriya resheniya izobretatelskikh zadach*, the theory of inventive problem solving. Genrich Altshuller, a Soviet engineer and patent examiner, began developing it in 1946. He and his colleagues studied a large number of patents and concluded that inventive solutions follow a limited set of patterns that repeat across fields. A problem that looks new has usually been solved before somewhere else in a different form. TRIZ gives you ways to restate your problem abstractly, find the matching pattern and translate it back.

The central idea is the **contradiction**. Most hard problems contain one: making one property better makes another worse. Ordinary practice settles for a compromise. TRIZ looks for a way to get both.

- A **technical contradiction** links two parameters: "if we add more checks, quality goes up but delivery slows down". Altshuller's **contradiction matrix** maps pairs of 39 generic parameters to the **40 inventive principles** that resolved that pair most often in patents (segmentation, taking out, prior action, the other way round, and so on).
- A **physical contradiction** puts opposite demands on one element: "the approval step must be strict for risky changes and absent for routine ones". It is resolved by **separation**: in time, in space, by condition, or between the whole and its parts.

Around these sit tools for framing and directing the search:

- The **ideal final result** describes the function happening "by itself", with no added cost or complexity, and points to where to look.
- **Resource analysis** looks for what is already present and unused: data, idle time, people, by-products.
- **Function analysis** and **trimming** model what each component does and remove those whose functions can move elsewhere.
- The **system operator** (9 windows) views a system across past, present and future and across subsystem, system and supersystem.
- The **trends of evolution** and the S-curve describe how systems typically develop.
- **ARIZ** is a step-by-step algorithm for hard problems.

Practitioners later added front-end tools that help with messy, non-technical situations. Two of them are in this skill: Valeri Souchkov's Root Conflict Analysis (RCA+) and Darrell Mann's perception mapping.

TRIZ grew out of engineering. Its use for software and business is established but less mature. The 39 parameters and 40 principles need translation for software and business work, and practitioners disagree about how well the classical matrix carries over. This skill treats the principles as prompts for analogy and checks every idea against the user's actual system.

### Definitions and overviews

- [TRIZ](https://en.wikipedia.org/wiki/TRIZ) and [40 principles of invention](https://en.wikipedia.org/wiki/40_principles_of_invention) on Wikipedia: history, concepts, criticism.
- [TRIZ Body of Knowledge](https://aitriz.org/triz/triz-body-of-knowledge) (Litvin, Petrov, Rubin, Fey): joint attempt by MATRIZ and the Altshuller Institute to define the field and its terms.
- [MATRIZ TRIZ knowledge base](https://wiki.matriz.org/docs/triz/): reference material from the International TRIZ Association.
- [TRIZ: The Theory of Inventive Problem Solving](https://appel.nasa.gov/2010/02/23/aa_1-10_f_inventive-html) (NASA APPEL): one-page introduction built around contradictions.
- In German, the standard **VDI 4521** defines TRIZ terms and methods.

### Tutorials and tools

- [Oxford Creativity: What is TRIZ?](https://www.triz.co.uk/how) and their [learning centre](https://www.triz.co.uk/how/useful-resources): free introductions, webinars and case studies, including software problems.
- [WIPO TRIZ toolkit description](https://www.wipo.int/export/sites/www/tisc/en/docs/tisc-toolkit-triz-description.pdf): short practical guide to the matrix and principles.
- [Interactive contradiction matrix](https://www.triz40.com/aff_Matrix.htm) (triz40.com).
- [40 inventive principles with 160 operators](https://www.hs-kl.de/fileadmin/betriebswirtschaft/Aus_der_BW/Opinnometh/OntoSustIP/40_Inventive_Principles_with_160_Operators_2022.pdf) (Pavel Livotov, 2022): detailed sub-principles in a recommended order of use.

### TRIZ for software

- Kevin Rea, TRIZ and Software: 40 Principle Analogies, [part 1](https://metodolog.ru/triz-journal/archives/2001/09/e/index.htm) and [part 2](https://metodolog.ru/triz-journal/archives/2001/11/e/index.htm) (TRIZ Journal, 2001; archive copies).
- Ron Fulbright, [TRIZ and Software Fini](https://the-trizjournal.com/?p=8617) (2004), and Rob van den Tillaart, [a sequel](https://the-trizjournal.com/triz-software-40-principle-analogies-sequel/) (2006): complete the analogies for the remaining principles.
- Hartmann, Vermeulen, van Beers, [Application of TRIZ in Software Development](https://www.metodolog.ru/triz-journal/archives/2004/09/05.pdf) (Philips, 2004): experience report and limits.
- Darrell Mann, [TRIZ for Software?](https://www.metodolog.ru/triz-journal/archives/2004/10/04.pdf) (2004): the debate about whether TRIZ carries over to software.

### TRIZ for business and management

- Darrell Mann and Ellen Domb, [40 Inventive (Business) Principles with Examples](https://the-trizjournal.com/40-inventive-business-principles-examples/).
- Valeri Souchkov, [40 Inventive Principles for Business and Management](https://wumm-project.github.io/Texts/BusinessPrinciples-en.pdf) (ICG, 2022): 190 recommendations with 402 examples.
- Darrell Mann, [Application of TRIZ Tools in a Non-Technical Problem Context](https://metodolog.ru/triz-journal/archives/2000/08/a/index.htm).
- Souchkov, Hoeboer, van Zutphen, [Application of RCA+ to Solve Business Problems](https://the-trizjournal.com/application-of-rca-to-solve-business-problems/): the source method for this skill's Root Conflict Analysis.
- Review of Darrell Mann's [Hands-On Systematic Innovation for Business and Management](https://the-trizjournal.com/book-review-hands-systematic-innovation-business-management-darrell-mann/), the book that introduced perception mapping.

### Books

- Genrich Altshuller, *And Suddenly the Inventor Appeared* (1996) and *40 Principles: TRIZ Keys to Technical Innovation* (1997).
- Karen Gadd, *TRIZ for Engineers* (Wiley, 2011); Lilly Haines-Gadd, *TRIZ for Dummies* (Wiley, 2016), which has management examples throughout.
- Darrell Mann, *Hands-On Systematic Innovation for Business and Management* (IFR Press, 2004).

### Organisations

- [International TRIZ Association (MATRIZ)](https://matriz.org/)
- [Altshuller Institute for TRIZ Studies](https://aitriz.org)
- [Official G. S. Altshuller Foundation](https://altshuller.ru/world/eng/index.asp): Altshuller's original works.
