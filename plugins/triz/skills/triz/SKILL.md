---
name: triz
description: Solve stuck software, product, business and organisational problems with TRIZ (Theory of Inventive Problem Solving). Use when improving one thing makes another worse and a compromise is not good enough, when something must be both X and not-X, when obvious fixes keep failing, when a messy situation needs untangling into its real conflicts, when stakeholders are locked in opposing views, when a system or process has grown too complex, or when asked where a product or system is heading. Also use when the user names TRIZ or its tools - contradiction matrix, 40 inventive principles, ideal final result, separation principles, ARIZ, Root Conflict Analysis (RCA+), system operator or 9 windows, perception mapping, trimming - including German terms such as Widerspruch, Zielkonflikt, technischer Widerspruch, ideales Endresultat, Neun-Felder-Denken, Systemoperator, Grundkonfliktanalyse, Trimmen. Do not use for ordinary bugs, known-pattern tasks, data questions or matters of taste.
---

# TRIZ for software and business

TRIZ resolves contradictions instead of trading them off. The aim is a solution where both
conflicting requirements are met, usually by using resources the system already has.

The method is your thinking scaffold, not the deliverable. The user wants concrete ideas that
would work in their situation: name the actual service, data, step, role, contract or customer.
TRIZ terminology without concrete mechanisms is "framework theater" and makes the answer worse.

Scope: software systems, delivery, product, pricing, organisation, teams, processes and client
situations. Physical engineering is out of scope; if a problem is purely physical, help without
this skill.

## 0. Gate: is TRIZ the right tool?

Use TRIZ when at least one holds:
- improving A degrades B, and a compromise between them is not good enough;
- one element must have opposite properties (strict and flexible, central and local, present and absent);
- the obvious solutions have been tried, or the problem keeps coming back;
- the situation is tangled and people disagree about what the problem is;
- the user explicitly asks for TRIZ or one of its tools.

Do NOT use TRIZ when the task is a defect with a findable cause (debug it), a known pattern
answers it, it needs measurement or data first, or it is a matter of taste. In those cases help
directly and do not mention TRIZ.

## 1. Pick the route

| The user brings… | Route |
|---|---|
| A clear trade-off or conflicting requirement | Contradiction workflow, steps 2–6 |
| A messy situation, several problems, disputed causes, fixes that keep failing | Root Conflict Analysis first (`references/root-conflict-analysis.md`), then steps 3–6 on the strongest contradictions |
| Conflicting stakeholder views, blame between groups, a politically loaded problem | Perception mapping (`references/perception-mapping.md`), then steps 3–6 |
| A system, architecture or process that is too complex or costly | Trimming (`references/trimming.md`); contradictions that appear go to steps 3–6 |
| "Where is this heading?", strategy, what replaces what | System operator (`references/system-operator.md`) with `references/evolution.md` |
| A hard, long-standing, high-stakes problem, or a request for ARIZ | `references/ariz.md`, which reuses the steps below |

Routes combine. A tangled client problem might go RCA+ → contradictions → trimming of the
solution. Say which route you take only if the user asked for a TRIZ analysis.

## 2. Choose depth and working style

Depth:
- **Quick** (default for a single clear contradiction): steps 2–4, then 6.
- **Standard** (fuzzy conflict, weak matrix hints, or after RCA+ or perception mapping): steps 2–6.
- **Deep**: ARIZ.

Working style:
- **Answer mode** (default): work the problem through and reply once with the result.
- **Workshop mode**, when the user wants to go step by step or is running a session with a team
  or client: present one step at a time with your proposal, wait for their input, then continue.
  Show the intermediate artefacts (cause table, perception list, function table, 9-window grid).

## 3. Model the problem

Before any solution, state:
- **System and its main function** (what it is for, from the user's or customer's point of view).
- **Undesired effect**: what goes wrong, where, when. Be concrete.
- **Constraints** as the user states them: budget, time, contracts, regulation, politics.
- **Mini-problem**: "achieve the result with minimal change to the system."

**Challenge the frame.** Problems arrive wrapped in assumptions that block the best ideas
(TRIZ calls this psychological inertia). Before solving, do three quick checks:
1. **Real or habit?** Sort each constraint into *real* (law, regulation, a signed contract, a
   client's explicit requirement, physics) or *habit* (how it is done today, how it was set up,
   what people believe is required). Ask what exactly the rule or contract says. Habits may be
   changed; treat them as part of the problem, not as its boundary.
2. **Plain words.** Restate the problem once without jargon and without naming the current
   solution: "a weekly CAB" becomes "someone checks that a change is safe before it goes live".
   The jargon word often carries the current form of the solution with it.
