# Resources

A resource is anything already available in or near the system that can be used to solve the
problem. The best solutions use resources that are free, ready to use and already present.
List resources before generating ideas, then ask: "which of these could be X in the IFR?"

## Checklist

**Information resources**: data already collected, logs and events, metrics, tickets and their
resolutions, documents, signals the system already emits, user behaviour that reveals intent.

**Time resources**: time before and after the operation, idle periods and off-peak hours, time
when the user is waiting anyway, parallel time (doing two things at once), existing rhythms
(sprints, releases, billing cycles, renewal dates).

**Space resources** (in software and organisations, "space" means places in a structure): unused
screen areas, existing fields in a schema, empty slots in a schedule or agenda, an interface
that is already there, the other side of an integration.

**Functional resources**: capabilities components have beyond their current role; a service,
team or role that could do its job and something else; standard interfaces, platforms and
tools already in use.

**Technical resources**: existing services, caches, queues, idle compute, open connections,
CI pipelines, feature-flag systems, observability tooling.

**Human and social resources**: the users themselves and their motivation, power users and the
community, partners, people already present at the moment of need, existing habits and rituals,
reputation and trust.

**Organisational and commercial resources**: existing contracts, distribution channels, the
brand, budgets that are already approved, governance forums that already meet.

**By-products and waste**: anything the system produces that nobody uses yet: error messages,
rejected requests, abandoned carts, churned-customer feedback, unused reports.

Derived resources are modified forms of the above: data aggregated or recombined, an idle
period moved to where it is needed, a harmful effect turned into a signal.

## Priority order

1. Resources inside the operating zone during the operating time.
2. Resources in the system as a whole.
3. Resources in the environment and supersystem.
4. Derived resources (modified forms of existing ones).
5. New resources only as a last resort, ideally cheap, short-lived or self-removing.

## Example

Problem: support team overwhelmed by repetitive questions in a SaaS product.
Resources: experienced users (human), existing help articles and past tickets (information),
the moment of error in the UI (time and place), error messages already shown (field: the UI
itself), the community forum (substance in the supersystem).
IFR: "the moment of the error itself answers the question." Idea: context-aware help inside the
error message, generated from resolved tickets on the same error code; power users recognized
for answers in-product.
