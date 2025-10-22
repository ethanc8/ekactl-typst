#import "@local/ethan-standard-style:0.1.0": *
#show: ekactl-style.with(
  section-number: 3,
  title: "Topology"
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

= Sets, relations, functions, and order

== Logic

#theorem(title: [De Morgan's Laws for statements])[
  AND and OR interchange under complementation.

  In C notation:
  ```c
  !(A || B) == (!A) && (!B)
  !(A && B) == (!A) || (!B)
  ```

  In mathematical logical notation:
  $ not(A or B) &= (not A) and (not B) \
    not(A and B) &= (not A) or (not B) $
]

#theorem(title: [De Morgan's Laws for set theory])[
  Union and intersection interchange under complementation.

  $ (A union B)^c = A^c inter B^c \
    (A inter B)^c = A^c union B^c $
]

#theorem[
  Given the true statement $P ==> Q$,

  - $not P ==> not Q$ is the #defname[inverse], which might be true or false.
  - $Q ==> P$ is the #defname[converse], which is true iff the inverse is true.
  - $not(P ==> Q)$ is the #defname[negation], which is always false.
  - $not Q ==> not P$ is the #defname[contrapositive], which is always true.
]

== Sets

#see[01 Set Theory]

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

#definition(title: [Power set])[
  The set of all subsets of $A$, denoted $powerset(A)$.
]

== Relations

#see[02 Relations]

#definition(title: [Relation])[
  A #defname[relation] $R : A to B$ is any subset of $A times B$.

  $a R b$ means $(a, b) in R$.
]

#theorem(title: [Relations can compose])[
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

=== Equivalence relations

#definition(title: [Equivalence relation])[
  A relation that is reflexive, symmetric, and transitive.
]

#definition(title: [Equivalence class])[
  Let $R : A to B$ be an equivalence relation. Then the #defname[equivalence class] of $a in A$ is
  $ [a] = [a]_R := {b in A : a R b} $

  The set of all equivalence relations of $R$ in $A$ is called $A\/R$.
]

#lemma[
  Two equivalence classes are either identical or disjoint.
]

#definition(title: [Partition])[
  A collection of disjoint nonempty subsets of $A$ whose union is all of $A$.
]

#theorem[
  Given an equivalence relation on nonempty $A$, its set of equivalence classes forms a partition of $A$.

  Given a partition $P$ of $A$, there is a unique equivalence relation whose set of equivalence classes forms $P$.
]

=== Functions (maps)

#see[03 Functions]

#definition(title: [Function])[
  A #defname[function] (also called a #defname[map] or #defname[mapping]) is a relation $f : A to B$ where each $a in A$ appears as the first element (input) of an ordered pair $(a, b) = a f b$ exactly once.

  If $(a, b) in f$, we can also say $f(a) = b$. $b$ is the #defname[value] of $f$ at $a$, or the #defname[image] of $a$ under $f$.

  $A$ is the #defname[domain] and $B$ the #defname[codomain] of $f$.
]

#definition(title: [Injective])[
  A function $f$ is #defname[injective] or #defname[one-to-one] iff:
  - $f(a) = f(b) => a = b$, or equivalently
  - $a != b => f(a) != f(b)$
]

#definition(title: [Surjective])[
  A function $f : A to B$ is #defname[surjective] or #defname[onto] iff:
  - $f(A) = B$ (its image is its codomain), or equivalently
  - for every $b in B$ there exists $a in A$ s.t. $f(a) = b$
]

#definition(title: [Bijective])[
  A function is #defname[bijective] and has #defname[one-to-one correspondence] if it is both injective and surjective.
]

#theorem[
  A composition of two functions is a function. If both are sur/in/bijective, so is their composition.
]

#definition[
  The set of all functions $A to B$ is denoted $B^A$.
]

#lemma[
  If $A$ and $B$ are finite, then the size of $B^A$ is $|B|^(|A|)$, the size of $B$ to the size of $A$.
]

#theorem[
  For any set $A$, there is a bijection between $powerset(A)$ and $2^A$.
]

#definition(title: [Induced map])[
  The #defname[induced map] of the relation $f : A to B$ is a function $indmap(f) : powerset(A) to powerset(B)$ defined as
  $ indmap(f)(X) := {b in B : b = f(a) "for some" x in A} $

  $indmap(f)(X)$ is called the #defname[image] of $X$. This is sometimes denoted $f(X)$ (which is an abuse of notation).

  $indmap(f)$ is always a function regardless of if $f$ is a function.
]

== Ordering

=== Partial and total ordering

#see[04 Ordering]

#definition(title: [Partial order])[
  A #defname[partial order] $<=$ on a set $A$ is a relation that is
  - *reflexive*: $a <= a$ for all $a in A$
  - *transitive*: $a <= b "and" b <= c implies a <= c$
  - *antisymmetric*: $a <= b "and" b <= a implies a = b$

  Given a partial order $<=$, we define the partial order $>=$ so that $a >= b <==> b <= a$.
]

#definition(title: [Total order])[
  A #defname[total order] $<=$ on a set $A$ is a partial order where for all $a, b in A$, $a <= b$, $a >= b$, or both.
]

#definition(title: [Strict order])[
  A #defname[strict order] $<$ determined by a partial order $<=$ is defined s.t. $a < b$ iff $a <= b$ and $a != b$.
]

#definition(title: [Partially ordered and totally ordered set])[
  A #defname[partially ordered set] or #defname[poset] is a pair of a set and a partial order for that set. 

  A #defname[totally ordered set] is a pair of a set and a total order for that set.

  By abuse of notation we also say that the set itself is partially/totally ordered.
]

#definition(title: [Upper and lower bounds])[
  Given a poset $A$ and subset $S subset A$:

  An #defname[upper bound] for $S$ is an element $a in A$ s.t. $s <= a$ for all $s in S$.

  A #defname[lower bound] for $S$ is an element $a in A$ s.t. $a <= s$ for all $s in S$.

  The #defname[supremum] of $S$, $sup S$, is the upper bound such that for any other upper bound $u$ of $S$, $sup S <= u$.

  The #defname[infimum] of $S$, $sup S$, is the lower bound such that for any other lower bound $l$ of $S$, $l <= inf S$.

  A set does not have to have a supremum or infimum, but if it does it is unique.
]

=== Lattices

#see[04 Ordering.2]

#definition(title: [Lattice])[
  A #defname[lattice] is a poset in which every two-element subset has both a supremum and infimum.

  A #defname[complete lattice] is a poset in which every (including infinite) subset has both a supremum and infimum.
]

#theorem[
  The power set of any set, ordered by inclusion, is a complete lattice.
]

=== Order-preserving

#definition(title: [Order-preserving map])[
  A function $f : A to B$ between posets is #defname[order-preserving] iff whenever $a_1 <= a_2 ==> f(a_1) <= f(a_2)$.
]

#theorem[
  Every order-preserving map of a complete lattice to itself must have a fixed point (an element of the domain for which $f(a) = a$).
]

#corollary[
  Let $f : A to B$ and $g : B to A$. Then, $A$ and $B$ can be split such that:
  - $A$ is split into $A_1$ and $A_2$ such that $A_1 union A_2 = A$ and $A_1 inter A_2 = emptyset$
  - $B$ is split $A_1$ and $A_2$ such that $A_1 union A_2 = A$ and $A_1 inter A_2 = emptyset$
  - $indmap(f)(A_1) = B_1$ and $indmap(g)(B_2) = A_2$
]

#definition(title: [Order isomorphism])[
  An order-preserving bijection.
]

=== Well-ordering

#definition(title: [Well-ordered set])[
  A #defname[well-ordered set] is a totally-ordered set in which every nonempty subset has a least element.

  Equivalently, a set where every element has a "next element" greater than it.
]

#definition(title: [Initial segment])[
  Given poset $A$, with $a in A$, the #defname[initial segment] of $a$ is the set ${ a' in A : a' < a }$.
]

#lemma[
  Let $f$ be an order-preserving injection of a well-ordered set into itself. Then $a <= f(a)$ for all $a in A$.

  A well-ordered set is not order isomorphic to any of its initial segments.
]

#theorem[
  Let $A$ or $B$ be well-ordered sets. Then exactly one of the following is true:
  1. $A$ is order isomorphic to $B$.
  2. $A$ is order isomorphic to an initial segment of $B$. 
  3. $B$ is order isomorphic to an initial segment of $A$.
]

