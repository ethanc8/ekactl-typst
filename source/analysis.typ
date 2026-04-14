#import "@local/ethan-standard-style:0.1.0": *
#show: ekactl-style.with(
  section-number: 4,
  title: "Real analysis"
)

#import "@preview/cetz:0.4.2"

#let seeline(it) = [
  #set text(size: 10pt)
  #it
]

#let see(it) = seeline()[
  _See_ #it
]

#let scr(it) = math.class("normal", box({
  show math.equation: set text(stylistic-set: 1)
  $cal(it)$
}))

#let closure(x) = $overline(#x)$
#let inner(x) = $#x^circle.small$

#let powerset = $cal(P)$
#let nbhds = $cal(N)$
#let calB = $cal(B)$
#let calD = $cal(D)$
#let calT = $cal(T)$
#let calA = $cal(A)$
#let calF = $cal(F)$
#let calU = $cal(U)$
#let calV = $cal(V)$
#let calC = $cal(C)$
#let calG = $cal(G)$
#let calE = $cal(E)$
#let calI = $cal(I)$
#let calJ = $cal(J)$

#let to = sym.arrow
#let implies = sym.arrow.r.double
#let iff = sym.arrow.l.r.double
#let setminus = sym.backslash

#let Reals = sym.RR
#let Naturals = sym.NN
#let Integers = sym.ZZ
#let Complex = sym.CC
#let Rationals = sym.QQ

#let Sphere = $SS$

#let dun = math.union.sq // disjoint union
#let cl = math.overline // closure
#let indmap = math.overline // induced
#let ior = math.degree // interior
#let bound = math.partial // boundary

#let Riemann = $cal(R)$

#let card = [card]

#let int = math.integral

#set math.vec(delim: "[")

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

#see[04 Set Theory, [Topology] 01 Set Theory]

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

== Ordered pair

#see[04 Set Theory]

#definition(title: [Ordered pair])[
  The #defname[ordered pair] $(a, b)$ is the set ${{a}, {a, b}}$.
]

#theorem[
  $(a, b) = (c, d) <==> a = c "and" b = d$.
]

== Relations

#see[04 Set Theory, [Topology] 02 Relations]

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

== Sequence

#definition(title: [Sequence])[
  A #defname[sequence] is a function whose domain is the natural numbers, or some subset of the natural numbers.

  If $a$ is a sequence, $a(n)$ is also denoted $a_n$, and is called the $n$th element of $a$.
]

== Cardinality

#see[06 Counting and Sizes of Sets]

Assume that there is some "overset" containing all of the sets we consider.

#definition(title: [Cardinality])[
  $card(A)$ is the equivalence class of $A$ under bijection.

  Equivalently, $card(A) = card(B)$ iff there is a bijection $A to B$.

  Two sets are #defname[equipotent], #defname[equinumerous], #defname[equipollent], or #defname[similar] if they have the same cardinality.
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

#theorem[
  Every infinite set is similar to a proper subset of itself.

  No finite set is similar to a proper subset of itself.
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
  $ card(Reals) = card(powerset(Integers^+)) $

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
9
#theorem(title: [Hausdorff Maximum Principle])[
  Every poset has a "maximal" totally ordered subset, i.e. a totally ordered subset that cannot be extended without escaping the poset.
]

#theorem(title: [Zorn's Lemma])[
  If $A$ is a poset in which every totally ordered subset has an upper bound, then $A$ has a maximal element, i.e. there is no larger element in the poset.
]

= Fields and order

== Equality

#definition(title: [Equality])[
  #defname[Equality] is an equivalence relation on the reals, so:
  - *Reflexive:* $x = x$.
  - *Symmetric:* $x = y ==> y = x$.
  - *Transitive:* $x = y "and" y = z ==> y = z$.
]

== Fields

#definition(title: [Field])[
  A #defname[field] $FF$ is any set equipped with two relations, #defname[addition] ($+$) and #defname[multiplication] ($*$), which satisfy the following properties:
  - *Closure axiom:* If $x$ and $y$ are in $FF$, so are both $x + y$ and $x y$.
  - *Commutativity axioms:* $x + y = y + x$ and $x y = y x$.
  - *Associativity axioms:* $(x + y) + z = x + (y + z)$ and $(x y) z = x (y z)$.
  - *Distributivity axiom:* $x(y + z) = x y + x z$.
  - *Substitution axioms:* $w = x "and" y + z ==> w + y = x + z "and" w y = x z$.
  - The *additive inverse axiom* and *multiplicative inverse axiom*, defined below.
]

#axiom(title: [Additive inverse axiom])[
  Given $x, y in FF$, there exists $z in FF$ s.t. $x + z = y$ (i.e. all addition problems have solutions).

  We denote this $z$ by the expression $(y - x)$. We also denote, for every $x$:
  $ 0_x &:= (x - x) \
  -x &:= (0_x - x) $
]

#theorem(title: [Zero is unique])[
  There is some $0 in FF$ s.t. $0 = 0_x = 0_y$ for all $x$ and $y$ in $FF$.
]

#axiom(title: [Multiplicative inverse axiom])[
  There exists some number in $FF$ which is not equal to $0$. If $x, y in FF$ s.t. $x != 0$, then there exists a real number $z$ s.t. $x z = y$. This $z$ is denoted $(y\/x)$.
  
  The number $(x\/x)$ is denoted $1_x$, and $(1_x\/x)$ is denoted $x^(-1)$ and called the #defname[reciprocal] of $x$.
]

#theorem(title: [One is unique])[
  There is some $1 in FF$ s.t. for all nonzero $x$ and $y$, $1 = 1_x = 1_y$. 
]

#lemma[
  In any field $FF$, the following hold:
  - $0x = 0$ for any $x$
  - $0\/x = 0$ for any nonzero $x$
  - $-(-x) = x$
  - $(x^(-1))^(-1) = x$ for any nonzero $x$
  - $-(x - y) = y - x$
  - $x - y = x + (-y)$
  - $-(x + y) = (-x) + (-y)$
  - $-x = -1 x$
]

== Order

#definition(title: [Order])[
  Let $S$ be a set. An #defname[order] $<$ is a relation that satisfies the order axioms:
  - *Trichotomy:* For any $x, y in S$, exactly one of:
    - $x < y$
    - $x = y$
    - $x > y$
  - *Transitivity*: If $x < y$ and $y < z$, then $x < z$.
]

#definition(title: [Upper bound])[
  $u$ is an #defname[upper bound] for $A$ iff $a <= u$ for all $a in A$.
]

#definition(title: [Supremum])[
  The #defname[supremum] or #defname[least upper bound] of $A$, denoted $sup A$, is the unique object s.t. for every upper bound $u$ of $A$, $sup A <= u$.
]