3. **One extreme.** Push one dimension to the limit (zero time, zero budget, a thousand times the
   volume, one user instead of all) and see which part of the problem disappears or gets worse.

More tools (size-time-cost operator, smart little people, function instead of device):
`references/psychological-inertia.md`. Use them when the problem has resisted solutions or the
user's framing feels fixed.

Mention a finding from these checks in the answer only when it changes something, for example
"the regulator requires a documented approval, not a weekly meeting". Do not list the checks.

If key facts are missing and guessing would change the answer, ask one or two short questions;
asking which constraints are hard is often the most useful question. Otherwise state your own
assumptions and continue.

Then formulate the **Ideal Final Result (IFR)**: "X ITSELF, without complicating the system,
without cost or harm, eliminates the undesired effect while keeping the useful function."
Name the element X. The IFR shows where to look, not what is achievable.
Details: `references/problem-modeling.md`.

## 4. Technical contradiction → matrix → principles

1. Write it as a pair: "If we [action], then [A improves] but [B worsens]." Also write the
   reverse pair (the opposite action improves B and worsens A).
2. Map A and B to the 39 parameters with `references/parameters.md`, which translates each one
   into software and business terms and lists common organisational conflicts. Pick one or two
   candidates per side when the mapping is uncertain.
3. Look up the matrix with the script. Never recall matrix cells from memory; they are easy to
   get wrong.

   ```bash
   python3 scripts/matrix.py 9 27                           # improving 9, worsening 27
   python3 scripts/matrix.py --improve 9 39 --worsen 27 36  # several pairs, ranked
   python3 scripts/matrix.py --find "latency"               # find parameters by keyword
   ```
   Paths are relative to this skill's folder. If scripts cannot run, open `scripts/matrix.json`
   and read the key `"improving,worsening"`. An empty cell means the classical matrix has no
   recommendation: go to step 5.
4. Read the suggested principles in `references/principles.md`. For each one, produce at least
   one idea specific to this system. Discard a principle only after trying it seriously.

## 5. Physical contradiction → separation

Sharpen the technical contradiction down to one element with opposite demands:
"[element] must be [P] in order to [benefit 1] and must be [not-P] in order to [benefit 2]."
In software and business the element is often a rule, a role, a meeting, a process step, a
data structure, a price or a commitment.

Resolve it by separating the demands in time, in space, by condition, or between the whole and
its parts. See `references/separation.md`, which maps each separation to the principles that
typically implement it. In Standard and Deep mode always do this step; physical contradictions
usually give stronger ideas than the matrix.

Then list **resources**: what is already in or around the system and costs nothing (data, idle
time, existing tools, people already present, habits, contracts, by-products). Ask which
resource could play X from the IFR. See `references/resources.md`.

## 6. Evaluate and answer

For each idea check: does it remove the contradiction or only move it? How close is it to the
IFR? What new problem does it create? Rough effort and cost to try.

Answer format, adapted to the request:

1. **The core conflict** in one or two plain sentences.
2. **Strongest ideas** (2–5): the concrete mechanism, why it resolves the conflict, the main risk.
   Lead with the best one.
3. **Other ideas worth a look**, briefly.
4. **Next step**: the cheapest experiment that would confirm or kill the best idea.

For RCA+, perception mapping, trimming and the system operator, add the tool's own artefact
(cause table, map, function table, 9-window grid) before the ideas, as each reference file describes.

Show the TRIZ trail (parameters, matrix cell, principle numbers, IFR wording) only when the user
asked for a TRIZ analysis, is in workshop mode, or wants the reasoning. Otherwise keep the method
out of sight and mention at most the principle behind an idea in a few words.

Answer in the user's language. German terms: Widerspruch (technischer / physikalischer),
WENN–DANN–ABER, ideales Endresultat (IER), Ressourcen, Separationsprinzipien, Innovationsprinzipien,
Neun-Felder-Denken, Grundkonfliktanalyse, Trimmen. Russian terms are understood too
(противоречие, ИКР, приёмы, ресурсы, АРИЗ).

## Pitfalls

- Jumping to solutions before the contradiction is clear.
- Mapping to parameters too loosely, then forcing principles that do not fit.
- Listing principles with generic advice ("make it dynamic") instead of concrete mechanisms.
- Accepting a compromise and calling it a solution.
- Adding a new tool, team or process when a resource already present could do the job.
- Using engineering parameters literally for business problems: translate them.
- Running a full RCA+ or perception map when the user had a clear trade-off and wanted ideas.
- Accepting a stated constraint as fixed when it is a habit, or questioning one that is a real legal or contractual limit.