#definition(title: [Least uncountable ordinal])[
  By the Well-Ordering Theorem, $Reals$ has some well-ordering $Reals_"wo"$. Let 
  $ T := {a in Reals_"wo" : a' "is an uncountable initial segment of" Reals_"wo"} $
  
  and define $Omega := min T$, the #defname[least uncountable ordinal].

  The #defname[least uncountable well-ordered set] is the intial segment of $Omega$, which satisfies the property that if $a < Omega$, then the initial segment of $a$ is countable.
]

== Cardinality

Assume that there is some "overset" containing all of the sets we consider.

#definition(title: [Cardinality])[
  $card(A)$ is the equivalence class of $A$ under bijection

  Equivalently, $card(A) = card(B)$ iff there is a bijection $A to B$.

  Two sets are #defname[equipotent] if they have the same cardinality.
]

#definition[
  $ card A <= card B$ iff there is an injection from $A$ to $B$.
]

#theorem(title: [Schroeder-Bernstein Theorem])[
  $ card(A) <= card B "AND" card(B) <= card(A) \
  ==> card(A) = card(B) $
]

#theorem(title: [Cantor's Theorem])[
  For any set $A$,
  $ card(A) < card(powerset(A)) $
]

== Countability

#definition(title: [Countability])[
  $S$ is countable iff there is an injection $f : S to ZZ^+$, or equivalently iff $card S <= card ZZ^+$.
]

#corollary[
  + Every subset of a countable set is countable.
    - The elements of a countable set can be indexed by the positive integers.
    - All finite sets are countable.
  + A countable union of countable sets is countable.
]

#theorem[
  The product of a finite number of countable sets is countable.

  However, a product of an infinite number of countable sets is not countable.
]

#theorem[
  $ card(RR) = card(cal(P)(ZZ^+)) $

  Thus, the reals are not countable.
]

== Axiom of choice

#axiom(title: [Axiom of Choice])[
  Given a infinite collection of disjoint finite sets, it is possible to select one element from each of the sets.

  Equivalently, if $A$ is a set of nomempty sets, there is always a function $f : A arrow union A$ such that $f(a) in a$ for all $a in A$.
]

In this class, we assume the Axiom of Choice.

#theorem(title: [Zermelo's Theorem])[
  The following theorems are equivalent:
  - the Axiom of Choice
  - the Well-Ordering Property
  - the Hausdorff Maximum Principle
  - Zorn's Lemma
]

#theorem(title: [Well-Ordering Property (Zermelo's Postulate)])[
  Every set can be well-ordered.
]

#theorem(title: [Hausdorff Maximum Principle])[
  Every poset has a "maximal" totally ordered subset, i.e. a totally ordered subset that cannot be extended without escaping the poset.
]

#theorem(title: [Zorn's Lemma])[
  If $A$ is a poset in which every totally ordered subset has an upper bound, then $A$ has a maximal element, i.e. there is no larger element in the poset.
]

= Topologies

== Metric spaces

#see[06 Metric Spaces]

#definition(title: [Metric])[
  Given a set $M$, a #defname[metric] $d : M times M to Reals$ on $M$ is a positive definite symmetric function satisfying the triangle inequality, i.e. it satisfies:
  - *Positivity*: $d(x, y) >= 0$ for all $x, y in M$
  - *Definiteness*: $d(x, y) = 0$ iff $x = y$
  - *Symmetry*: $d(x, y) = d(y, x)$
  - *Triangle Inequality*; $d(x, y) + d(y, z) >= d(x, z)$ for all $x, y, z in M$

  Such a function satisfies everything we expect from a distance.

  A #defname[pseudometric] satisfies all the above properties except definiteness.

  A set equipped with a (pseudo)metric is a #defname[(pseudo)metric space].
]

#theorem(title: [Metric characterization of continuity])[
  $f : M to N$ is continuous at $x in M$ iff for any $epsilon > 0$, there exists $delta > 0$ s.t. $d(x, y) < delta ==> d(f(x), f(y)) < epsilon$.
] <thm:continuity-metric>

=== Epsilon neighborhoods

#definition(title: [Epsilon neighborhood])[
  Let $N$ be a metric space.
  
  An #defname[epsilon neighborhood] of a set $A subset N$ is the set
  $ U(A, epsilon) := {y in N : (exists x in A : d(x, y) < epsilon)} $

  Equivalently, the set of all points within distance $epsilon$ of some point in $A$.

  An #defname[epsilon] or #defname[open neighborhood], #defname[disk], or #defname[ball] of radius $epsilon$ around a point $x$ is defined as the set of all points within distance $epsilon$ of $x$:

  $ U(x, epsilon) := {y in N : d(x, y) < epsilon} = U({x}, epsilon) $
]

#theorem(title: [Epsilon neighborhood definition of continuity])[
  $f : M to N$ is continuous at $x in M$ iff for every open set $V subset N$ that contains $f(x)$, there is an open set $U subset M$ containing $x$ s.t. $f(U) subset V$.
] <thm:continuity-epsilon-nbhd>

=== Subspaces

#definition(title: [Subspace of a metric space])[
  If $A subset M$ where $d$ is a metric on $M$, then $d|_A := d$ restricted to $A$ is a metric on $A$.

  $A$ with this metric is a #defname[subspace] of $M$.
]

=== Common metrics

#definition(title: [Standard metric on $Reals^n$])[
  This is the typical distance on $Reals^n$.

  $ mu_2 (x, y) := sqrt(sum_(i=1)^n (x_i - y_i)^2) $
]

#definition(title: [Taxicab metric on $Reals^n$])[
  Also called the #defname[Manhattan distance]. It's the distance if you can only travel parallel to one of the axes.

  $ mu_1 (x, y) := sum_(i=1)^n |x_i - y_i| $
]

#definition(title: [Chebyshev metric on $Reals^n$])[
  The greatest single difference between any pair of corresponding coordinates of the two points:

  $ mu_infinity (x, y) := max |x_i - y_i| $
]

#definition(title: [Paris metro metric])[
  The distance if you can only travel to and from the origin, and all other travel must go through the origin.

  $ mu_"pm" (x, y) := d(x, 0) + d(0, y) $
]

#definition(title: [Discrete metric])[
  The distance between any two distinct points is 1.

  $ mu_0 (x, y) := cases(
    1 "for" x != y,
    0 "for" x = y
  ) $
]

#definition(title: [Indiscrete pseudometric])[
  The distance between everything is 0:

  $ mu_"triv" (x, y) := 0 $
  
  Also called the #defname[trivial pseudometric].
]

== Topologies

#see[07 Topologies]

#definition(title: [Topology])[
  A #defname[topology] $calT$ on the set $X$ is a collection of subsets of $X$, called the #defname[open sets], such that
  1. $calT$ is closed under arbitrary unions.
  2. $calT$ is closed under finite intersections.

  A set together with a topology on it is called a #defname[topological space].
]

#definition(title: [Closed set])[
  The complement of an open set.
]

#lemma[
  The empty set and whole space are always both closed and open.
]

#definition(title: [Metrizable topology])[
  A topology that is the set of open sets given by some metric.
]

#definition(title: [Finer, coarser topologies])[
  A topology is #defname[coarser] (also called #defname[smaller] or #defname[weaker]) than another topology iff it is a subset of the other.

  A topology is #defname[finer] (also called #defname[larger] or #defname[stronger]) iff it is a superset of the other.
]

#lemma[
  The set of all topologies on a specific set is a lattice.
]

== Closure, interior, boundary

#see[07 Topologies.2]

#definition(title: [Closure])[
  Given $A subset X$ where $X$ is a topological space, the #defname[closure] of $A$, denoted $cl(A)$ or $"cl" A$, is the intersection of all closed subsets containing $A$.
] <def:closure>

#theorem(title: [Kuratowski closure axioms])[
  The closure operation satisfies
  1. $A subset cl(A)$
  2. $cl(cl(A)) = cl(A)$
  3. $cl(A union B) = cl(A) union cl(B)$
  4. $cl(emptyset) = emptyset$
]

#definition(title: [Interior])[
  Given $A subset X$ where $X$ is a topological space, the #defname[interior] of $A$, $A ior$, is the union of all open sets contained in $A$.
]

#definition(title: [Boundary])[
  Given $A subset X$ where $X$ is a topological space, the #defname[boundary] or #defname[frontier] of $A$, denoted $bound A$ or $"bd" A$, is 
  $ bound A := cl(A) - A ior $

  Some authors use the word "boundary" to mean only the part of the frontier contained in $A$.
]

#definition(title: [Exterior])[
  Given $A subset X$ where $X$ is a topological space, the #defname[exterior] is the complement of the closure of $A$:
  $ X - cl(A) = cl(A)^c $
]

#theorem[
  Given $A subset X$ where $X$ is a topological space, $X$ is partitioned into three disjoint parts:
  $ X = A ior dun bound A dun X - cl(A) $
]