#definition(title: [Lower bound])[
  $l$ is an #defname[lower bound] for $A$ iff $l <= a$ for all $a in A$.
]

#definition(title: [Infimum])[
  The #defname[infimum] or #defname[greatest lower bound] of $A$, denoted $sup A$, is the unique object s.t. for every upper bound $l$ of $A$, $sup A <= l$.
]

#theorem[
  If a set has a maximum, the maximum is its supremum.

  If a set has a minimum, the minimum is its infimum.
]

#definition(title: [Dedekind completeness])[
  An ordered set is #defname[complete], #defname[Dedekind-complete], or has the #defname[least upper bound property] iff:
  - every subset of the set that has an upper bound has a supremum, or equivalently
  - every subset of the set that has a lower bound has an infimum.
]

== Ordered fields

#definition(title: [Ordered field])[
  A field $FF$ is an #defname[ordered field] iff it has an order $<$ #defname[compatible with arithmetic], i.e. satisfying the properties:
  - *Translation*: If $x < y$, then $x + z < y + z$ for all $z$.
  - *Positive closure:* If $x>0$ and $y>0$, then $x y > 0$.

  An element $x$ is #defname[positive] if $x > 0$ and #defname[negative] if $x < 0$. The set containing all positive elements of $FF$ is denoted $FF^+$, and the set containing all negative elements of $FF$ is denoted $FF^-$.
]

#lemma[
  - $x > 0 "and" y > 0 ==> x + y > 0$
  - $x > 0 ==> -x < 0$
  - $-x > 0 ==> x < 0$
  - $1$ is positive
  - $x > y$ and $z$ is positive $==> x z > y z$
  - $x > y > 0 ==> 0 < x^(-1) < y^(-1)$
]

#theorem[
  If $a, b in FF$ and $a <= b + epsilon$ for every positive $epsilon$, then $a <= b$ (if $FF$ is an ordered field).
]

== Real numbers

#theorem[
  There is a unique complete ordered field, called $Reals$, the #defname[real numbers].
]

#theorem(title: [Approximation Property])[
  Let $S$ be a nonempty set of reals with a supremum. Then for every real number $a < sup S$ there exists $x in S$ with $a < x <= sup S$.
]

#theorem(title: [Additive Property])[
  Let $A$ and $B$ be sets of reals with suprema. Consider 
  $ C := {a + b : a in A, b in B}. $
  Then,
  $ sup C = sup A + sup B. $
]

#theorem(title: [Comparison Property])[
  Let $S$ and $T$ be two nonempty sets of reals where $s <= t$ for all $s in S, t in T$. Then, if $T$ has a supremum, $S$ also has a supremum and $sup S <= sup T$.
]

#lemma[
  The positive integers have no upper bound.
]

#proof[
  Assume that $z = sup Integers^+$ exists. We know that $z - 1 < z$, so by the approximation property there is a positive integer $s$ with $z - 1 < s$. Thus $z < s + 1$. 
]

#definition(title: [Comensural])[
  The set $X$ is #defname[comensural] iff for any $x, y in X$ with $x > 0$, then there is a positive integer $n$ s.t. $n x > y$.
]

#theorem(title: [Archimedean property])[
  The reals are comensural.
]

#proof[
  Consider $y / x$. If $y/x < 0$, then $n = 0$. Otherwise, $y/x > 0$. Since the positive integers are unbounded, choose $n > y/x$. Then $n x > y$.
]

#theorem(title: [Density of the rationals / rationals between reals])[
  Between any two reals there is a rational number.
]

#proof[
  The other cases are trivial, so consider $0 < x < y$. Choose an integer $n > 1/(y - x)$. 

  We define $q := k/n$, and 
  
  We claim $x < q$. Then:
  $ 1/(y - x) &< n \
  y - x &> 1/n \
  y - 1/n &> x \
  y - q &<= 1/n < y - x $
]

== Extended reals

#definition(title: [Extended reals])[
  The set $Reals^*$ consisting of the reals, plus two elements $-infinity$ and $+infinity$.

  The order on it is defined such that
  $ -infinity < x < +infinity "for all" x in Reals $
  and when comparing two reals it still has the standard order.

  All expressions whose value is defined follow the rules of complete ordered fields, but there are many undefined expressions.
]

== Absolute values

#theorem(title: [Corollaries of the Triangle Inequality])[
  For any $x, y in Reals$:
  $ abs(x + y) &<= abs(x) + abs(y) \
  abs(x - y) &<= abs(x) + abs(y) \
  abs(abs(x) + abs(y)) &<= abs(x - y) $
]

== Bounded function

#definition(title: [Bounded function])[
  $f : S to Reals$ is #defname[bounded] iff the image $f(S)$ has both a supremum and infimum.

  Equivalently, $f$ is bounded iff there exists $M$ s.t. $abs(f(x)) < M$ for all $x$.

  Equivalently, $f$ is bounded iff $f(S)$ is bounded.
]

#theorem[
  If $f(x) <= g(x)$ for all $x in D$, then $sup f(D) <= sup g(D)$.
]

== Decimal representation

#definition(title: [Decimal representation])[
  A string of the form
  $ (-) d_n d_(n - 1) ... d_1 d_0 . d_(-1) d_(-2) ... $
  where each $d_i in {0, 1, 2, ..., 9}$.

  i.e.
  - optionally, a minus sign
  - a finite string of digits
  - a decimal point
  - an infinite string of digits
]

#theorem[
  There is a bijection between $Reals^+$ and the set of decimal representations without a minus sign and such that there is a last 9, i.e. the set of nonterminating positive decimal representations.
]

In order to prove this, we need some lemmas:

#lemma[
  There is a bijection between $Integers^+$ and the set of decimal representations ending in an infinite string of 0s.
]

#proof[
  Every integer is representable as
  $ n = 10m + r. $

  So keep dividing the integer by 10, and pushing the remainder onto the front of the string. This gives us a base-10 representation of the integer, i.e. a finite string of digits.

  To make a full decimal representation, put an infinite string of 0s after the decimal point.
]

Now let's prove the original theorem.

#proof[
  Let $x in Reals^+$. Take $n = floor(x)$ and find its decimal representation. Then $0 < x - n < 1$.
]

Now we need to prove more lemmas:

#lemma[
  Every decimal representation represents a real number.
]

= Sequences

#definition(title: [Sequence])[
  A function $x : Integers^+ to Reals$.

  $x(n)$ is usually denoted $x_n$ and called the $n$th element of the sequence. The sequence itself is often denoted ${x_n}$, ${x_n}_(n=1)^infinity$, $(x_n)$, or similar.

  If the terms of the sequence are specified by a formula, the sequence might be left unnamed and written as, for example, ${1/n}_(n=1)^infinity$.
]

