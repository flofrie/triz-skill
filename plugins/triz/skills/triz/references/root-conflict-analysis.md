# Root Conflict Analysis (RCA+)

Use RCA+ when the user describes a messy situation rather than a clear trade-off: several things
go wrong at once, causes are disputed, or a fix keeps failing. RCA+ (Valeri Souchkov) builds a
cause tree from the top problem downwards and looks for causes that produce a negative and a
positive effect at the same time. Those causes are contradictions: removing them would also
destroy something the organisation wants, which is why simple fixes fail.

RCA+ structures the problem. It does not solve it. Hand the contradictions it finds to the
contradiction workflow in SKILL.md (matrix, separation, resources).

## 1. State the top problem

One sentence, in one of four categories:
- **Negative effect**: something happens that should not (incidents, churn, complaints).
- **Insufficient effect**: a wanted result falls short (conversion, velocity, adoption).
- **Excessive effect**: the result is reached but costs too much (cloud spend, overtime, review effort).
- **Ineffective control**: the means of control exist but are too slow, inaccurate or unreliable
  (forecasting, release gates, budget control).

## 2. Find causes

Ask "What causes this?", never "Why?" ("why" invites goals instead of causes). State each cause
as a sentence in one of these forms:
- a function: subject + action + object ("Product owners add scope during the sprint");
- a relative parameter value: "Test coverage of the billing module is too low";
- a change that is too fast or slow: "Headcount grows faster than onboarding capacity";
- a state change: "The lead architect left".

Mark each cause as **factual** (verified) or **assumptive** (to be checked). Assumptive causes
are fine in a first pass, but say so.

For software and business problems, scan these areas so nothing obvious is missed: people,
process, information, tools and technology, structure and roles, incentives, customers and
market, regulation and contracts, strategy, culture.

## 3. Check AND / OR

Is this cause enough on its own to produce the effect (OR), or only together with others (AND)?
For a specific problem, causes are usually AND-related, and finding all AND partners matters:
removing any one of them removes the effect, so each one is a separate opportunity.

## 4. Classify each cause

| Tag | Meaning |
|---|---|
| **N** | Purely negative. Eliminate it. |
| **N+P** | Produces a negative effect and a positive one. A contradiction cause: the key finding. |
| **NC** | Negative but not changeable by us (law, a client's policy, the market). |
| **P** | The positive effect of an N+P cause, recorded for completeness. |

For every cause ask: "Does this also produce something we want?" If a cause has several positive
effects, keep the most important one.

## 5. Go deeper, then stop

Expand each **N** cause with step 2 again, and check AND partners for every new cause. Stop a
branch at an N+P cause (its positive effect already explains why it exists), at an NC cause, or
at a fixed requirement.

Do not chase the deepest root cause. Contradictions close to the top problem usually give
better solutions than ones far down the tree.

## 6. Summary table

| ID | Cause | Type | Positive effect | Negative effect (leads to) |
|---|---|---|---|---|

Show the tree as an indented list or a Mermaid flowchart if the user wants to see it.

## 7. Formulate the problems

For N causes: "How to eliminate / reduce [cause]?" These are often solvable directly, without TRIZ.

For N+P causes, write both forms:
- **Technical contradiction**: "If [cause], then [positive effect], but [negative effect]."
- **Physical contradiction**: "[Cause or its parameter] must be [P] to [positive effect] and
  [not-P] to avoid [negative effect]."

## 8. Recommend where to work

Rank the problems and give a reason for each:
- With AND causes, resolving any one contradiction removes the top problem; with OR causes,
  all branches must be handled.
- Prefer contradictions closer to the top.
- Prefer contradictions inside the system the user controls over ones in the supersystem.
- Prefer contradictions involving fewer parties.
- Simple N causes can be fixed straight away; list them separately as quick wins.

## Example: releases keep slipping

Top problem (insufficient effect): "Releases reach production two to three weeks after the
planned date."

| ID | Cause | Type | Positive effect | Leads to |
|---|---|---|---|---|
| 1 | Release scope is fixed by a quarterly commitment to the client | N+P | Client can plan its own rollout | Top problem (AND with 2) |
| 2 | Integration testing happens only after all features are done | N | — | Top problem (AND with 1) |
| 3 | The shared test environment is available to one team at a time | N+P | Low infrastructure cost | 2 |
| 4 | Features are cut late because nobody wants to disappoint the client | N | — | 1 |
| 5 | Client contract defines delivery as "all agreed features" | NC | — | 4 |

Problems:
- Cause 1 (TC): "If scope is fixed per quarter, the client can plan its rollout, but any delay in
  one feature delays the whole release." PC: "Scope must be fixed (for client planning) and must
  be flexible (to ship on time)." Strong candidate: close to the top and inside the delivery
  team's influence. Separation in time and between system levels look promising (fixed at the
  level of client outcomes per quarter, flexible at the level of individual features).
- Cause 3 (TC): "If one shared environment serves all teams, cost stays low, but testing
  queues up." Candidate for resources (ephemeral environments from existing CI) and separation in time.
- Cause 2 is an N cause: move integration testing earlier. Quick win, no TRIZ needed.
- Cause 5 is NC for now; note it for the next contract negotiation.
