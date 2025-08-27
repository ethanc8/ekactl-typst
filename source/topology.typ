#import "@local/ethan-standard-style:0.1.0": *
#show: ekactl-style.with(
  section-number: 3,
  title: "Topology"
)

= Sets, relations, functions, and order

== Set notation

A set is defined by selecting elements from another set such that $S(x)$ is true:

$ {x in A : S(x)} "or" {x in A | S(x) } $

$emptyset$ denotes the empty set.

$P implies Q$ means $P$ implies $Q$ (if $P$, then $Q$).

$P iff Q$ means $P$ and $Q$ are equivalent ($P$ iff $Q$).

$A subset B$ means $A$ is a subset of $B$ (*$A = B$ is allowed*).

$A subset.neq B$ means $A$ is a strict/proper subset of $B$.

$A = B$ means $A subset B$ and $B supset A$.

$A union B$ means the union of $A$ and $B$.

$A inter B$ means the intersection of $A$ and $B$.

$A parallel B$ means $A inter B = emptyset$.

$A setminus B = {x in A : x in.not B}$, everything in $A$ that's not in $B$.

$A times B = {(a, b) : a in A, b in B}$ is called the #defname[Cartesian product] of $A$ and $B$.

== Relations

#definition[Relation][
  A #defname[relation] $R : A to B$ is any subset of $A times B$.

  $a R b$ means $(a, b) in R$.
]

#theorem[Relations can compose][
  If $R : A to B$ and $S : B to C$, then $S compose R : A to C$ is a subset of $A times C$.
]

#warning-box[$R compose R^(-1)$ is not necessarily the identity map!]

#theorem[
  $ (S compose R)^(-1) &= R^(-1) compose S^(-1) \
  (T compose S) compose R &= T compose (S compose R) $
]

#definition[
  $R$ is #defname[reflexive] iff $a R a$ for all $a in A$.

  $R$ is #defname[symmetric] iff $a R b iff b R a$.

  $R$ is #defname[transitive] iff $a R b, b R c implies a R c$.
]

== Equivalence relations

#definition[Equivalence relation][
  A relation that is reflexive, symmetric, and transitive.
]

#definition[Equivalence class][
  Let $R : A to B$ be an equivalence relation. Then the #defname[equivalence class] of $a in A$ is
  $ [a] = [a]_R := {b in A : a R b} $
]

#lemma[
  Two equivalence classes are either identical or disjoint.
]

#definition[Partition][
  A collection of disjoint nomempty subsets of $A$ whose union is all of $A$.
]

#theorem[
  Given an equivalence relation on nonempty $A$, its set of equivalence classes forms a partition of $A$.

  Given a partition $P$ of $A$, there is a unique equivalence relation whose set of equivalence classes forms $P$.
]

== Functions (maps)



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