#definition(title: [Limit of a sequence])[
  Let ${x_n}$ be a sequence. $L$ is the #defname[limit], denoted $lim_(n to infinity) x_n$, of the sequence iff for every $epsilon > 0$ there exists $N$ s.t. whenever $n > N$, $abs(x_n - L) < epsilon$. If such a limit exists, the sequence #defname[converges] to that limit.

  A convergent sequence has exactly one limit.

  If a sequence has no limit, it #defname[diverges].
]

#theorem[
  If a sequence is unbounded, it diverges.
]

#definition(title: [Monotonic])[
  Let ${x_n}$ be a sequence. If $x_n <= x_(n + 1)$ for all $n$, the sequence is #defname[non-decreasing] or #defname[increasing]. If $x_n < x_(n + 1)$ for all $N$, the sequence is #defname[strictly increasing]. If $x_n >= x_(n + 1)$ for all $n$, the sequence is #defname[non-increasing] or #defname[decreasing]. If $x_n > x_(n + 1)$ for all $N$, the sequence is #defname[strictly decreasing]. 

  In all these cases, the sequence is #defname[monotonic] or #defname[monotone], and if it is strictly increasing or strictly decreasing, then the sequence is #defname[strictly monotonic].
]

#theorem[
  A bounded monotonically increasing sequence converges to its supremum.

  A bounded monotonically decreasing sequence converges to its infimum.
]

#theorem[
  Every nonempty bounded subset of the reals has an increasing sequence converging to its supremum and a decreasing sequence converging to its infimum.
]

== Subsequences

#definition(title: [Subsequence])[
  If $f : Integers^+ to Integers^+$ is a strictly increasing function and ${x_n}$ is a sequence, ${x_(k(n))}$ is a #defname[subsequence] of ${x_n}$.
]

#theorem[
  The following are equivalent:
  1. The sequence ${x_n}$ converges.
  2. The $t$-tail ${x_(n + t)}$ converges vor every $t$.
  3. There is some $t$ for which the $t$-tail converges.
]

== Limit properties and theorems

#theorem[
  Let ${x_n} to x$ and ${y_n} to y$, s.t. $x_n <= y_n$ for all $n$. Then, $x <= y$.
]

#theorem(title: [Squeeze Theorem])[
  Let ${a_n}$, ${b_n}$, and ${c_n}$ be sequences s.t. $a_n <= b_n <= c_n$ for all $n$ and $a_n to L$ and $c_n to L$. Then $b_n to L$.
]

#proof[
  Let $epsilon > 0$. Choose $n$ so large that both $|a_n - L|, |c_n - L| < epsilon$. Then,
  $ -epsilon < c_n - L < epsilon \
  -epsilon < a_n - L < epsilon
  $
  
  and thus
  $ -epsilon < a_n - L <= b_n - L <= c_n - L < epsilon $
  so clearly
  $ |b_n - L| < epsilon. $

  Since this works for all $epsilon$, $b_n to L$.
]

#theorem[
  Let ${x_n} to x$ and ${y_n} to y$. Then
  1. ${x_n + y_n} to x + y$.
  2. ${x_n - y_n} to x - y$.
  3. ${x_n y_n} to x y$.
  4. ${x_n \/ y_n} to x\/y$ if $y_n != 0$ and $y != 0$ for all $n$.
]

#theorem[
  Let ${x_n}$ be a sequence and $x$ a number. Then,
  $ {x_n} to x <==> {x_n - x} to 0. $
]

#theorem(title: [Convergence of geometric series])[
  Let $c > 0$. Then,
  1. $display(c < 1 ==> lim_(n to infinity) c^n = 0)$.
  2. $c > 1 ==> {c^n}$ is unbounded.
]

#theorem(title: [Ratio Test])[
  Let ${x_n}$ be an always-nonzero sequence s.t. 
  $ lim_(n to infinity) abs(x_(n + 1))/abs(x_n) = L. $

  Then,
  - $L < 1 ==> {x_n} to 0$.
  - $L > 1 ==> {x_n}$ is unbounded.
]
// #proof[
//   Casework!

//   $L < 1$: Choose $r$ s.t. $L < r < 1$. For any $epsilon in (0, r - L)$, find $n$ s.t. 
//   $ abs(x_n + 1)/abs(x_n) < r. $

//   Then, since $epsilon < r - L$, subtracting $L$ from both sides gives us
//   $  $
// ]

// In the book, it proves

#theorem[
  $ lim_(n to infinity) n^(1/n) = 1 $
]


// #proof[
// $n^(1/n)$ is definitely bigger than 1, since otherwise $n$ would be a power of something less than 1.

// If you have $(1 + epsilon)^n$, it happens to be less than $1 + n epsilon$.

// Thus,
// $ 1 + epsilon < (1 + n epsilon)^(1/n). $

// So, we'd like to show that

// $ lim_(n to infinity) n/(1 + epsilon)^n = 0. $


// ]

== Limsup and liminf

#definition(title: [Limsup and liminf])[
  Let ${x_n}$ be a bounded sequence. For each $n$, define
  $ a_n &:= sup {x_k : k >= n} \
  b_n &:= inf {x_k : k >= n} $

  Thus, $a_n$ is above the $n$-tail of the sequence, while $b_n$ is below it.

  Define
  $ limsup_(n to infinity) x_n &= lim_(n to infinity) a_n \
  liminf_(n to infinity) x_n &= lim_(n to infinity) b_n. $

  We know that $limsup x_n >= liminf x_n$.
]

#theorem[
  If ${x_n}$ is bounded, then:
  - there is a subsequence ${x_(n_k)} to limsup x_n$.
  - there is a subsequence ${x_(m_k)} to liminf x_n$.
]

#theorem[
  Let ${x_n}$ be a bounded sequence with $limsup x_n = liminf x_n = L$. Then, ${x_n} to L$.
]

#theorem[
  ${x_n} to L$ iff every subsequence converges to $L$.
]

== Bolzano-Weierstras

#theorem(title: [Bolzano-Weierstrass for Sequences])[
  Every bounded sequence of real numbers (or in $Reals^n$) has a convergent subsequence.

  In topology terms, a subset of $Reals^n$ is sequentially compact iff it is closed and bounded.
]

#definition(title: [Open ball])[
  Let $x in Reals^n$. The ball $B(x, epsilon)$ of radius $epsilon$ about $x$ is defined as

  $ B(x, epsilon) := {y in Reals^n : abs(x - y) < r}. $
]

#definition(title: [Accumulation point])[
  Let $S$ be a set. $x$ is a #defname[accumulation point] of $S$ iff every ball $B(x, epsilon)$ contains a point of $S$ other than $x$.
]

