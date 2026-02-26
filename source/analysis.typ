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