=== Bases

#see[08 Neighborhoods and Bases.3]

#definition(title: [Base])[
  Let $calT$ be a topology on $X$. A #defname[base] for $calT$ is a collection of open sets such that any other open set can be made out of unions of the elements of the base.
]

#definition(title: [Second countable])[
  A space is #defname[second countable] iff it has a countable base.
] <def:2-cble>

#lemma[
  All second countable spaces are first countable.
]

#example[
  Let $calT$ be a countable discrete space. Then the base is at least all the singletons, which is uncountably many. Thus, $calT$ is not second countable.
]

#definition(title: [Sub-base])[
  A collection of sets such that finite intersections of the sets in the sub-base form a base.
]

#definition(title: [Topology generated by a sub-base])[
  The topology generated by a sub-base $B$ is defined such that a set is open iff:
  - it is a member of $B$, or
  - it is a finite intersection of members of $B$, or
  - it is an arbitrary union of those intersections
]

#theorem(title: [Topology generated by a base])[
  The topology generated by a base $B$ such that a set is open iff it is an arbitrary union of members of $B$.
]

#example[
  The set of infinite intervals with one open side is a sub-base of $Reals$ in the standard topology.
]

== Neighborhoods

#see[08 Neighborhoods and Bases]

#definition(title: [Neighborhood])[
  Given $A subset X$ (where $X$ is a topological space), $N$ is a #defname[neighborhood] of $A$ iff $N$ contains an open set containing $A$.

  Given $x in X$, $N$ is a neighborhood of $x$ iff $N$ is a neighborhood of ${x}$, i.e. it contains an open set containing $x$.

  $nbhds(x)$ denotes the set of all neighborhoods of $x$, which is called the #defname[neighborhood system] or #defname[filter] for $x$.

  Most of the things we can prove about neighborhoods we can also prove about open neighborhoods, so some authors define neighborhoods to always be open.
]


#lemma[
  $U subset X$ is open iff for each $x in U$ there is a neighborhood $N_x$ of $x$ contained in $U$.
]

#axiom(title: [Hausdorff neighborhood axioms])[
  Let $x in X$. Then,

  1. $x$ is in every one of its neighborhoods:
  $ N in nbhds(x) ==> x in N $
  2. $nbhds(x)$ is closed under supersets:
  $ N in nbhds(x), N subset M ==> M subset nbhds(x) $
  3. $nbhds(x)$ is closed under finite intersection.
  4. For each neighborhood $N$ of $x$, it contains a neighborhood $N'$ such that for each item $y$ in $N'$, $N$ is a neighborhood of $y$:
  $ & N in nbhds(x) ==> (exists N' in nbhds(x) : \
  & #h(10pt) N' subset N "and" y in N' ==> N subset nbhds(y)) $

  Conversely, if each $x in X$ has a collection of neighborhoods $nbhds'(x)$ satisfying the above axioms, than there is a unique topology on $X$ for which $nbhds'(x) = nbhds(x)$ for all $x in X$. 
]

#theorem(title: [Neighborhood characterization of closure])[
  Let $x in X$, $A subset X$. Then $x in overline(A)$ iff every neighborhood of $x$ meets $A$.
] <thm:closure-nbhd>

#theorem(title: [Neighborhood characterization of boundary])[
  $bound A$ is the set of all points $x in X$ s.t. every neighborhood of $x$ meets both $A$ and $X - A$.
]

=== Neighborhood bases

#definition(title: [Neighborhood base])[
  Let $x in X$. A #defname[neighborhood base] of $x$ is a set $cal(B)(x) subset nbhds(x)$ such that for any $N in nbhds(x)$ there is a $B in B(x)$ such that $B subset N$.

  Equivalently, it is a set of #defname[basic neighborhoods] around a $x$ s.t. each neighborhood of $x$ contains a basic neighborhood.

  Equivalently, it is a filter base of the neighborhood filter $nbhds$.
]

#definition(title: [First countable])[
  A space is #defname[first countable] iff if each point has a countable neighborhood base.
] <def:1-cble>

#example[
  Let $overline(Omega)$ be the minimal uncountable well-ordered set with its endpoint $omega_0$. $calB(omega_0)$ is not countable, so $overline(Omega)$ is not first countable.
]

#example[
  Every metrizable space is first countable.
]

#axiom(title: [Neighborhood axioms])[
  Let $cal(B)(x)$ be a neighborhood base at $x$. Then
  1. There exist basic neighborhoods of $x$.
  2. $x$ is contained in each of its basic neighborhoods:
  $ U in calB(x) ==> x in U $
  3. $calB(x)$ is closed under finite intersection:
  $ U_1, U_2 in calB(x) ==> (exists V in calB(x) : V subset U_1 inter U_2) $
  4. For each basic neighborhood $U$ of $x$, it contains a basic neighborhood $V$ such that for each item $y$ in $V$, $V$ contains a basic neighborhood $W$ of $y$:
  $ & U in calB(x) ==> (exists V in calB(x) : \
  & #h(10pt) V subset U "and" (y in V ==> exists W in calB(y) : W subset V)) $

  Conversely, given a set $calB(x)$ for each $x in X$ satisfying the above axioms, there is a unique topology $calT$ on $X$ s.t. for all $x in X$, $calB(x)$ is a neighborhood base of $x$ in the topology $calT$. $calT$ is defined by:

  $ calT := {U subset X : x in U ==> (exists V in calB(x) in.rev V subset U)} $


]

=== Accumulation points

#definition(title: [Accumulation point])[
  $x$ is an #defname[accumulation point] of $A$ iff every neighborhood of $x$ contains a point of $A$ other than $x$.
]

#definition(title: [Derived set])[
  The set of accumulation points of $A$ is called the #defname[derived set], denoted $A'$.
]

#corollary(title: [Accumulation point characterization of closure])[
  $overline(A) = A union A'$.
] <cor:closure-accpt>

== Continuity

#see[09 Continuous Functions]

#definition(title: [Continuous function])[
  $f : X to Y$ is a continuous function at $x_0 in X$ iff $f^(-1)(N)$ is a neighborhood of $x_0$ for every neighborhood $N$ of $f(x_0)$.

  Equivalently, it is continuous iff every neighborhood of $f(x)$ pulls back (by $f^(-1)$) to a neighborhood of $x$.

  $f$ is continuous if it is continuous at all $x_0 in X$. 
] <def:continuity>

#definition(title: [Homeomorphism])[
  $f$ is a homeomorphism iff $f$ is a continuous bijection whose inverse is also continuous.

  Homeomorphisms are equivalence relations between topological spaces.
]

#theorem(title: [Continuity composes])[
  If $f : X to Y$ is continuous at $x_0$ and $g : Y to Z$ is continuous at $f(x_0)$, then $g compose f : X to Z$ is continuous at $x_0$.
]

#theorem()[
  Given $f : X to Y$, the following are equivalent.

  1. $f$ is continuous.
  2. $f(overline(A)) subset overline(f(A))$ for all $A subset X$.
  3. If $B subset Y$ is closed, then $f^(-1)(B)$ is closed in $X$.
  4. If $B subset Y$ is open, then $f^(-1)(B)$ is open in $X$.
]

// #proof[
//   $2 => 3$: Let $B$ be closed in $Y$. $f(overline(f^(-1)(B))) subset overline(f(f^(-1)(B))) = overline(B) = B$. 

//   Then, since inverses preserve subsets, $cl(f^(-1)(B)) = f^(-1)(f(cl(f^(-1)(B)))) subset f^(-1)(B)$, so $f^(-1)(B)$ is closed.

//   $3 => 4$: Let $B$ be open in $Y$. Then $X \/ f^(-1)(B) = f^(-1)(Y \/ B)$. Then ??? is open.

//   By the axioms of neighborhood bases, $U in calB(x) => (exists V in calB(x) : V subset U "and" (y in V => exists W in calB(y) : W subset U))$. 
// ]

#lemma[
  $f : X to Y$ is continuous iff $f^(-1)(c)$ is open for each $c$ in some subbase of $Y$.
]

#lemma[
  Any function from any discrete space to any other space is continuous.

  Any function from any space to any indiscrete space is continuous.
]

== Initial (induced) topology

#see[10 Induced Topologies]

=== Subspace topology

#definition(title: [Subspace topology])[
  Given $A subset X$, where $X$ is a topological space, the #defname[subspace topology] (#defname[relative topology]) on $A$ is defined such that $B subset A$ is open in $A$ iff $B = A inter O$ for some open set $O$ in $X$.

  The subspace topology is the initial topology induced by the inclusion map $i_A : A to X$ defined by $i_A (x) := x$.

  $A$ equipped with the subspace topology is called a #defname[subspace] of $X$.
]