#theorem(title: [Bolzano-Weierstrass theorem])[
  Every bounded infinite subset of $Reals^n$ has an accumulation point.
]

#theorem(title: [Cantor Intersection Theorem])[
  Let $S_1, S_2, ...$ be a sequence of bounded closed subsets of $Reals^n$ nested as follows: $S_1 supset S_2 supset dots.h.c$. Then, the intersection $S_1 inter S_2 inter dots.h.c$ is closed and nonempty.
]

== Infinite limits

#see[16 Infinite Limits]

#definition(title: [Diverging to infinity])[
  A sequence #defname[diverges to $+infinity$] iff for any $M in Reals$ there is an $N$ s.t. for all $n >= N$ then $x_n >= M$.

  A sequence #defname[diverges to $-infinity$] iff for any $M in Reals$ there is an $N$ s.t. for all $n <= N$ then $x_n <= M$.
]

#theorem[
  An unbounded increasing sequence diverges to $+infinity$. An unbounded decreasing sequence diverges to $-infinity$.
]

#definition[
  Let ${x_n}$ be a sequence.

  $limsup x_n = +infinity$ iff ${x_n}$ diverges to $+infinity$.

  $liminf x_n = -infinity$ iff ${x_n}$ diverges to $-infinity$.
]

== Cauchy sequences

#definition(title: [Cauchy sequence])[
  A sequence ${x_n}$ is called #defname[Cauchy sequence] iff for every $epsilon > 0$, there exists $N$ s.t. for all $m, n > n$, $|x_n - x_m| < epsilon$.

  In short, beyond a certain term, all the following terms are arbitrarily close.
]

#theorem[
  Every Cauchy sequence is bounded.
]

#theorem[
  A sequence of reals converges iff it is a Cauchy sequence.
]

= Series

== Series

#definition(title: [Series])[
  Given a sequence ${x_n}$, the object

  $ sum_(n = 1)^infinity x_n $

  is called an #defname[infinite series].

  Given a series $display(sum_(n = 1)^infinity x_n)$, define its #defname[$k^"th"$ partial sum] by

  $ s_k = sum_(n=1)^k x_n := x_1 + x_2 + dots.c + x_n. $

  Since this sum is finite it is a real number. Additionally, we can recursively define this sum as

  $ s_1 &:= x_1 \
  s_(k + 1) &:= s_k + x_(k + 1). $

  A series #defname[converges] iff its sequence of partial sums converges, and it converges to the same value as its sequence of partial sums. It is considered to be equal to said value.

  Series with different starting indices are defined in the obvious way:
  $ sum_(n = a)^infinity x_n := sum_(n=1)^infinity x_(n + a - 1) $
]

== Basic convergence tests

#theorem(title: [$n^"th"$ term test for divergence])[
  If $sum x_n$ converges, then $x_n to 0$.

  Equivalently, if $x_n to.not 0$, $sum x_n$ diverges.
]

#theorem[
  Let $sum x_n = x$ and $sum y_n = y$. Then, $sum (x_n + y_n) = x + y$.

  For any $c in Reals$, $sum (c x_n) = c x$.
]

== Absolute convergence

#see[19 Absolute Convergence]

#lemma[
  If $x_n >= 0$ for all $n$, then $sum x_n$ converges iff the sequence of partial sums is bounded above. Furthermore, each partial sum is less than or equal to the sum.
]

#definition(title: [Absolute convergence])[
  Iff $sum abs(x_n)$ converges, then $sum x_n$ #defname[absolutely converges]. If $sum abs(x_n)$ diverges, but $sum x_n$ converges, then $sum x_n$ #defname[conditionally converges].
]

#theorem[
  If a series converges absolutely, it converges.
]

#theorem(title: [Comparison test for positive series])[
  Let $sum x_n$ and $sum y_n$ be series with $0 <= x_n <= y_n$ for all $n$. Then:
  1. If $sum y_n$ converges, then $sum x_n <= sum y_n$ ($sum x_n$ converges).
  2. If $sum x_n$ diverges, so does $sum y_n$.
]

#corollary[
  $display(sum_(n=1)^infinity 1/n^p)$ converges iff $p > 1$.
]

== Ratio test and root test

#theorem(title: [Ratio test])[
  Let $sum x_n$ be a series of nonzero terms. Suppose that
  $ L := lim_(n to infinity) abs(x_(n + 1))/abs(x_n) $
  exists. Then, 
  - If $L < 1$, $sum x_n$ converges absolutely.
  - If $L > 1$, $sum x_n$ diverges.
  - If $L = 1$, the test gives no information.
]

#theorem(title: [Root test])[
  Let $sum x_n$ be a series and $L := limsup root(n, abs(x_n))$ (which may be infinite). Then,
  - If $L < 1$, $sum x_n$ converges absolutely.
  - If $L > 1$, $sum x_n$ diverges.
  - If $L = 1$, the test gives no information.
]

== Alternating series

#see[20 Alternating Series]

#theorem(title: [Alternating series test])[
  Let $x_n to 0$ be monotone decreasing. Then, $sum (-1)^n x_n$ converges.
]

#theorem[
  Let $sum x_n$ be an absolutely convergent series converging to $L$. Let $sigma : Naturals to Naturals$ be a bijection. Then, $sum x_(sigma n)$ is also absolutely convergent and converges to $L$. 

  In short, if the series is absolutely convergent, we can rearrange the terms and the sum is the same.
]

#theorem(title: [Alternating Series Rearrangement Theorem])[
  Let $sum x_n$ be a series that satisfies the alternating series test but which is not absolutely convergent. Then, for any $L in Reals$ there is a rearrangement of the series that sums to $L$.
]

== Multiplying series

#definition(title: [Cauchy product])[
  The #defname[Cauchy product] of $sum a_n$ and $sum b_n$ is defined as
  $ sum_(k=1)^n a_n b_(n + 1 - k). $

  Essentially, we collect the terms of the product of $sum a_n$ with $sum b_n$ in diagonal strips when the terms are arranged in a grid.
]

#theorem(title: [Mertens' theorem])[
  Let $sum a_n to A$ and $sum b_n to B$. Then if at least one of these is absolutely convergent, then $sum c_n to A B$, where $sum c_n$ is the Cauchy product of $sum a_n$ and $sum b_n$.

  Additionally, if both converge absolutely, so does the sum of $c_n$s.
]

== Power series

#definition(title: [Power series])[
  Given $x_0 in Reals$ and a sequence $a_n$, we can create the #defname[power series], a function of $x$:
  $ sum_(n = 0)^infinity a_n (x - x_0)^n. $

  A power series #defname[converges] iff there exists $x != x_0$ that makes the series converge. If $x = x_0$ makes the series converge, then the series converges for any $x$.
]

