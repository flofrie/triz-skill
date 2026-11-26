# Resolving physical contradictions: separation

A physical contradiction says one element must be P and not-P. Separate the two demands so each
holds where or when it is needed. Check whether the demands really overlap: often they do not.

Ask in order:
1. Do both demands hold **at the same time**? If not → separation in time.
2. Do both hold **in the same place**? If not → separation in space.
3. Do both hold **under the same conditions** (for every user, load, input)? If not → separation by condition.
4. Must the **whole system and its parts** have the same property? If not → separation between system levels.
If the answer is "yes" to all four, look for an element whose state changes on its own when
conditions change (an adaptive mechanism, an event that flips a state), or use one of the two
fallbacks below, or reformulate the PC.

Be strict about overlap. Separation in time or space only resolves the contradiction if the
periods or places do not overlap. Two different but overlapping periods give a compromise, not
a resolution. Separation between system levels is almost always possible in principle; do not
skip it without trying.

Two fallbacks (from Litvin's strategy set):
- **Satisfy**: the two demands refer to almost, but not exactly, the same property (different
  frames of reference, different metrics). Satisfy both by measuring or defining them apart.
- **Bypass**: the contradiction comes from the chosen operating principle, not from the purpose
  of the system. Change the operating principle. Use as a last resort.

## Separation in time
The element is P at one moment and not-P at another.
- Typical principles: 9, 10, 11, 15, 16, 19, 21, 26, 27, 29, 34, 37.
- S: lazy loading; schedule heavy jobs at night; credentials valid only during a session.
- B: introductory pricing; seasonal staffing; a feature visible only during onboarding.

## Separation in space
The element is P in one place and not-P in another.
- Typical principles: 1, 2, 3, 4, 7, 13, 14, 17, 24, 26, 30.
- S: strict validation at the API boundary, permissive inside; data hot in one region, cold elsewhere.
- B: premium shop-in-shop inside a discount store; different rules for different departments.

## Separation by condition
The element is P under one condition and not-P under another (load, user type, input, temperature, direction).
- Typical principles: 1, 5, 6, 7, 8, 13, 14, 22, 23, 25, 27, 33, 35.
- S: rate limits that apply only to anonymous users; feature flags; adaptive quality by connection.
- B: free tier vs paid tier; strict approval only above a spending threshold.

## Separation between system levels (whole vs parts)
The system as a whole has property P; its parts have not-P (or the supersystem does).
- Typical principles: 1, 5, 6, 12, 22, 25, 27, 33, 40.
- Transition to subsystem: an API is flexible as a whole, but each endpoint has a strict contract.
- Transition to supersystem: one replica is unreliable, a quorum of replicas is reliable.
- Transition to the anti-system: combine a system with its opposite (chaos testing, a red team, a devil's advocate in a decision).
- S: each microservice is simple, the whole is capable; individual nodes fail, the cluster does not.
- B: each team is autonomous, the company is aligned through shared goals.

## After separating
Check that the separation boundary itself is cheap to create and manage. If the boundary
(the switch, the detector, the coordinator) becomes a new complex subsystem, look for a
resource that can serve as the boundary (`resources.md`).
