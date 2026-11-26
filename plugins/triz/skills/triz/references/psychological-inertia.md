# Psychological inertia: uncovering hidden assumptions

Altshuller called it psychological inertia: experience, jargon and the current design steer
thinking toward familiar answers without anyone noticing. Most "impossible" problems in software
and business rest on an assumption nobody stated. The tools below make those assumptions visible.
Pick one or two that fit; do not run them all.

## Real or habit: checking constraints

For each constraint the user states, ask where it comes from:

| Source | Type | What to do |
|---|---|---|
| Law, regulation, audit requirement | Real, but check the wording | Find what the text actually requires. "Approval must be documented" is not "approval must happen in a meeting". |
| Signed contract, SLA | Real until renegotiated | Check the clause. Note it for the next negotiation if it blocks the best idea. |
| Explicit client or user requirement | Real, but ask for the purpose | The purpose may allow other forms. |
| Physics, mathematics, platform limits | Real | Work within it, or change the operating principle (Bypass in `separation.md`). |
| "We always do it this way", tool defaults, org chart, inherited process | Habit | Part of the problem. Can be changed. |
| "Management won't accept", "the client expects" (unverified) | Belief | Treat as an assumption to test, ideally by asking. |

The most useful question to the user is often: "Which of these constraints are hard, and where
does each come from?"

## Plain words instead of jargon

Altshuller's ARIZ asks to replace specialised terms with simple words, because a term carries
its usual solution. Restate the problem without the names of current tools, roles and rituals:

- "sprint planning" → "deciding what the team works on next and agreeing on it";
- "the approval board" → "a check that a change will not break production";
- "onboarding call" → "the moment a new customer learns to get value from the product".

Then ask whether the plain-word version could be met in a completely different way.

## Function instead of device

Describe what the user or customer needs done, not the thing that does it today. Customers do
not want a dashboard; they want to notice a problem in time to act. Once the function is named,
the current system becomes one of several possible carriers. See also trimming
(`trimming.md`), which asks whether a function is needed at all.

## Size-time-cost operator (STC)

Change one dimension of the problem to an extreme and think the problem through again:

- **Size / volume:** one user, one transaction; or a million users, all at once.
- **Time:** the result is needed in zero seconds; or there are ten years to reach it.
- **Cost:** there is no budget at all; or the budget is unlimited.

At each extreme ask what happens to the problem, which solutions become obvious, and which part
of that solution could be brought back to the real scale. Zero budget forces the use of
resources already present; zero time forces work to move before the moment of need (principle 10,
preliminary action); one user often reveals a self-service or personal solution.

## Smart little people

Imagine the problem zone (a request path, a queue, a meeting, a hand-off between teams) filled
with tiny intelligent agents. What would they do, each on their own, to deliver both conflicting
demands? Describe their behaviour, then translate it into a mechanism: a rule, a signal, a
component, a role. Useful when everyone is stuck on how the current mechanism works.

## Reverse the problem

- **Inverse problem:** instead of removing a harm, could the system tolerate it, or use it?
  A flood of support tickets is also a map of where the product confuses people.
- **The other way round** (principle 13): swap who acts on whom. Instead of asking customers for
  data, show them what you already know and let them correct it.

## Signs that inertia is at work

- The same type of solution has been tried several times with small variations.
- Everyone uses the same word for the problem and the solution ("we need more governance").
- The problem is described by the name of the current tool or process.
- Objections start with "we can't, because…" without a source.
- The constraint list is long and nobody has checked where each item comes from.