#theorem[
  A power series either diverges for all $x != x_0$, converges absolutely for all $x$, or there exists a real number $rho$, called the #defname[radius of convergence], s.t. the series converges absolutely on $(x_0 - rho, x_0 + rho)$ and diverges if $abs(x - x_0) > rho$. 
  
  When $x = x_0 + rho$ or $x = x_0 - rho$, this theorem is inconclusive.
]

= Limits and continuity

== Limits

#definition(title: [Accumulation point])[
  Let $S$ be a set. $x$ is a #defname[accumulation point] of $S$ iff every ball $B(x, epsilon)$ contains a point of $S$ other than $x$.
]

#lemma[
  $x$ is an accumulation point of $S$ iff there is a sequence of points in $S - {x}$ converging to $x$.
]

#definition(title: [Limit])[
  Let $S$ be a subset of $Reals$ and $c$ be an accumulation point of $S$. Let $f : S to Reals$ be a function.

  The #defname[limit] of $f(x)$ as $x to c$ is $L$ iff for each $epsilon > 0$, there exists a $delta > 0$ s.t. whenever $x in S - {c}$ and $abs(x - c) < delta$, then $abs(f(x) - L) < epsilon$. If so, we say that $f(x)$ converges to $L$ as $x to c$.

  If there is no such limit, then the limit does not exist and $f$ #defname[diverges].

  Limits are unique.
]

#theorem[
  Let $S$ be a subset of $Reals$ and $c$ be an accumulation point of $S$. Let $f : S to Reals$ be a function.

  Then $f(x) to L$ as $x to c$ iff for every sequence ${x_n}$ in $S - {c}$ whose limit is $c$, the sequence ${f(x_n)} to L$.
]

== Continuity

#definition(title: [Continuity])[
  Let $S subset Reals$, $c in S$, and $f : S to Reals$ be a function. Then, $f$ is #defname[continuous] at $c$ iff for every $epsilon > 0$, there is a $delta > 0$ s.t. whenever $abs(x - c) < delta$, then $abs(f(x) - f(c)) < epsilon$.
]

#theorem[
  Let $S in Reals$ and $f : S to Reals$ be a function. Let $c$ be a point in $S$. Then:
  1. If $c$ is not an accumulation point of $S$, then $f$ is continuous at $c$.
  2. If $c$ is an accumulation point of $S$, then $f$ is continuous at $c$ iff $display(lim_(x to c) f(x) = f(c))$.
  3. $f$ is continuous at $c$ iff for every sequence ${x_n} in S$ with limit $c$, $f(x_n) to f(c)$.
]

#theorem(title: [Composition of continuous functions is continuous])[
  Let $f : S to Reals$. If $g$ is continuous at $c in T$ and $f$ is continuous at $g(c)$, then $f compose g : T to Reals$ is continuous at $c$.
]

#theorem[
  There are no functions that are continuous at every rational but discontinuous at every irrational.
]

== Big Continuity Theorems

#definition(title: [Bounded function])[
  A function $f : S to Reals$ is bounded iff its image is bounded.
]

#lemma[
  Let $[a, b]$ be a closed finite interval, and $f$ continuous on $[a, b]$. Then $f$ is bounded.
]

#theorem(title: [Extreme Value Theorem])[
  Let $f(x)$ be a continuous function defined on a closed interval $[a, b]$. Then, $f$ achieves an absolute maximum and minimum on $[a, b]$.
]

#lemma[
  Let $f(x)$ be continuous on the closed bounded interval $[a, b]$. If $f(a) < 0$ and $f(b) > 0$, then there exists $c in [a, b]$ s.t. $f(c) = 0$.
]

#theorem(title: [Intermediate Value Theorem])[
  Let $f$ be continuous on closed, bounded $[a, b]$. Let $y in Reals$ s.t. $f(a) < y < f(b)$ or $f(a) > y > f(b)$. Then, there exists $c in (a, b)$ with $f(c) = y$.
]

== Uniform continuity

#definition(title: [Uniform continuity])[
  Let $S subset Reals$ and $f : S to Reals$ be a function. For any $epsilon > 0$, $f$ is #defname[uniformly continuous] on $S$ iff we can find $delta$ s.t. for all $x, c in S$ with $abs(x - c) < delta$, then $abs(f(x) - f(c)) < epsilon$.

  This differs from continuity iff the same $delta$ works for every point in $S$.

  Uniform continuity obviously implies continuity.
]

#theorem[
  If $f : [a, b] to Reals$ is a continuous function defined on a closed bounded interval, it is uniformly continuous.
]

#lemma[
  If $f : S to Reals$ is uniformly continuous and ${x_n}$ is a Cauchy sequence in $S$, then ${f(x_n)}$ is a Cauchy sequence.
]

#theorem[
  Let $f : (a, b) to Reals$. Then $f$ is uniformly continuous iff it has a right-handed limit at $a$, a left-handed limit at $b$, and the extension of $f$ to the closed interval $[a, b]$ is continuous.
]

== Lipschitz continuity

#definition(title: [Lipschitz continuity])[
  Let $f : S to Reals$ be a function. If there exists $K in Reals$ s.t. for every $x, y in S$, $abs(f(x) - f(y)) < K abs(x - y)$ then $f$ is #defname[Lipschitz continuous].
]

#theorem[
  Lipschitz continuity implies uniform continuity.
]

= Derivatives

#definition(title: [Derivative])[
  Let $f(x)$ be a real-valued function defined on an open interval $(a, b)$, and let $x_0 in (a, b)$. The #defname[derivative] of $f$ at $x_0$ is

  $ (d f)/(d x) (x_0) := f'(x_0) := lim_(x to x_0) (f(x) - f(x_0))/(x - x_0). $

  Iff this limit is defined, the function is #defname[differentiable] at $x_0$.
]

#theorem(title: [Continuity theorem])[
  Let $f$ be defined on $(a, b)$ with $x_0 in (a, b)$. Then, $f$ is differentiable at $x_0$ iff there is a function $f^*$ (which depends on $f$ and on $x_0$) s.t. 
  $ f(x) = f(x_0) + f^*(x)(x - x_0) $
  with $f^*$ defined on $(a, b)$ and continuous at $x_0$, with $f^*(x_0) = f'(x_0)$.

  If $f$ is continuous, $f^*$ can be defined as
  $ f^*(x) := cases(
    (f(x) - f(x_0))/(x - x_0) & "if" x != x_0,
    f'(x_0) & "if" x = x_0.
  ) $
]

