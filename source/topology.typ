#import "@local/ethan-standard-style:0.1.0": *
#show: ekactl-style.with(
  section-number: 3,
  title: "Topology"
)

= Sets, relations, functions, and order

== Set notation

A set is defined by selecting elements from another set such that $S(x)$ is true:

$ {x in A : S(x)} "or" {x in A | S(x) } $

$\u{02300}$

== Cardinality

#let card = [card]

TODO

#definition[
  $ card A <= card B$ iff there is an injection from $A$ to $B$.
]

#definition[Equipotence][
  Two sets are #defname[equipotent] if they have the same cardinality.
]

$ card A $

== Axiom of choice

#axiom[Axiom of Choice][
  Given a infinite collection of disjoint finite sets, it is possible to select one element from each of the sets.

  Equivalently, if $A$ is a set of nomempty sets, there is always a function $f : A arrow union A$ such that $f(a) in a$ for all $a in A$.
]

The axiom of choice can create many odd paradoxes. However, there are important things that can only be proven by the axiom of choice.

There is a popular alternative, the axiom of determinancy, which also causes paradoxes. The axiom of choice and axiom of determinancy cannot both be true, but they could be both false.

#definition[Binary game][
  A binary game
]

#axiom[Axiom of Determinacy][
  Every binary game has a predetermined winner.
]

In this class we assume the axiom of choice.

== Countability

#definition[Countability][
  $S$ is countable iff there is an injection $f : S to ZZ^+$, or equivalently iff $card S <= card ZZ^+$.
]

#corollary[
  + Every subset of a countable set is countable.
    - The elements of a countable set can be indexed by the positive integers.
    - All finite sets are countable.
  + A countable union of countable sets is countable.
]

#theorem[
  If $A$ and $B$ are countable, so is $A times B$.

  However, a product of an infinite number of countable sets is not countable.
]

#theorem[
  $ card(RR) = card(cal(P)(ZZ^+)) $
]

== Well-ordering

#definition[Well-ordered set][
  A #defname[well-ordered set] is a totally-ordered set in which every nonempty subset has a least element.
]

#definition[Initial segment][
  Given poset $A$, with $a in A$, the #defname[initial segment] of $a$ is the set ${ a' in A : a' < a }$.
]