#example[
  $Rationals ior$ under the standard topology on $Reals$ is empty, since there are no open intervals in $Rationals$.

  However, $Rationals ior$ under the subspace topology on $Rationals$ is the entire space, since all spaces are open.
]

#lemma[
  The following properties are preserved by taking subspaces:
  - discrete
  - indiscrete
  - metrizable
  - subspace of some space
]

=== Initial (induced) topology

#definition(title: [Initial topology])[
  For each $alpha$ in some index set $cal(A)$, let $A_alpha$ be a topological space and $f_alpha$ be a function $X to A_alpha$. Then, the initial topology #defname[induced] on $X$ by the set of $f_alpha$ is the coarsest topology in $X$ for which each $f_alpha$ is continuous.

  Equivalently, it is the intersection of all of the topologies for which each $f_alpha$ is continuous.

  Also called: #defname[initial topology], #defname[strong topology], #defname[limit topology], #defname[projective topology]

  Equivalently, given a bunch of sets $A_alpha$ and functions $f_alpha : X to A_alpha$, pull the open sets in each $A_alpha$ back to $X$ (by $f_alpha$), and define these pullbacks to be open on $X$. This is a sub-base; generate a topology from this sub-base by defining the finite intersections and arbitrary to be open.. This forms a topology on $X$, which is called the #defname[initial topology].
]

#lemma[
  The initial topology on $X$ induced by ${f_alpha}$ is the topology generated by the following sub-base: the collection of all $f_alpha^(-1)(U)$ for all open sets $U subset X_alpha$.
]

#theorem(title: [Universal property of the initial topology])[
  The initial topology induced by ${f_alpha}$ is the unique topology where if $Y$ is any topological space, then $g : Y to X$ is continuous iff each $g compose f_alpha : Y to A_alpha$ is continuous:

  #cetz.canvas({
    import cetz.draw: *

    // ---- nodes (objects)
    set-style(content: (padding: .1))
    content((0, 2), $(Y, cal(T))$,            name: "Y")
    content((0, 0), $(X, cal(T)_"initial")$, name: "X")
    content((4, 0), $(X_alpha, cal(T)_alpha)$, name: "Xa")

    // ---- arrows
    // vertical: g
    line("Y.south", "X.north", mark: (end: "straight"), name: "v")
    content("v.mid", $g$, anchor: "west", padding: (left: .2))

    // horizontal: f_\alpha
    line("X.east", "Xa.west", mark: (end: "straight"), name: "h")
    content("h.mid", $f_alpha$, anchor: "south")

    // diagonal: f_\alpha \circ g
    line("Y.east", "Xa.north-west", mark: (end: "straight"), name: "d")
    content("d.mid", $f_alpha compose g$, anchor: "south-west")
  })

]

#definition(title: [Open and closed functions])[
  Let $X$ and $Y$ be topological spaces. $f : X to Y$ is #defname[open] iff $f(U)$ is open for all $U$ open on $X$.

  $f : X to Y$ is #defname[closed] iff $f(C)$ is closed for all $C$ closed on $X$.

  (These are not opposite.)
]

=== Product topology

#see([Munkres 2§19 (p.113)])

#definition(title: [Projection])[
  Let ${X_alpha}$ be a collection of sets, and $X = product_(alpha in A) X_alpha$. Then for each $alpha in A$, the #defname[projection map] $pi_alpha : X to X_alpha$ maps each tuple in $A$ to its $alpha$th element.
]

#definition(title: [Product topology])[
  Let ${X_alpha}$ be a set of topological spaces, and $X = product_(alpha in A) X_alpha$. The topology on $X$ induced by the collection of projections ${pi_alpha : alpha in A}$ is called the #defname[product topology].

  Equivalently, given a product space $X$, pull the open sets in each $X_alpha$ back to $X$ (using the projection maps $pi_alpha$), and define these pullbacks to be open on $X$. This is a sub-base; generate a topology from this sub-base by defining the finite intersections and arbitrary unions to be open. This forms a topology on $X$, which is called the #defname[product topology].
]

#lemma(title: [Product topology constrains finitely many axes])[
  The collection of sets which are products of open sets in each of the $X_alpha$, where all but a finite number are the entire set $X_alpha$, form a base for the product topology.

  Thus, only a finite number of axes can be constrained when creating an open set in the product topology.

  This is because the pullbacks of open sets in one of the $X_alpha$ only constrain a single axis, and we can only take finite intersections of them.
]

#theorem[
  If $cal(A)' subset cal(A)$, then $pi : product_(a in cal(A)) X_alpha to product_(a in cal(A)') X_alpha$ is continuous and open.
]

=== Box topology

#definition(title: [Box topology])[
  Let ${X_alpha}$ be a set of topological spaces, and $X = product_(alpha in A) X_alpha$. The #defname[box topology] on $X$ is generated by the base
  $ { product_(alpha in A) U_alpha : U_alpha "open in" X_alpha } $
]

== Covers and defining families

#see[10 Induced Topologies.3]

#definition(title: [Defining family])[
  A #defname[defining family] for topological space $X$ is a collection $calC$ s.t. $U subset X$ is open in $X$ iff its intersection with each $C in calC$ is open in the subspace topology on $C$.
]

#definition(title: [Open cover])[
  An #defname[open cover] of $X$ is a collection of open sets whose union contains all of $X$.

  All open covers are defining families.
]

#definition(title: [Locally finite])[
  A collection of subsets of a topological space is #defname[locally finite] if each point has a neighborhood that meets only finitely many sets in the collection.
]

#definition(title: [Closed cover])[
  An #defname[open cover] of $X$ is a collection of closed sets whose union contains all of $X$.

  Locally finite closed covers are defining families.
]

#theorem[
  Let $calC$ be a defining family for $X$. Then $f : X to Y$ is continuous iff its restriction to each $C in calC$ is continuous.
]

== Final (coinduced) topologies

#definition(title: [Final (coinduced) topology])[
  For each $alpha$ in some index set $cal(A)$, let $A_alpha$ be a topological space and $g_alpha$ be a function $A_alpha to Y$. Then, the final topology #defname[coinduced] on $Y$ by the set of $g_alpha$ is the finest topology in $Y$ for which each $g_alpha$ is continuous.

  Equivalently, it is the union of all of the topologies for which each $g_alpha$ is continuous.

  Also called: #defname[final topology], #defname[weak topology], #defname[colimit topology], #defname[inductive topology]

  Equivalently, a set $U$ is open in the final topology iff its preimage $g_alpha^(-1) (U)$ is open in the topology on $A_alpha$ for every $alpha$.
]

#theorem(title: [Universal property of the final topology])[
  The final topology induced by ${g_alpha}$ is the unique topology where $f : Y to Z$ is continuous iff $f compose g_alpha : X_alpha to Z$ is continuous for every $alpha$.

  #cetz.canvas({
    import cetz.draw: *

    // ---- nodes (objects)
    set-style(content: (padding: .1))
    content((0, 2), $(Z, cal(T))$,            name: "Y")
    content((0, 0), $(X, cal(T)_"final")$, name: "X")
    content((4, 0), $(X_alpha, cal(T)_alpha)$, name: "Xa")

    // ---- arrows
    // vertical: g
    line("X.north", "Y.south", mark: (end: "straight"), name: "v")
    content("v.mid", $f$, anchor: "west", padding: (left: .2))

    // horizontal: f_\alpha
    line("Xa.west", "X.east", mark: (end: "straight"), name: "h")
    content("h.mid", $g_alpha$, anchor: "south")

    // diagonal: f_\alpha \circ g
    line("Xa.north-west", "Y.east", mark: (end: "straight"), name: "d")
    content("d.mid", $f compose g_alpha$, anchor: "south-west")
  })
]

=== Quotient topology

#definition(title: [Quotient topology])[
  Given topological space $X$ and surjection $g : X to Y$, the final topology coinduced by $g$ is the #defname[quotient topology].

  Then, $Y$ is the #defname[quotient space] of $X$ by $g$, and is considered one of the #defname[identification spaces] of $X$.
]

#definition(title: [$X\/~$])[
  Let $X$ be a space and $~$ be an equivalence relation, with $Y$ being its set of equivalence classes. The space #defname[$X\/~$] is defined to be the quotient topology of $X$ coinduced by $g : X to Y$ defined as
  $ g(x) = [x]_~ #[(the equivalence class of $x$)] $
]

=== Topological sum


