#import "@local/ethan-standard-style:0.1.0": *
#show: ekactl-style.with(
  section-number: 3,
  title: "Topology Strategies"
)

#import "@preview/cetz:0.4.2"

#let seeline(it) = [
  #set text(size: 10pt)
  #it
]

#let see(it) = seeline()[
  _See_ #it
]

#let powerset = $cal(P)$
#let nbhds = $cal(N)$
#let calB = $cal(B)$
#let calT = $cal(T)$
#let calA = $cal(A)$
#let calF = $cal(F)$
#let calU = $cal(U)$
#let calV = $cal(V)$
#let calC = $cal(C)$

#let Sphere = $SS$

#let dun = math.union.sq // disjoint union
#let cl = math.overline // closure
#let indmap = math.overline // induced
#let ior = math.degree // interior
#let bound = math.partial // boundary

#let card = [card]

= Connectedness

== Proving

- Cont image of connected space
- Intervals in $Reals$
- Union of connected sets with nonempty intersection
- Path-connected

== Disproving

- Find a separation
- Continuous map to a disconnected space
- Find a nontrivial clopen subset

= Compactness

== Proving
- Heine-Borel: in $Reals^n$ compact $<=>$ closed + bounded
- Cont image of a compact space
- Closed subset of a compact space
- Sequential compactness

== Disproving
- Find an open cover with no finite subcover
- Heine-Borel
- Sequence with no convergent subsequence

= Homeomorphism

== Proving
- Construct a homeomorphism (bicontinuous bijection)
- $(a, b)$ is homeomorphic to $Reals$
- Continuous bijection from compact space to Hausdorff space

== Disproving
- Homeomorphic spaces share all topological invariants
  - Connectedness
  - Compactness
  - \# of connected components
  - Removal of points
  - Local properties
  - Cardinality

= Metrizability

== Proving
- Construct a metric
- Embed into a metric space
- Smirnov-Nagata ($T_3$ with countable locally finite base)
- Urysohn (second countable and $T_3$)

== Disproving
- Break one of the properties
  - First countable
  - $T_3$
  - Normal
  - Sequences characterize closure
  - Points are $G_delta$
