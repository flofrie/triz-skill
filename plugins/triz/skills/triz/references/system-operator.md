# System operator (9 windows)

Use the system operator when the question is where a system is heading, what will replace it,
or where the next opportunity or threat lies. It is also a quick way to widen a narrow view of
a problem before solving it. Also known as multi-screen diagram, 9 boxes, 9 screens
(German: Systemoperator, Neun-Felder-Denken).

## The grid

Rows are system levels, columns are time.

| | Past | Present | Future |
|---|---|---|---|
| **Supersystem** | What the predecessor worked within | Users, partners, platforms, market, regulation around the system today | How that environment is changing |
| **System** | The predecessor that did the same job | The system under analysis | What will do the job next |
| **Subsystem** | Parts of the predecessor | Components, roles, data, steps of today's system | How the parts are evolving |

Define the system by its main function (what it does for whom), not by its current form. That
makes the past and future columns meaningful: the past system is whatever did the same job
before, and the future system may look very different.

## Steps

1. Describe the present system and its main function.
2. List 5–10 subsystems: components, roles, data, process steps, technologies.
3. List 5–10 supersystem elements: users, buyers, partners, competitors, platforms, regulation,
   the organisation around it.
4. Pick a past point (far enough back that the system looked different) and fill in the past
   system, its parts and its environment.
5. Pick a future point (typically 3–10 years for business systems, 1–3 years for software
   components) and project how subsystems and supersystem evolve. Use the trends in
   `evolution.md` to keep the projection disciplined.
6. Derive the future system from those changes. Check it is consistent with the trajectory from
   past to present.
7. Write one sentence on the main trajectory.

Then ask what follows for the user's decision: which contradiction blocks the step to the
future system, which part is lagging, what should be built, bought, dropped or watched.

## Working modes

- **Answer mode** (default): fill the grid from what the user said, state assumptions about
  years and elements, and give the trajectory and implications.
- **Workshop mode**: propose each step, wait for the user to confirm or correct, then continue.
  Ask for the past and future years with a recommendation.

## Using it to explore a problem

For a concrete problem rather than a forecast, read the columns as "before the problem occurs /
while it occurs / after it occurred" and look for interventions in each of the nine cells:
prevent it in the supersystem, absorb it in the subsystem, recover from it afterwards. Many
good ideas sit outside the cell where the problem is visible.

## Example: internal BI reporting

Main function: give managers the numbers they need to decide.

| | Past (2010) | Present (2026) | Future (2030) |
|---|---|---|---|
| **Supersystem** | Monthly management meetings, ERP, finance controlling | Weekly business reviews, cloud data platform, data governance, self-service culture | Decisions made inside operational tools, AI assistants in every workflow, real-time data contracts |
| **System** | Excel reports built by controlling | BI dashboards built by a central data team | Answers generated on demand where the decision happens |
| **Subsystem** | Manual extracts, pivot tables, email distribution | Data warehouse, semantic layer, dashboards, data engineers | Governed semantic layer, metric definitions as code, natural-language query, embedded widgets |

Trajectory: reporting moves from a separate artefact to a function embedded in the tools where
decisions are made; the semantic layer becomes the part that matters and dashboards become
optional.

Implication: investment in dashboard polish is a bet on a maturing system. The lagging part is
metric definitions; the contradiction to solve is "definitions must be central (to be
consistent) and local (to fit each team's questions)".