#definition(title: [Topological sum])[
  Let ${Y_alpha}$ be a collection of disjoint sets. Then, $X = dun.big Y_alpha$ is the #defname[topological sum] of the $Y_alpha$, denoted $plus.circle.big Y_alpha$.

  The topology on $plus.circle.big Y_alpha$ is such that a set is open iff it is open in one of the $Y_alpha$, or it is a union of open sets in different $Y_alpha$.

  Such a space is obviously disconnected.

  This topology is equivalent to the final topology coinduced by the inclusion maps $i_alpha : Y_alpha to dun.big Y_alpha$.
]

#theorem(title: [Scissors and Paste Theorem])[
  Let $calC$ be a defining family for topological space $X$ that covers $X$. Let $Y$ be the topological sum of all the $C in calC$. Define $f : Y to X$ as the identity map $f(y) = y$. Then $X$ is the quotient space of $Y$ by $f$.
]

// TODO

= Limits

== Sequences

#definition(title: [Sequence])[
  A function $x : Naturals to X$, where $X$ is a topological space. This is denoted ${x_n}_(n = 1)^(infinity)$, where $x_n = x(n) in X$.
]

#definition(title: [Convergence of a sequence])[
  $x_n$ converges to $x_0$ ($x_n to x_0$) iff for every neighborhood $U$ around $x_0$, there exists $N_U$ s.t. $n > N_U$ implies $x_n in U$. Equivalently, every neighborhood $x_0$ contains all but finitely many of the $x_n$.
]

#lemma[
  In a metric space, $x_n to x_0$ iff
  $ lim_(n to infinity) d(x_n, x_0) = 0 $
]

#lemma[
  In the product space $X = product X_alpha$, $x_n to x_0$ in $X$ iff $pi_alpha (x_n) to pi_alpha (x_0)$ for every $alpha$.
]

#theorem[
  In a first countable space, $x in cl(A)$ iff there is a sequence of points in $A$ that converge to $x$.
]

#theorem[
  If $f : X to Y$ is continuous at $x_0$ and ${x_n} to x_0$, then $f(x_n) to f(x_0)$.

  Conversely, if $x_0$ has a countable neighborhood base and each sequence ${x_n} to x_0$, $f(x_n) to f(x_0)$, then $f_0$ is continuous at $x_0$.
]

== Nets

#definition(title: [Directed upward])[
  A poset in which any two elements have an upper bound. That is, given $alpha, beta in S$, there exists $gamma in S$ s.t. $a <= gamma$ and $beta <= gamma$
]

#definition(title: [Net])[
  A subset of a topological space which is directed upward by some $<=$ (which is not necessarily related to the space.)

  This is sometimes written using a directed-upward set $cal(A)$, where the net is denoted ${x_alpha}_(alpha in cal(A))$
]

#definition(title: [Convergence of a net])[
  $x_alpha to x_0$, where ${x_alpha}_(alpha in cal(A))$ is a net, iff for each neighborhood $N$ around $x_0$, there exists $gamma in cal(A)$ s.t. $x_alpha in N$ for all $alpha >= gamma$.
]

#lemma(title: [Net characterization of closure])[
  If $A$ is a subset of a topological space, $x_0 in cl(A)$ iff there exists a net in $A$ converging to $x_0$.
] <thm:closure-net>

#lemma(title: [Net characterization of continuity])[
  $f : X to Y$ is continuous at $x_0$ iff for each net $x_alpha to x_0$, $f(x_alpha) to f(x_0)$.
] <thm:continuity-net>

== Filters

#definition(title: [Filter base])[
  A #defname[filter base] $calF$ in the set $X$ is a nonempty collection of nonempty subsets of $X$ which is directed downward by inclusion.
]

#definition(title: [Filter])[
  A filter base $calF$ which is closed under supersets: $ forall A in calF #h(9pt) exists.not B in X : A subset.neq B $
]

#lemma[
  The collection of all sets in a filter base together with their supersets is a filter.
]

#definition(title: [Canonical filter])[
  The #defname[canonical filter generated by $A$] is the set of all supersets of $A$, if $A$ is nonempty.
]

#definition(title: [Fréchet filter])[
  The collection of subsets of the nonnegative integers whose complements are finite.
]

#lemma(title: [Images of filter bases are filter bases])[
  If $calF$ is a filter base on $X$, and $f : X to Y$, then
  $ f(calF) = {f(F) : F in calF} $
  is a filter base on $Y$.
]

#definition(title: [Elementary filter])[
  The image of the Fréchet filter.
]

#definition(title: [Convergence of a filter base])[
  $calF to x_0$ iff every neighborhood $N$ of $x_0$ contains some $F subset calF$.
]

#lemma(title: [Constructing filter base from net])[
  Given the nonempty net ${x_alpha}_(alpha in calA)$ in $X$, we can define
  $ X_alpha = {x_(alpha') : alpha' < alpha} $
  Then, ${X_alpha}$ is a filter base in $X$, and $x_alpha to x_0$ iff $X_alpha to x_0$.
]

#lemma(title: [Collection of neighborhoods is filter])[
  The collection of all neighborhoods of any nonempty set is a filter.
]

#lemma(title: [Filter characterization of continuity])[
  Let $f : X to Y$, and $x_0 in X$ where $N$ is the set of neighborhoods of $x_0$. Then, $f$ is continuous at $x_0$ iff $N to f(x_0)$.
] <thm:continuity-filter>

#lemma(title: [Filter base characterization of closure])[
  $x in cl(A)$ iff there is a filter base in $A$ converging to $x$.
] <thm:closure-filterbase>

#theorem[
  Given a filter base $calF$ in the product space $X = product X_alpha$, $calF to x_0$ iff each $pi_alpha(calF) to pi_alpha (x_0)$ in $X_alpha$.
]

=== Ultrafilters

#lemma[
  The set of all filter bases on a specific set is a poset under inclusion.

  The set of all filter bases containing a given filter base is a poset where every totally ordered subset has an upper bound.
]

#definition(title: [Ultrafilter])[
  The maximal filter base in a specific set; i.e. the filter base to which no more sets can be added while maintaining downward direction.

  The ultrafilter is a filter.
]

#theorem(title: [Test for ultrafilter])[
  A filter base $cal(F)$ is an ultrafilter iff for each $E subset X$ either $E in cal(F)$ or $X - E in cal(F)$.
]

#definition(title: [Cluster point])[
  A #defname[cluster point] of a filter base $calF$ is a point that is in $cl(F)$ for every $F in calF$.
]

#theorem[
  $x$ is a cluster point of $calF$ iff there exists an ultrafilter $calF'$ containing $calF$ that converges to $x$.
]

= Separation

== Separated

#definition(title: [Separated])[
  $A$ and $B$ in the space $X$ are #defname[separated by neighborhoods] iff 
  $ A inter cl(B) = cl(A) inter B = emptyset $
  or equivalently iff there exist neighborhoods of each that do not include the other.
]

#definition(title: [Separated by neighborhoods])[
  $A$ and $B$ in the space $X$ are #defname[separated by neighborhoods] iff there exist neighborhoods $U$ of $A$ and $V$ of $B$ s.t. $U inter V = emptyset$.

  Being separated by neighborhoods is equivalent to being separated by open neighborhoods.

  Separated by neighborhoods implies separated.
]

#definition(title: [Separated by closed neighborhoods])[
  $A$ and $B$ in the space $X$ are #defname[separated by closed neighborhoods] iff there exist neighborhoods $U$ of $A$ and $V$ of $B$ s.t. $cl(U) inter cl(V) = emptyset$.

  Separated by closed neighborhoods implies separated by neighborhoods.
]

#definition(title: [Separated by continuous functions])[
  $A$ and $B$ in the space $X$ are #defname[separated by continuous functions] iff there exists a continuous function such that $f(x) = 0$ for all $x in A$ and $f(x) = 1$ for all $x in B$.

  Separated by continuous functions implies separated by neighborhoods.
]

== $T_0$ through $T_2$ spaces

#definition(title: [Kolmogorov space ($T_0$)])[
  A space where given two distinct points in the space, at least one has a neighborhood that does not include the other.
]

#lemma[
  $X$ is $T_0$ iff for any $x, y in X$, $x != y iff cl({x}) != cl({y})$.
]

#definition(title: [Fréchet space ($T_1$)])[
  A space where given two distinct points in the space, each has a neighborhood that does not include the other.

  Equivalently, a space where all two points are separated.

  $T_1$ spaces are $T_0$.
]

#lemma[
  Points in $T_1$ spaces are closed sets.
]

#lemma[
  $X$ is $T_1$ iff ${x} = cl({x})$ for all $x in X$.
]

#definition(title: [Hausdorff space ($T_2$)])[
  A space where given two distinct points $x != y$, there are neighborhoods $X$ of $x$ and $Y$ of $y$ s.t. $X inter Y = emptyset$.

  Equivalently, a space where all two points are separated by neighborhoods.

  $T_2$ spaces are $T_1$.
]

