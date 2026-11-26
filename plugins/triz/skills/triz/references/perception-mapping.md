# Perception mapping

Use perception mapping for people-heavy, politically loaded problems where stakeholders see the
situation differently and a technical analysis would miss the point: a stalled transformation,
blame between departments, a client relationship under strain. The method was devised by
Darrell Mann as a front end to business TRIZ. It turns stakeholder beliefs into a network,
finds where beliefs collide and where they converge, and hands the collisions over as
contradictions.

This is usually a workshop with real stakeholders. When the user works alone, they can write
perceptions on behalf of each stakeholder group; say clearly that the map then reflects the
user's view of the others.

## 1. Collect perceptions

A perception is a short statement of belief, worry, observation, cause or expectation, in the
stakeholder's own words, one per line. Aim for 30–150. Do not filter or judge. Label them P1, P2,
… and note which group each came from.

Good perceptions are specific: "Specs change after the sprint starts", "Marketing promises dates
before we estimate", "Reviews slow us down". Generic ones ("communication is bad") should be
asked about until they become specific.

## 2. Build the leads-to links

For each perception ask: "If this is true, what does it lead to?" Link it to exactly **one**
other perception, the one it leads to most directly. One outgoing link per perception is the
rule of the method: it forces a choice and reveals priorities. A perception may receive many
incoming links. If nothing fits, the perception has no outgoing link.

Record the links as a table (`P3 → P7`). For larger maps a Mermaid flowchart helps.

## 3. Find conflict pairs

Look for perceptions that cannot both be true or that pull in opposite directions ("More reviews
mean better quality" vs. "Reviews slow us down"). List them as conflict pairs with IDs.

## 4. Read the map

- **Collector nodes**: perceptions with many incoming links. They are where the system's
  problems converge and usually the best leverage points.
- **Loops**: chains that return to their start. They describe self-reinforcing beliefs
  (low trust → more control → less ownership → low trust). Breaking one link breaks the loop.
- **Paths between conflict pairs**: chains that connect two sides of a conflict show where an
  intervention could reconcile them.

## 5. Translate into contradictions

For each important conflict pair, collector node or loop:
1. Write the conflict as a technical contradiction ("If we [action], then [one group's need is
   met], but [the other group's need suffers]") and, where possible, as a physical
   contradiction on one element (a process step, a rule, a role, a meeting).
2. Map both sides to the 39 parameters using `parameters.md`, including the table of common
   organisational conflicts. Look up the matrix with `scripts/matrix.py`.
3. Continue with the contradiction workflow in SKILL.md: principles, separation, resources.

Do not use or cite a "business matrix" from memory. The classical matrix with translated
parameters is the lookup source for this skill.

## Output

1. Numbered perceptions (deduplicated), grouped by stakeholder.
2. Leads-to table, or a diagram.
3. Collector nodes, loops and conflict pairs, each with a one-line reading.
4. The two to four contradictions worth solving, and for each the strongest concrete ideas.
5. Suggested next step, such as a validation conversation with the stakeholders concerned.

## Example: release dates keep slipping, blame between engineering and marketing

Perceptions (excerpt): P1 "Specs keep changing" → P2 "Late rework" → P3 "Testing gets squeezed"
→ P9 "Bugs reach customers" → P11 "Marketing loses trust in dates" → P12 "Marketing announces
dates before engineering estimates" → P1.

That is a loop: each side's coping behaviour causes the other side's complaint.

Conflict pair: P7 "More reviews mean better quality" vs. P13 "Reviews slow us down".
Collector node: P14 "The team is tired of firefighting" (five incoming links).

Contradiction from the loop: "Launch dates must be fixed early (so marketing can plan campaigns)
and must be fixed late (so engineering commits only to what it has estimated)." Separation by
system level: commit early to a launch window and a customer outcome, late to the feature list.
Separation in time: announce in two stages, with the second announcement tied to a
release-candidate milestone.