#definition(title: [One-sided derivative])[
  Let $f$ be defined on $[a, b)$. The #defname[right-hand derivative] of $f$ at $a$ is
  $ f'_+(a) := lim_(x to a^+) (f(x) - f(a))/(x - a). $

  Let $f$ be defined on $[a, b)$. The #defname[left-hand derivative] of $f$ at $a$ is
  $ f'_-(a) := lim_(x to a^-) (f(x) - f(a))/(x - a). $
]

#definition(title: [Infinite derivatives])[
  Let $f$ be continuous on $[a, b)$. The right-hand derivative of $f$ at $a$ is $+infinity$ iff
  $ lim_(x to a^+) (f(x) - f(a))/(x - a) = +infinity. $

  The definition is similar for left-hand and negative infinite derivatives.
]

#theorem(title: [Sum, product, and quotient rules])[
  Let $f$ and $g$ be functions defined on an interval $(a, b)$, both differentiable at the point $x_0 in (a, b)$. (In particular, the derivatives there cannot be infinite.) Then, the following derivatives exist and take on the following values:
  - $(f plus.minus g)'(x_0) = f'(x_0) plus.minus g'(x_0)$.
  - $(f * g)'(x_0) = f(x_0) g'(x_0) + f'(x_0) g(x_0)$.
  
  - $display((f\/g)'(x_0) = (g(x_0) f'(x_0) - f(x_0) g'(x_0))/(g(x_0)^2))$.
]

#theorem(title: [Chain rule])[
  Let $f : (a, b) to Reals$ and $g : f(a, b) to Reals$. Let $x_0 in (a, b)$ with $f$ differentiable at $x_0$ and $f(x_0)$ contained in the interior of $f(a, b)$, and let $g$ be differentiable at $f(x_0)$. Then, $(g compose f)(x)$ is differentiable at $x_0$, and
  $ (g compose f)'(x_0) = g'(f(x_0)) f'(x_0), $

  or equivalently, 
  $ lr((d g)/(d x) |)_(x_0) = lr((d g)/(d f) |)_(f(x_0)) * lr((d f)/(d x) |)_(x_0). $
]

== Mean value theorem

#theorem[
  Let $f'(c) > 0$ and $f$ continuous in some interval about $c$. Then, there is a $delta > 0$ s.t.:
  - $c < x < c + delta ==> f(c) < f(x)$
  - $c - d < x - c ==> f(x) < f(c)$

  Equivalently, if the derivative is positive, then the function is increasing at that point.

  Similarly, if the derivative is negative, then the function is increasing at that point.
]

#corollary[
  If $f(c)$ is a local min or local max, than $f'(c) = 0$.
]

#definition(title: [Critical point])[
  A point where the derivative of the function is zero.
]

#theorem(title: [Rolle's theorem])[
  Let $f(x)$ be continuous on $[a, b]$ and differentiable on $(a, b)$, s.t. $f(a) = f(b)$. Then, there exists $c in (a, b)$ for which $f'(c) = 0$.
]

#theorem(title: [Mean value theorem])[
  Let $f$ be continuous on $[a, b]$ and differentiable on $(a, b)$. Then, there exists some point $c in (a, b)$ for which 
  $ f'(c) = (f(b) - f(a))/(b - a). $
]

#theorem(title: [Cauchy's mean value theorem])[
  Let $f(t)$ and $g(t)$ be two functions continuous on $[a, b]$ and differentiable on $(a, b)$. Then, there exists some point $c in (a, b)$ for which
  $ f'(c)(g(b) - g(a)) = g'(c)(f(b) - f(a)). $
]

#theorem[
  Let $f(x)$ be continuous on $[a, b]$ and differentiable on $(a, b)$. Then:
  - $f'(x) > 0$ for all $x in (a, b) <==> f$ is strictly increasing
  - $f'(x) < 0$ for all $x in (a, b) <==> f$ is strictly decreasing
  - $f'(x) = 0$ for all $x in (a, b) <==> f$ is constant

  Let $g(x)$ also be continuous on $[a, b]$ and differentiable on $(a, b)$. Then:
  - $g'(x) = f'(x)$ for all $x in (a, b) <==> f(x) - g(x)$ is constant
]

#theorem[
  Let $f(x)$ be continuous on $(a, b]$ and differentiable on $(a, b)$, with $lim_(x to b^-) f'(x) = L$. Then, $f$ is left-hand differentiable at $b$, and $f'_- (b) = L$.

  A similar theorem exists for right-hand derivatives.
]

#theorem(title: "Darboux theorem")[
  Let $f(x)$ be a function that is differentiable on $[a, b]$. Let $y$ be a value s.t. $f'(a) < y < f'(b)$ or $f'(a) > y > f'(b)$. Then there is some $c in (a, b)$ s.t. $f'(c) = y$.
]

#corollary[
  - $f'$ cannot change signs without going through zero.
  - If $f'(x) != 0$ for any $x$, then $f$ is monotonic.
  - If $f'$ itself is monotonic then it must be continuous:
    - the only kinds of discontinuities of monotonic functions are jumps
    - derivatives can't make jumps
]

== Taylor series

#theorem(title: [Taylor's formula with the Lagrange form of the remainder])[
  Let $f : (a, b) to Reals$ have $n + 1$ derivatives on the interval $(a, b)$, and let $x_0$ be a point in $(a, b)$. Then, for any point $y$ in $(a, b)$ #defname[Taylor's formula] states that
  $ f(y) = p_n (y) + R_n (y; x_0). $

  We define the #defname[$n$th Taylor polynomial centered at $x_0$] as:
  $ p_n (x) := sum_(k = 0)^n (f^(k)(x_0))/(k!) (x - x_0)^k. $

  We define the #defname[Langrange form of the remainder] as:
  $ R_n(x; x_0) := (f^(n+1)(c)(y - x_0)^(n + 1))/((n+1)!) $
  for some $c$ between $y$ and $x_0$ [this theorem does not specify which $c$ this is].
]

#definition(title: [Taylor series])[
  If $f$ is infinitely differentiable, its #defname[Taylor series] around $x_0$ is the sequence of Taylor polynomials centered at $x_0$:

  $ p_1, p_2, p_3, ... $

  Ideally, this would converge to some nice function, and the error $R_n (x; x_0)$ would converge to $0$. But there are many functions for which this is not the case; some such functions are not really that nasty. 
]

= Integrals

== Partitions

#definition(title: [Partition])[
  A #defname[partition] $P$ of $[a, b]$ is a finite set of points, ${x_0, x_1, ..., x_n}$ with $a = x_0 < x_1 < dots.c < x_n = b$. The $k$th interval of the partition is $[x_(k - 1), x_k]$, with width $Delta x_k := x_k - x_(k - 1)$.
]