#definition(title: [$T_(2 1/2)$ space])[
  A space where given two distinct points $x != y$, there are neighborhoods $X$ of $x$ and $Y$ of $y$ s.t. $cl(U) inter cl(V) = emptyset$.

  Equivalently, a space where all two points are separated by closed neighborhoods.

  This is also called #defname[completely Hausdorff] (in older texts) and #defname[Urysohn] (in newer texts).

  $T_(2 1/2)$ spaces are $T_2$.
]

#definition(title: [Functionally Hausdorff space])[
  A space $X$ where given two points $x != y$, there is a continuous function $f : X to [0, 1]$ with $f(x) = 0$ and $f(y) = 1$.

  Equivalently, a space where all two points are separated by continuous functions.

  This is also called #defname[Urysohn] (in older texts) and #defname[completely Hausdorff] (in newer texts).

  Functionally Hausdorff spaces are $T_(2 1/2)$.
]

#lemma[
  The following are equivalent:
  1. $X$ is $T_2$
  2. Limits of filter bases in $X$ are unique.
  3. The diagonal, $Delta = {(x, y) in X times X : x = y}$
]

#lemma[
  Products and subspaces of $T_i$ spaces are $T_i$ for $i = 0, 1, 2$.
]

== Regular spaces

#definition(title: [Regular space])[
  A space in which any point and any disjoint closed set can be separated by neighborhoods.

  Equivalently a space in which any point and any disjoint closed set can be separated by closed neighborhood.
]

#theorem[
  $X$ is regular iff the closed neighborhoods of each $x in X$ form a neighborhood base of $x$.
]

#definition(title: [Regular Hausdorff space ($T_3$)])[
  A $T_1$ space which is regular.

  Equivalently, a $T_(2 1/2)$ space which is regular.
]

// TODO - Are functionally Hausdorff spaces T_3?

#definition(title: [Completely regular space])[
  A space in which closed sets and disjoint single points can be separated by continuous functions.
]

#definition(title: [Tychonoff space ($T_(3 1/2)$)])[
  A completely regular $T_1$ space.

  Tychonoff spaces are $T_3$ and functionally Hausdorff.
]

#theorem[
  Subspaces and products of regular spaces are regular.

  Subspaces and products of completely regular spaces are completely regular.
]

#theorem[
  $X$ is completely regular iff it has the topology induced by its set of bounded continuous real-valued functions.
]

#corollary[
  A topological space is Tychonoff iff it is homeomorphic to a subspace of a hypercube ($[0, 1]^n$).
]

== Normal spaces

#definition(title: [Normal space])[
  A topological space is #defname[normal] iff disjoint closed sets are separated by neighborhoods.
]

#definition(title: [Normal Tychonoff space ($T_4$)])[
  A normal $T_1$ space.

  Equivalently, a normal $T_(3 1/2)$ space.
]

#lemma[
  If $X$ contains a dense set $D$ and a closed discrete subspace $S$ with cardinality at least as large as $powerset(D)$, then $X$ cannot be normal.
]

#definition(title: [Completely normal])[
  A space in which every subspace is normal.
]

#definition(title: [Completely normal Tychonoff ($T_5$)])[
  A completely normal $T_1$ space.

  Equivalently, a completely normal $T_4$ space.
]

#theorem(title: [Urysohn's Lemma])[
  In a normal space $X$, any two disjoint closed sets $A$ and $B$ can be separated by a continuous function.
]

#theorem(title: [Tietze Extension Theorem])[
  $X$ is normal iff for any closed set $A$ of $X$, every continuous function $f : A to [0, 1]$ can be extended to a continuous function $X to Reals$.
]

#corollary[
  $X$ is normal iff for any closed set $A$ of $X$, every continuous function $f : A to Reals$ can be extended to a continuous function $X to Reals$.
]

= Countability properties

#see[17 Countability Properties]

#theorion-restate(filter: <def:1-cble>)

#theorion-restate(filter: <def:2-cble>)

#definition(title: [Separable])[
  A space is #defname[separable] iff it has a countable dense subset, i.e. it has a countable subset s.t. every nonempty open set of $X$ intersects the countable subset, or equivalently the closure of the countable subset is the whole space.
]

#lemma[
  Second countability is preserved under subspaces and countable products.
]

#definition(title: [Lindelöf space])[
  A space is #defname[Lindelöf] iff every open cover has a countable subcover.
]

#lemma[
  Second countability implies first countability, separability, and Lindelöf.
]

#lemma[
  Any collection $calU$ of open subsets of a second countable space has a countable subcollection $calV$ s.t. 
  $ union.big_(V in calV) V = union.big_(U in calU) U $

  Thus, every open cover of a second countable space has a countable subcover, so all second countable spaces are Lindelöf.
]

#lemma[
  All regular Lindelöf spaces are normal.

  In metric and pseudometric spaces, separability, Lindelöf, and second countability are equivalent.
]

#definition(title: [Separation])[
  Given $A subset X$, two sets $B$ and $C$ are a #defname[separation] of $A$ iff they are nonempty and 
  $ B inter cl(C) = emptyset = cl(B) inter C $
]

#theorem[
  A subspace $A subset X$ is disconnected iff there exists a separation of it.
]

// TODO

= Connectedness 

#see[18 Connectedness]

#definition(title: [Connected space])[
  A topological space where the only sets that are both open and closed are the whole space and $emptyset$.
]

#theorem[
  The continuous image of a connected space is connected.
]

#definition(title: [Separation])[
  A #defname[separation of $A$] is a pair $B, C$ of nonempty subsets of $A$ which satisfies
  $ B inter cl(C) = cl(B) inter C = emptyset $
]

#theorem[
  A subspace $A$ of $X$ is disconnected under the subspace topology iff it has a separation.
]

#corollary[
  If $A$ is connected and $A subset B union C$, where $B inter cl(C)$ and $cl(B) inter C$ are both empty, though neither $B$ nor $C$ are, then either $A subset B$ or $A subset C$.

  If $A$ is a connected subset of a connected space, and $X - A = B union C$ where $B$ and $C$ are separated, then $A union C$ and $B union C$ are both connected.

  If $A$ and $B$ are closed sets s.t. both $A inter B$ and $A union B$ are connected, then $A$ and $B$ are both connected.

  If $A$ is connected and $A subset B subset cl(A)$, then $B$ is connected.

  Let $calA$ be any collection of connected subsets of $X$ with the property that any two elements of $calA$ have nonempty intersections. Then $calA = union_(A in calA) A$ is connected.

  $X$ is connected iff for each pair of points, there is a connected subset of $X$ containing both of them.
]

#theorem[
  The connected subsets of $Reals$ are the intervals $(a, b)$, $(a, b]$, $[a, b)$, and $[a, b]$ where $a$ and $b$ are real numbers or infinite.
]

#theorem(title: [Intermediate Value Theorem])[
  If $f : X to Reals$ is continuous with $X$ connected and $x, y in X$, then for any $c in (f(a), f(b))$ there exists $z in X$ s.t. $f(z) = c$.
]

#theorem[
  A product of connected spaces is connected. Conversely, given a nonempty product that is connected, each factor is connected.
]

== Components

#definition(title: [Component])[
  A connected subset of $X$ not contained in any other connected subset of $X$.
]

#lemma[
  The union of all connected subsets of $X$ containing $x$ is a component containing $x$.
]

#lemma[
  The components of a space form a partition of the space.
]

#lemma[
  The components of a product space are the products of the components of the factors.
]

#definition(title: [Totally disconnected space])[
  A space in which each component is a single point.
]

#lemma[
  Products of totally disconnected spaces are totally disconnected.

  Discrete spaces and the Cantor set are both totally disconnected.
]

== Local connectedness

#definition(title: [Locally connected space])[
  A space in which each point has a neighborhood base consisting of connected sets.
]

#theorem[
  The *finite* product of locally connected sets are locally connected. If a product is locally connected, then all but finitely many factors are connected and the remainder locally connected.
]

#theorem[
  The following are equivalent:
  1. $X$ is locally connected.
  2. If $N$ is any neighborhood of $x$ there is a neighborhood $M$ of $x$ contained in the component of $N$ that contains $x$.
  3. Components of open sets are open.
]

= Compactness

#see[19.1 Types of Compactness]

#definition(title: [Compactness])[
  A space where every open cover has a finite subcover.
]

#definition(title: [Countable compactness])[
  A space where every countable cover has a finite subcover.
]

#lemma[
  A space is compact iff it is countably compact and Lindelöf.
]

