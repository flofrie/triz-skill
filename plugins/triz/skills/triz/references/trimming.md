# Trimming

Use trimming when a system, architecture or process has become too complex or expensive and the
question is what can be removed while keeping what it does. Trimming removes components and moves
their useful functions elsewhere, instead of optimising each component.

## 1. Function model

List the components of the system and its immediate environment: services, data stores, tools,
roles, teams, process steps, documents, the customer. Then describe each function as

| Tool | Action | Object | Result |
|---|---|---|---|
| Approval board | checks | Change request | Risky changes are stopped |
| Nightly batch job | copies | Orders to the warehouse system | Warehouse sees new orders the next day |

A function is an action by one component that changes or keeps a property of another component.
"Report exists" is not a function; "Report informs the steering committee about budget burn" is.

Mark each function as useful and sufficient, useful but insufficient, useful but excessive, or
harmful (see `problem-modeling.md`). Identify the main function of the system and the object it
acts on.

## 2. Choose what to trim

Good candidates:
- components that perform only auxiliary functions (they serve other components, not the main function);
- components with harmful or excessive functions;
- the most expensive or most complex components;
- components whose function is duplicated elsewhere.

## 3. State the trimming problem

"If we remove [component], then [benefit: cost, speed, simplicity], but [its useful function is
lost]." Key problem: "How do we keep [useful function] without [component]?"

## 4. Apply the trimming rules

Try them in this order. Each rule is a question about the function of the trimmed component.

- **A. Remove the object.** Is the object of the function itself unnecessary? If nothing needs to
  be checked, copied or reported, the tool goes too.
- **X. Use an external component.** Can something outside the system (a platform feature, a
  partner, a SaaS product, the client's own process) perform the function?
- **B. The object does it itself.** Can the object perform the function on itself? A change
  request that carries its own automated risk checks; data that validates itself against a schema;
  customers who serve themselves.
- **C. Another component takes over.** Can a component that remains in the system do it? Look in
  this order: one that already performs the same function on another object; one that performs the
  same function on a similar object; one that performs another function on the same object; one
  that has the resources to do it.
- **D. New market.** Is the trimmed, simpler system valuable to a segment that the full system was
  too heavy or expensive for?
- **E. Better alternative.** Is there a better or cheaper component, inside or outside, that does
  the job?

For each idea, say which rule produced it and what new problem it creates. A trimming idea often
creates a contradiction in the component that takes over; solve that with the contradiction
workflow.

## Example: change approval

System: change process for a core banking platform. Main function: get changes into production
without incidents.

Trim candidate: the weekly change advisory board (CAB). It checks change requests and stops risky
changes, but it adds up to a week of waiting and its members rarely have the context to judge.

- Rule B: the change request carries its own evidence (automated tests, blast-radius analysis,
  rollback plan), and low-risk changes with complete evidence are approved by the pipeline.
- Rule C: the peer review that already happens on every pull request takes over the risk check,
  with a named second reviewer for high-risk components.
- Rule A: changes behind a feature flag reach production dark; the risky moment becomes the
  flag switch, which needs a lighter check.
- Remaining CAB scope: only changes that touch shared infrastructure or regulatory reporting.

New problem: auditors expect a documented approval. That is a contradiction ("approval must be
manual for audit and automatic for speed") to solve next, for instance by separating the policy
approval (manual, once per change type) from the instance approval (automatic, per change).