#definition(title: [Norm/mesh])[
  The #defname[norm] or #defname[mesh] of a partition is the width of its largest interval, denoted
  $ norm(P) := max{Delta x_k : k <= n}. $
]

#definition(title: [Refinement])[
  $tilde(P)$ is a #defname[refinement] of $P$ iff $P subset.eq tilde(P)$.
]

== Darboux integral

#definition(title: [Darboux sum])[
  Let $f : [a, b] to Reals$ be bounded and $P$ a partition of $[a, b]$. Then, define
  $ m_k &:= inf{f(x) : x_(k - 1) <= x <= x_k} \
  M_k &:= sup{f(x) : x_(k - 1) <= x <= x_k}. $
  
  Define the #defname[upper] and #defname[lower Darboux sums], respectively, as
  $ L(P, f) &:= sum_(k=1)^n m_k Delta x_k \
  U(P, f) &:= sum_(k=1)^n M_k Delta x_k. $
]

#definition(title: [Upper and lower Darboux integrals])[
  Let $f : [a, b] to Reals$ be bounded. Then, define the #defname[upper] and #defname[lower Darboux integrals] as follows:
  $ overline(int_a^b) f(x) d x &:= inf{U(P, f) : P "is a partiton of" [a, b]} \
  underline(int_a^b) f(x) d x &:= sup{L(P, f) : P "is a partiton of" [a, b]}. $
]

#definition(title: [Darboux integrability])[
  If $f : [a, b] to Reals$ is bounded, and $underline(int_a^b) f(x) d x = overline(int_a^b) f(x) d x$, then we say $f$ is #defname[Darboux-integrable] ($f in Riemann[a, b]$), and we define $int_a^b f(x) d x$ to be the common value of the lower and upper Darboux integral.
]

== Riemann integral

#definition(title: [Riemann sum])[
  Let $f : [a, b] to Reals$ be bounded and $P$ a partition of $[a, b]$.

  For each interval $[x_(i - 1), x_i]$, select any $t_i$ in that interval. Then, the #defname[Riemann sum] of $f$ under this selection of $t_i$ is
  $ sum_(i = 1)^n f(t_i) Delta x_i. $
]

#definition(title: [Riemann integrability])[
  $f$ is #defname[Riemann-integrable] ($f in Riemann[a, b]$) iff there exists some number $I$ s.t. for every $epsilon > 0$, there exists a partition $P_0$ s.t. for every refinement $P$ of $P_0$ and every choice of $t_i$ on $P$, the corresponding Riemann sum is within $epsilon$ of $I$.
]

#theorem[
  Riemann integrability is equivalent to Darboux integrability.
]

== Integrability

#theorem[
  Let $f : [a, b] to Reals$ be bounded. Then, $f$ is Darboux-integrable iff for every $epsilon > 0$, there exists a partition $P$ s.t. $U(P, f) - L(P, f)$.
]

#theorem[
  Let $f : [a, b] to Reals$ be bounded and monotonic. Then, $f in Riemann[a, b]$.
]

== Core properties of the integral

#see[35 More Integral Basics]

The integral operator is additive, linear, and monotonic:

#lemma[
  Let $a < b < c$ and $f : [a, c] to Reals$ be a bounded function. Then, both the upper and lower Darboux integrals are additive over the subintervals. That is,
  $ underline(int_a^c) f &= underline(int_a^b) f + underline(int_b^c) f \
  overline(int_a^c) f &= overline(int_a^b) f + overline(int_b^c) f. $
]

#theorem(title: [Additivity])[
  Let $a < b < c$ and $f : [a, c] to Reals$ be a bounded funcction. Then,

  $ f in Riemann[a, c] <==> f in Riemann[a, b] "and" f in Riemann[b, c], $
  and if $f$ is integrable on the whole interval then
  $ int_a^c f = int_a^b f + int_b^c f. $
]

#lemma[
  If $f$ and $g$ are bounded functions on $[a, b]$, then

  $ overline(int_a^b) (f + g) <= overline(int_a^b) f + overline(int_a^b) g. $
]

#theorem(title: [Linearity])[
  Let $f, g in Riemann[a, b]$, and $alpha$ any real constant. Then,
  $ int_a^b alpha f(x) + g(x) d x = alpha int_a^b f(x) d x + int_a^b g(x) d x. $
]

#theorem(title: [Monotonicity])[
  Let $f$ and $g$ be bounded functions on $[a, b]$. Assume $f(x) <= g(x)$ for all $x in [a, b]$. Then, $underline(int) f < underline(int) g$ and $overline(int) f < overline(int) g$. If both are in $Riemann[a, b]$ then $int f < int g$.
]

== Additional properties of the integral

#see[34 Working with Integrals]

#theorem[
  Let $f in [a, b]$. Let $f(x) in [m, M]$ for all $x in [a, b]$. Then,
  $ m(b - a) <= int_a^b f(x) d x <= M(b - a). $
]

#theorem(title: [Integral of a constant])[
  $ int_a^b c d x = c(b - a). $
]

#theorem(title: [Integral of a step function])[
  Let
  $ f(x) = cases(
    r & "for" x < c,
    s & "for" x = c,
    t & "for" x > c,
  ), $

  with $c in [a, b]$ and $f : [a, b] to Reals$.

  Then,

  $ int_a^b f(x) d x = r(c - a) + t(b - c). $
]

#definition[
  $ int_a^b f(x) d x := -int_b^a f(x) d x. $
]

== Integrals of continuous functions

#see[36 Integrals of Continuous Functions]

#lemma[
  A bounded function that has only finitely many discontinuities is integrable.
]

#lemma[
  Let $f : [a, b] to Reals$ be bounded. Let ${a_n} to a$ and ${b_n to b}$ be sequences in $[a, b]$, with $a_n < b_n$ for all $n$. Then, if $f in Riemann[a_n, b_n]$ for all $n$, then $f in Riemann[a, b]$ and $int_a^b f = lim_(n to infinity) int_(a_n)^(b_n) f$.

  Essentially, bounded funtions need only be integrable inside the interval to be integrable on the entire interval.
]

#theorem[
  Continuous functions are integrable.
]

== Fundamental theorem of calculus

#see[37 Fundamental Theorem of Calculus]

#theorem(title: [First Fundamental Theorem of Calculus])[
  Let $F : [a, b] to Reals$ be continuous and differentiable\* on $(a, b)$, with $F' in Riemann[a, b]$. Then,
  $ int_a^b F'(x) d x = F(b) - F(a). $

  \*$F$ may have finitely many points where it is not differentiable. It must be continuous over the whole interval.
]