#definition(title: [Sequential compactness])[
  A space where every sequence has a convergent subsequence.
]

#lemma[
  Sequential compactness implies countable compactness.
]

#example[
  Closed, bounded intervals on the real line are compact and sequentially compact.

  The reals are neither compact nor sequentially compact.

  $[0, Omega]$ is both compact and sequentially compact.

  $[0, Lambda)$ for any infinite $Lambda$ is not compact, but $[0, Omega)$ is sequentially compact.

  Infinite discrete spaces are neither compact nor sequentially compact.
]

#definition(title: [Finite intersection property])[
  A collection of subsets of $X$ has the #defname[finite intersection property] iff every finite subcollection of the sets has a nonempty intersection.

  If $X$ is a topological space, this is equivalent to being a filter base.
]

#theorem[
  The following are equivalent:
  1. $X$ is compact.
  2. Every family of closed subsets of $X$ with the finite intersection property has nonempty intersection.
  3. Every ultrafilter in $X$ has a limit.
]

#corollary(title: [Tychonoff Theorem])[
  A product $X product X_alpha$ of nonempty spaces is compact iff each factor is compact.
]

#theorem[
  In a $T_1$ space, the following are equivalent:
  1. $X$ is countably compact
  2. Every infinite open cover has a proper subcover
  3. Every infinite subset has an accumulation point
  4. (#defname[Cantor Intersection Property]) Every decreasing sequence of nonempty closed subsets has nonempty intersection.
]

== Separation properties in compact spaces

#see[19b Separation Properties in Compact Spaces]

#lemma[
  Let $A$ be a compact subset of a Hausdorff space $X$ with $x in.not A$. Then, $x$ and $A$ can be separated by open sets.
]

#corollary[
  Compact subsets of Hausdorff spaces are closed.
]

#corollary[
  A continuous bijection from a compact space to a Hausdorff space is a homeomorphism.
]

#lemma[
  In a (completely) regular space, a compact set and a disjoint closed set can be separated by neighborhoods (continuous functions).
]

#corollary[
  All compact Hausdorff spaces are $T_4$.
]

== Local compactness

#see[20 Local Compactness]

#definition(title: [Local compactness])[
  A space $X$ is #defname[locally compact] iff each point $x in X$ has a neighborhood base consisting of compact neighborhoods.
]

#lemma[
  All locally compact Hausdorff spaces are $T_3$.
]

#lemma[
  A Hausdorff space is locally compact iff each point has at least one compact neighborhood.
]

#corollary[
  Compact Hausdorff spaces are locally compact.
]

#theorem[
  A subset of a locally compact Hausdorff space is itself locally compact iff it is the intersection of a closed set with an open set.
]

== One-point compactification

#definition(title: [One-point compactification])[
  Let $X$ be a space, and define $infinity_X$ to be some point not in $X$. Create a new space, called the #defname[one-point compactification] or #defname[Alexandroff compactification] of $X$, $X^* := X union {infinity_X}$, whose open sets are the open sets of $X$, together with complements of closed compact subsets of $X$ in $X^*$ (which all contain $infinity_X$).

  This forms a closed compact space.
]

#lemma[
  The one-point compactification of $Reals^n$ is $Sphere^n$, the $n$-dimensional sphere.

  The one-point compactification of an open interval on $Reals$ is $Sphere^1$, a circle.

  The one-point compactification of $[a, b)$ in the real line is $[a, b]$.
]

= Past homework problems

== HW01 Set Basics

1. For all sets $A, B, C$, prove that  
   $A inter (B - C) = (A inter B) - (A inter C)$.

2. Prove that a function $f: A to B$ is an injection if and only if  
   $f(X inter Y) = f(X) inter f(Y)$ for all subsets $X$ and $Y$ of $A$.

3. Prove that two equivalence classes of the same equivalence relation on a set are either equal or disjoint.

4. Let $R$ be an equivalence relation on $A$. Prove that the set of equivalence classes of $A$ under $R$ (denote $A\/R$) is a partition of $A$.  
   Conversely, given a partition $cal(P)$ of $A$, prove that there exists a unique equivalence relation $R$ on $A$ such that  
   $cal(P) = A\/R$.

5. Prove that, for any set $A$, there is a bijection from the power set of $A$, $powerset(A)$, to the function set $2^A$.

6. Let $A$ and $B$ be partially ordered sets and define a relation $<=$ on $A times B$ by  
   $(a, b) <= (a', b')$ in $A times B$ iff both $a <= a'$ in $A$ and $b <= b'$ in $B$.  
   (Please excuse the abuse of notation using the same symbol for all three relations despite the fact that they are certainly not the same sets of ordered pairs!)

   a. Prove that this is a partial order on $A times B$.

   b. Give an explicit example showing that $A times B$ need not be totally ordered even if both $A$ and $B$ are.

7. A totally ordered set $S$ is called #defname[dense in itself] if, whenever $x, y in S$ with $x < y$, there is a $z in S$ such that $x < z < y$.  
   Prove that two countable totally ordered sets, neither of which has a first or last element, and both of which are dense in themselves, are order-isomorphic.

8. Given $f: A to B$  

   a. Prove that the induced map $indmap(f): powerset(A) to powerset(B)$ preserves order (under subsets) and commutes with union.  

   b. Prove that the induced map $indmap(f^(-1)): powerset(B) to powerset(A)$ preserves order and commutes with union, intersection, and complement.

== HW02 Posets

1. Prove that a poset in which every subset has a supremum is a complete lattice.

2. Let $f : A to A$ be an order preserving injection of a well-ordered set into itself. Prove that $a <= f(a)$ for all $a in A$.

3. Prove that a well-ordered set is not order-isomorphic to any of its initial segments.

4. Prove that there exists an uncountable well-ordered set with a last element $Omega$ such that if $a < Omega$ then the initial segment of $a$ is countable.

5. For any subset $A$ of a metric space and any real number $epsilon > 0$, prove that $U(A, epsilon)$ is open.

6. A metric $d$ on $M$ is _bounded_ if there is a constant $c$ such that $d(x, y) <= c$ for all $x, y in M$. Given a metric $d$ on $M$, define $d^*$ by $d^*(x, y) = min(d(x, y), 1)$. Prove that $d^*$ is a bounded metric on $M$ such that $d$ and $d^*$ have the same collection of open sets.

== HW03 Topology

1. How many topologies are there on a 3-element set? How many are distinct under rearrangement of the points?

2. Let $cal(T)$, $cal(T')$ be topologies on $cal(X)$ and $cal(X')$, respectively. Determine (with proof or counterexample) whether the collection ${U times U' : U in cal(T), U' in cal(T')}$ is a topology on $cal(X) times cal(X')$.

3. For a closed set $A subset X$, prove that $(overline(A degree)) degree = A degree$.

#note-box[We have seen that the interior of a set can be found by closures and complements: $A degree = X setminus overline((X setminus A))$. (Similarly, closures can be found in terms of interiors and complements.) _Kuratowski's Closure-Complement Theorem_ asserts that starting with a set $A$, there are at most 14 different sets that can be obtained by repeatedly taking closures and complements in some order. Challenge: prove this, and find a set of real numbers that achieves the bound of 14 sets.]

4. If $U$ is an open subset of $A$ such that $(A - U) degree = emptyset$, does it follow that $U = A degree$? Proof or counterexample.

There is a counterexample.

5. Prove that in a metric space $M$, $overline(A) = {x in M : d(x, A) = 0}$.

6. Prove that every closed subset of a metric space is the intersection of a countable family of open sets.

7. If $A$ and $B$ are subsets of a metric space such that $A inter overline(B) = overline(A) inter B = emptyset$, prove that there exist disjoint open subsets $U$ and $V$ such that $A subset U$ and $B subset V$.

8. A subset $A$ of a topological space is _nowhere dense_ in the space if $overline(A) degree = emptyset$. Prove that a closed subset is nowhere dense if and only if it is the boundary of some open set.

== HW04 Using the Basics

1. Let $A subset X$ and $B subset Y$. In the product space $X times Y$ prove that $(A times B) ior = A ior times B ior$. (Clearly this can extend to any finite product by induction.)

2. Let $X = product X_lambda$ where $X_lambda$, $lambda in Lambda$ be any product of topological spaces, with the product topology. Let $A = product A_lambda$ where each $A_lambda subset X_lambda$. prove that $cl(A) = product cl(A_lambda)$.

3. A topological space is #defname[separable] if it has a countable dense subset (that is, a countable set whose closure is the entire space). Prove that a metric topology is separable iff it is second countable.

4. Prove that every second countable space is separable.

5. Prove that the Sorgenfrey line is separable.

#note-box[
  The Sorgenfrey line thus provides an example of a space that is separable and first countable,
but still not second countable.
]

6. Prove that an open subset of a separable space is separable; given an example of a separable space with a subspace that is not separable.

7. A collection of functions $f_lambda : X to X_lambda$ _separates points from closed sets_ if, given closed $A subset X$ and a point $x in.not A$ then there is some $lambda$ such that $f_lambda (x) in.not cl(f_lambda (A))$.

  If ${f_lambda}$ is a collection of continuous functions that separates points from closed sets, prove that $X$ has the topology induced by the $f$s.

8. Prove that a countable product of first countable spaces is first countable.

== HW05 Filters and Separation

1. Under what conditions is a filter equal to the intersection of all the ultrafilters that contain it?

A filter is always equal to the intersection of all the ultrafilters containing it.

2. Prove that a filter which is contained in a unique ultrafilter is an ultrafilter.

3. A filter $calF$ in a metric space is a #defname[Cauchy filter] iff for every $epsilon > 0$ there is an $F in calF$ with diameter less than $epsilon$. (The diameter of a set $F$ is $sup {d(x, y) : x, y in F}$.) Prove that if $calF$ converges in the metric topology then it is a Cauchy filter.

4. Prove that every Cauchy filter in $Reals$ converges.

5. In a $T_1$ space, prove that $x$ is an accumulation point of a subset $A subset X$ iff every neighborhood of $x$ contains infinitely many points of $A$.

6. Let $f_n : X to Y$ be a sequence of continuous functions from a topological space $X$ to a metric space $Y$ that _converges uniformly_ to a function $f$. That is, for every $epsilon > 0$ there is an integer $N$ such that $d(f_n (x), f(x)) < epsilon$ for all $n >= N$ and all $x in X$. Prove that the limit function $f$ is also continuous.

7. (Skipped) Let $calU$ be an open covering of a normal space $X$ such that every point in $x$ belongs to only finitely many of the $U in calU$. Prove that there exists another open covering $calV = {V_U : U in calU}$ of $X$ such that $cl(V_U) subset U$ for every $U in calU$.

8. Prove that every open covering of the Sorgenfrey line contains a countable subcovering.

9. Prove that every open subset of the reals is the union of a countable family of pairwise disjoint open intervals.

== HW06 Assorted

1. Let $calF$ be a filter base in a topological space $X$. Prove that $calF$ converges to a point $x_0 in X$ iff every ultrafilter containing $calF$ converges to $x_0$.

2. Prove that a topological space $X$ is Hausdorff iff for every topological space $Y$ and every pair of continuous functions $f$ and $g$ from $Y$ to $X$, the set ${y in Y : f(y) = g(y)}$ is a closed subset of $Y$.

3. Prove that a topological space $X$ is completely normal iff every pair of subsets $A$ and $B$ s.t. $cl(A) inter B = emptyset = A inter cl(B)$ can be separated by neighborhoods.

4. Let $X$ be a set and $Y$ a metric space with metric $d(x, y)$. Let $B(Y^X)$ denote the set of all bounded functions from $X$ to $Y$ (that is, $sup({d(f(x_1), f(x_2))})$ is finite).  Prove that $d'(f, g) := sup({d(f(x), g(x)) : x in X})$ is a metric on $B(Y^X)$.

5. Let $X$ be a topological space. Let $C subset B(Y^X)$ be the set of all bounded continuous functions. Prove that $C$ is a closed subset of $B(Y^X)$.

6. (Extra credit) Let ${U_lambda}_(lambda in Lambda)$ be a locally finite open covering of a normal space $X$. Prove that there is a collection of continuous functions ${f_lambda : X to [0, 1]}_(lambda in Lambda)$ such that $f_lambda (X - U_lambda) = 0$ and $sum_(lambda in Lambda) f_lambda (x) = 1$ for all $x in X$. (Note that each sum is actually a finite sum, since by the local finiteness of the $U$s only a finite number of the summands are nonzero. Such a collection is called a #defname[partition of unity subordinate to ${U_lambda}$]).

== HW07 More Assorted

1. A #defname[zero set] in a topological space is the set of zeroes for some continuous real-valued function on $X$. Prove that in a normal space, a necessary and sufficient condition for a set to be a zero set is that it be closed and a countable intersection of open sets.

2. A subset $A$ of a topological space is #defname[nowhere dense] in $X$ iff every nonempty open set $U subset X$ contains a nonempty open set $V$ s.t. $V inter A = emptyset$. Let $A subset B subset C subset X$ and assume that $B$ is nowhere dense in $C$. Show that $A$ is nowhere dense in $C$ and $B$ is nowhere dense in $X$.

3. Prove the following are equivalent:
  1. $A$ is nowhere dense in $X$.
  2. $X - cl(A)$ is dense in $X$.
  3. $cl(A)$ is nowhere dense in $X$.

4. Prove that a connected Tychonoff space with more than one point has uncountably many points.

5. Prove that an open interval $(a, b)$ is not homeomorphic to a half-open interval $[c, d)$, both subspaces of the line.

6. Prove that $Reals$ is not homeomorphic to $Reals^n$ for any $n > 1$.

7. Prove that every continuous map of the closed unit interval to itself has a fixed point. Decide whether the result is true for the open unit interval. Decide whether the result is true for bounded continuous functions from $Reals$ to itself.

8. Prove that there is no continuous injective map from the circumference of the unit circle (with the induced topology from the plane) into $Reals$.

9. (Extra credit) A metric space is #defname[complete] iff every Cauchy filter converges. Prove that, in a complete metric space, the intersection of a countable family of dense open subsets is dense.


= Summary sections

== Closure

#theorion-restate(filter: <def:closure>)

#theorion-restate(filter: <thm:closure-nbhd>)

#theorion-restate(filter: <cor:closure-accpt>)

#theorion-restate(filter: <thm:closure-net>)

#theorion-restate(filter: <thm:closure-filterbase>)

== Continuity

#theorion-restate(filter: <def:continuity>)

#theorion-restate(filter: <thm:continuity-metric>)

#theorion-restate(filter: <thm:continuity-epsilon-nbhd>)

#theorion-restate(filter: <thm:continuity-net>)

#theorion-restate(filter: <thm:continuity-filter>)

== Common/useful topologies

#definition(title: [Standard topology on $Reals$])[
  A set is open iff it is the union of open intervals.
]

#definition(title: [Discrete topology])[
  All sets are open:
  $ cal(T) = powerset(X) $

  This is equivalent to the topology given by the discrete metric.
]

#definition(title: [Indiscrete topology])[
  Only the entire topological space and $emptyset$ are open.

  This is a metrizable space given by the indiscrete pseudometric.
]

#definition(title: [Metric topology])[
  The topology generated by the base consisting of all open balls $U(x, epsilon)$.
]

#definition(title: [Cofinite topology])[
  All subsets whose complements are finite are open. $emptyset$ is also open.
]

#definition(title: [Sorgenfrey line])[
  The topology generated by the base consisting of all half-open intervals $[a, b)$.
]

#definition(title: [Excluded-point topology])[
  Choose a point $x$ in a set $X$. All sets not containing $x$, along with the entire space $X$, are open.
]

#definition(title: [Order topology / interval topology])[
  On a well-ordered set $X$, a set is open iff it is the union of open intervals.
]

#definition(title: [Slotted plane])[
  The topology on $Reals^2$ generated by the neighborhood base at each point $x$ of the set of disks missing their central diameter but including $x$ itself.
]

#definition(title: [Moore plane])[
  The topology on the closed upper half-plane generated by the neighborhood base of:
  - For points above the $x$-axis, the set of open disks about the point which do not touch the $x$-axis
  - For points on the $x$-axis, the set of open disks tangent to the $x$-asix at the point, along with the point itself
]

#definition(title: [$Omega$ topology])[
  The #defname[open $Omega$ topology] is the order topology on the well-ordered set $[0, Omega)$ (the least uncountable well-ordered set).

  The #defname[closed $Omega$ topology] is the order topology on the well-ordered set $[0, Omega]$ (the least uncountable well-ordered set plus $Omega$ itself).
]

#if(not is-previewing) [

#colbreak()

= Index

== Headings

#outline(title: none)

== Definitions

// Table of definitions
#outline(title: none, target: figure.where(kind: "definition"))

== Theorems

#outline(title: none, target: (figure.where(kind: "theorem")))

== Axioms

#outline(title: none, target: (figure.where(kind: "axiom")))

== Lemmata

#outline(title: none, target: (figure.where(kind: "lemma")))

== Corollary

#outline(title: none, target: (figure.where(kind: "corollary")))

] // not is-previewing