#theorem(title: [Second Fundamental Theorem of Calculus])[
  Let $f in Riemann[a, b]$. Define $F(x) := int_a^x f$. Then, $F$ is continuous on $[a, b]$, and if $f$ is continuous at $c$, then $F$ is differentiable at $c$ and $F'(c) = f(c)$.
]

#theorem(title: [u-substitution])[
  Let $f : [c, d] to Reals$ be continuous and $g : [a, b] subset [c, d]$ continuously differentiable. Then,
  $ int_a^b f(g(x)) g'(x) d x = int_(g(a))^(g(b)) f(u) d u. $

  Note that in this case, $u = g(x)$ and $d u = g'(x) d x$.
]

== Logarithm and exponential

#see[38 Logs and Exponentials]

#definition(title: [Natural logarithm])[
  $ ln(x) := int_1^x 1/t d t. $
]

#theorem[
  $ln(x)$ is the unique function that satisfies:
  - $ln(1) = 0$
  - $ln$ is differentiable and $L'(x) = 1/x$
  - $ln(x y) = ln(x) + ln(y)$
  - $ln$ is strictly increasing; it's domain is $(0, infinity)$ and its image is $Reals$
  - If $q$ is rational, then $ln(x^q) = q ln(x)$
]

#definition(title: [Logarithm])[
  $ log_b (a) := ln(a)/ln(b) . $

  Thus,
  $ ln(x) = log_e (x). $
]

#definition(title: [Natural exponent])[
  $ exp(x) := ln^(-1) (x). $

  Equivalently, $exp$ is the unique solution to the initial-value differential equation problem
  $ y' = y, y(0) = 1. $

  Equivalently,
  $ exp(x) := sum_(n = 0)^infinity (x^n)/(n!). $
]

#theorem[
  $exp(x)$ is the unique function that satisfies:
  - $exp(0) = 1$
  - $exp(x + y) = exp(x) exp(y)$
  - For any rational $q$, $exp(q x) = exp(x)^q$
  - $exp(x)$ is strictly increasing and bijective from $Reals$ to $(0, infinity)$
  - $display(lim_(x to infinity) exp(x) = infinity)$
  - $display(lim_(x to -infinity) exp(x) = 0)$
  - $display(d/(d x) exp(x) = exp(x))$
]

#definition(title: [Exponent])[
  Let $x > 0$ and $y in Reals$. Then,
  $ x^y := exp(y ln(x)). $

  Thus,
  $ exp(x) = e^x. $
]

= Sequences of functions

== Pointwise convergence

#definition(title: [Pointwise convergence])[
  Let ${f_1, f_2, ...}$ be a sequence of functions. Let $S$ be the set of all points $x$ for which the sequence ${f_1 (x), f_2 (x), ...}$ converges. Then, $S$ is the domain of the limit function 
  $ f(x) := lim_(n to infinity) f_n (x). $

  ${f_n}$ #defname[converges pointwise] to $f$ on $S$.
]

== Uniform convergence

#definition(title: [Uniform convergence])[
  Let ${f_n}$ be a sequence of functions. ${f_n}$ #defname[converges uniformly] to $f$ on $S$ iff for every $epsilon > 0$ there exists $N$ s.t. $n > N$ implies $abs(f(x) - f_n (x)) < epsilon$ for all $x in S$.
]

#definition[
  Let ${f_n}$ be a sequence of functions on $S$. Let $M > 0$ be a constant so that $abs(f_n(x)) <= M$ for all $x$ and $n$. Then, ${f_x}$ is #defname[uniformly bounded] by $M$ by $S$.
]

#theorem[
  Let $f_n to f$ uniformly on $S$ and let each $f_n$ be bounded. Then, $f$ is bounded and the sequence ${f_n}$ is uniformly bounded on $S$.
]

#definition(title: [Uniform norm])[
  Let $f$ be a bounded function on domain $S$. Then, define the #defname[uniform norm] or #defname[infinity norm] of $f$ on $S$ is

  $ norm(f)_infinity = norm(f)_u := sup{abs(f(x)) : x in S}. $
]

#theorem[
  A sequence of bounded functions $f_n$ converges uniformly to $f$ iff
  $ lim_(n to infinity) norm(f_n - f)_infinity = 0. $
]

#theorem[
  Let ${f_n}$ be a sequence of functions. Then there exists a function $f$ s.t. $f_n to f$ uniformly iff the sequence satisfies the #defname[Cauchy condition]: for every $epsilon > 0$ there exists $N$ s.t. if $m, n > N$, then $abs(f_n (x) - f_m (x)) < epsilon$ for all $x$.
]

#definition[
  A series converges uniformly iff its sequence of partial sums converges uniformly.
]

#theorem(title: [Weierstraß $M$-test])[
  Let $M_n$ be a sequence of nonnegative numbers s.t. $abs(f_n (x)) <= M_n$ for all $x$ and $n$. Then, $sum f_n$ converges uniformly if $sum M$ converges.
]

== Continuity, integrability, and differentiability of limit functions

#see[41 Interchanging limits]

#theorem(title: [Interchanging limits])[
  When $f_n to f$ uniformly, then
  $ lim_(x to a) f(x) = lim_(x to a) lim_(n to infinity) f_n (x) = lim_(n to infinity) lim_(x to a) f_n (x) = lim_(n to infinity) f_n (a) = f(a). $
]

#theorem[
  Let ${f_n}$ be a sequence of continuous functions $S to Reals$, where $S$ is some domain. If the sequence converges uniformly to a function $f$, then $f$ is also continuous.
]

#theorem[
  Let ${f_n}$ be a sequence of integrable functions on $[a, b]$ that converges uniformly to $f$. Then $f$ is integrable, and $ int_a^b f = lim_(n to infinity) int_a^b f_n. $
]

#theorem[
  Let each term of ${f_n}$ be differentiable at each point of $(a, b)$ and assume that these derivatives converge $f'_n to g$ uniformly on $(a, b)$. Further, assume that there is at least one point $x_0 in (a, b)$ s.t. ${f_n (x_0)}$ converges. Then,
  - There is a function $f$ s.t. $f_n to f$ uniformly on $(a, b)$, and
  - For each point in $x$ in $(a, b)$, the derivative $f'(x)$ exists and equals $g(x)$.
]

#theorem[
  - The power series of a function converges uniformly upon its interval of convergence.
  - Inside the interval of convergence, the power series represents a continuous function.
  - The function is integrable, and the integral of the sum of the series is the sum of the integrals of the terms
  - The derivatives of the power sums converge uniformly, and the partial sums of the series add to $f(x_0)$ at $x_0$, so the derivative theorem's conditions are satisfied, and you can differentiate a power series term-by-term to obtain the derivative of the function to which it converges.
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
