#import "@local/ethan-standard-style:0.1.0": *
#show: ekactl-style.with(
  section-number: 4,
  title: "[v2.6] Real analysis"
)

#import "@preview/cetz:0.4.2"

#set text(size: 10pt)

#let seeline(it) = []

#let see(it) = []

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

#let infty = math.infinity

= Basics

#definition(title: [Injective])[
  A function $f$ is #defname[injective] or #defname[one-to-one] iff:
  - $f(a) = f(b) => a = b$, or equiv.
  - $a != b => f(a) != f(b)$
]

#definition(title: [Surjective])[
  A function $f : A to B$ is #defname[surjective] or #defname[onto] iff:
  - $f(A) = B$ (its image is its codomain), or equiv.
  - for every $b in B$ there exists $a in A$ s.t. $f(a) = b$
]

#theorem[
  Composition of relations preserves the following properties: function, injective, surjective, continuous.
]

= Fields and order

== Fields

#definition(title: [Field])[
  A #defname[field] $FF$ is any set with relations $+$, $*$, and $=$ which satisfies
  - If $x$ and $y$ are in $FF$, so are both $x + y$ and $x y$.
  - $x + y = y + x$ and $x y = y x$.
  - $(x + y) + z = x + (y + z)$ and $(x y) z = x (y z)$.
  - $x(y + z) = x y + x z$.
  - $w = x "and" y + z ==> w + y = x + z "and" w y = x z$.
  - Given $x, y in FF$, there exists $z in FF$ s.t. $x + z = y$ (i.e. all addition problems have solutions).
  - There exists some number in $FF$ which is not equal to $0$. If $x, y in FF$ s.t. $x != 0$, then there exists a real number $z$ s.t. $x z = y$. This $z$ is denoted $(y\/x)$.
  - $=$ is an equivalence relation.
]

== Order

#definition(title: [Order])[
  A relation $<$ that satisfies the [total] order axioms:
  - *Trichotomy:* $x < y$, $x = y$, xor $x > y$.
  - *Transitivity*: If $x < y$ and $y < z$, then $x < z$.
]

#definition(title: [Dedekind completeness])[
  An ordered set is #defname[complete], #defname[Dedekind-complete], or has the #defname[least upper bound property] iff:
  - every subset of the set that has an upper bound has a supremum, or equivalently
  - every subset of the set that has a lower bound has an infimum.
]

== Ordered fields

#definition(title: [Ordered field])[
  A field with an order satisfying
  - *Transl.:* If $x < y$, then $x + z < y + z$ for all $z$.
  - *Pos. closure:* If $x>0$ and $y>0$, then $x y > 0$.
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

#theorem(title: [Archimedean property])[
  The reals are comensural: for any $x, y in Reals$ with $x > 0$, then there is a positive integer $n$ s.t. $n x > y$.
]

== Topology of the reals

#definition(title: [Open set])[
  The following are #defname[open]: the empty set, open intervals, unions of open sets, finite intersections of open sets, the whole space.

  A set is #defname[closed] if it is the complement of an open set.

  The collection of closed sets is closed under finite union and arbitrary intersection.
]

#definition(title: [Continuity])[
  Let $f : X to Y$ be a function from topological space $X$ to topological space $Y$. Then, $f$ is continuous iff $f^(-1)(A) subset X <=> A$ is open in $Y$.
]

== Absolute values

#theorem(title: [Triangle Inequality])[
  For any $x, y in Reals$ or ${x_n} subset Reals$, or integrable $f$:
  $ abs(x + y) &<= abs(x) + abs(y) \
  abs(x - y) &<= abs(x) + abs(y) \
  abs(abs(x) - abs(y)) &<= abs(x - y) \
  abs(x_1 + x_2 + dots.c + x_n) &<= abs(x_1) + abs(x_2) + dots.c + abs(x_n) \
  abs(int_a^b f(x) d x) &<= int_a^b abs(f(x)) d x $
]

= Sequences

#definition(title: [Limit of a sequence])[
  Let ${x_n}$ be a sequence. $L$ is the #defname[limit], denoted $lim_(n to infinity) x_n$, of the sequence iff for every $epsilon > 0$ there exists $N$ s.t. whenever $n > N$, $abs(x_n - L) < epsilon$.
]

Note - monotonic does not require strictly increasing/decreasing, it can be stable at some points.

#theorem[
  A bounded monotonically increasing sequence converges to its supremum.

  A bounded monotonically decreasing sequence converges to its infimum.
]

#theorem[
  Every nonempty bounded subset of the reals has an increasing sequence converging to its supremum and a decreasing sequence converging to its infimum.
]

== Subsequences

#theorem[
  The following are equivalent:
  1. The sequence ${x_n}$ converges.
  2. The $t$-tail ${x_(n + t)}$ converges for every $t$.
  3. There is some $t$ for which the $t$-tail converges.
]

== Limit properties and theorems

#theorem[
  Let ${x_n} to x$ and ${y_n} to y$, s.t. $x_n <= y_n$ for all $n$. Then, $x <= y$.
]

#theorem(title: [Squeeze Theorem])[
  Let ${a_n}$, ${b_n}$, and ${c_n}$ be sequences s.t. $a_n <= b_n <= c_n$ for all $n$ and $a_n to L$ and $c_n to L$. Then $b_n to L$.
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

== Bolzano-Weierstrass

#theorem(title: [Bolzano-Weierstrass for Sequences])[
  Every bounded sequence of real numbers (or in $Reals^n$) has a convergent subsequence.

  In topology terms, a subset of $Reals^n$ is sequentially compact (every sequence has a convergent subsequence) and compact (every open cover has a finite subcover) iff it is closed and bounded.
]

#definition(title: [Open ball])[
  Let $x in Reals^n$. The ball $B(x, epsilon)$ of radius $epsilon$ about $x$ is defined as

  $ B(x, epsilon) := {y in Reals^n : abs(x - y) < r}. $
]

#theorem(title: [Bolzano-Weierstrass theorem])[
  Every bounded infinite subset of $Reals^n$ has an accumulation point.
]

#theorem(title: [Cantor Intersection Theorem])[
  Let $S_1, S_2, ...$ be a sequence of bounded closed subsets of $Reals^n$ nested as follows: $S_1 supset S_2 supset dots.h.c$. Then, the intersection $S_1 inter S_2 inter dots.h.c$ is closed and nonempty.
]

== Cauchy sequences

#definition(title: [Cauchy sequence])[
  A sequence ${x_n}$ is called #defname[Cauchy sequence] iff for every $epsilon > 0$, there exists $N$ s.t. for all $m, n > n$, $|x_n - x_m| < epsilon$.

  In short, beyond a certain term, all the following terms are arbitrarily close.

  Every Cauchy sequence is bounded. A sequence of reals converges iff it is a Cauchy sequence.
]

= Series

== Basic convergence tests

#theorem(title: [$n^"th"$ term test for divergence])[
  If $sum x_n$ converges, then $x_n to 0$.

  Equivalently, if $x_n to.not 0$, $sum x_n$ diverges.
]

#theorem(title: [Linearity of series])[
  Let $sum x_n = x$ and $sum y_n = y$. Then, $sum (x_n + y_n) = x + y$.

  For any $c in Reals$, $sum (c x_n) = c x$.
]

#theorem(title: [p-series])[
  $display(sum_(n=1)^infinity 1/n^p)$ converges iff $p > 1$.
]

== Absolute convergence

#lemma[
  If $x_n >= 0$ for all $n$, then $sum x_n$ converges iff the sequence of partial sums is bounded above. Furthermore, each partial sum is less than or equal to the sum.
]

#definition(title: [Absolute convergence])[
  Iff $sum abs(x_n)$ converges, then $sum x_n$ #defname[absolutely converges]. If $sum abs(x_n)$ diverges, but $sum x_n$ converges, then $sum x_n$ #defname[conditionally converges].
]

#theorem(title: [Comparison test for positive series])[
  Let $sum x_n$ and $sum y_n$ be series with $0 <= x_n <= y_n$ for all $n$. Then:
  1. If $sum y_n$ converges, then $sum x_n <= sum y_n$ ($sum x_n$ converges).
  2. If $sum x_n$ diverges, so does $sum y_n$.
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
  $x$ is a #defname[accumulation point] of $S$ iff 
  - every ball $B(x, epsilon)$ contains a point of $S$ other than $x$, or, equivalently,
  - there is a sequence of points in $S - {x}$ converging to $x$.
]

#definition(title: [Limit])[
  Let $S$ be a subset of $Reals$ and $c$ be an accumulation point of $S$. Let $f : S to Reals$ be a function.

  The #defname[limit] of $f(x)$ as $x to c$ is $L$ iff for each $epsilon > 0$, there exists a $delta > 0$ s.t. whenever $x in S - {c}$ and $abs(x - c) < delta$, then $abs(f(x) - L) < epsilon$.
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

  The #defname[Taylor series] is the limit of the Taylor polynomials.

  We define the #defname[Langrange form of the remainder] as:
  $ R_n(x; x_0) := (f^(n+1)(c)(y - x_0)^(n + 1))/((n+1)!) $
  for some $c$ between $y$ and $x_0$ [this theorem does not specify which $c$ this is].
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

#theorem(title: [Additivity])[
  Let $a < b < c$ and $f : [a, c] to Reals$ be a bounded funcction. Then,

  $ f in Riemann[a, c] <==> f in Riemann[a, b] "and" f in Riemann[b, c], $
  and if $f$ is integrable on the whole interval then
  $ int_a^c f = int_a^b f + int_b^c f. $
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

#theorem(title: [Integration by parts])[
  If $u$ and $v$ are integrable and have continuous derivatives,
  $ int_a^b u(x) v'(x) d x = [u(x) v(x)]_a^b - int_a^b u'(x) v(x) d x. $
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
  $ lim_(x to a) f(x) = lim_(x to a) lim_(n to infinity) f_n (x) \
  = lim_(n to infinity) lim_(x to a) f_n (x) = lim_(n to infinity) f_n (a) = f(a). $
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
  Upon its interval of convergence:
  - The power series of a function converges uniformly to a continuous integrable
  - The integral of the sum of the series is the sum of the integrals of the terms
  - The derivatives of the power sums converge uniformly
  - The partial sums of the series add to $f(x_0)$ at $x_0$
  - Can differentiate a power series term-by-term to obtain the derivative of the function to which it converges.
]

= Picard's theorem
#definition(title: [Lipschitz in the second variable])[
  $F : Reals^2 to Reals$ is #defname[Lipschitz in the second variable] iff there exists $L in Reals$ s.t.

  $ abs(F(x, y) - F(x, z)) <= L abs(y - z) \
  "for all" y, z in J "and" x in I. $
]

#theorem(title: [Picard's theorem])[
  Let $I, J in Reals$ be closed bounded intervals with $(x_0, y_0) in I ior times J ior$.

  If $F : I times J to Reals$ is continuous and Lipschitz in the second variable, then there exists $h > 0$ s.t. $[x_0 - h, x_0 + h] subset I$ and a unique differentiable function $f : [x_0 - h, x_0 + h] to J$ s.t.

  $ f'(x) = F(x, f(x)) #h(7mm) f(x_0) = y_0. $

  *In short,* if $F$ is continuous and Lipschitz in the second variable, the initial value problem has a unique solution on some interval around $x_0$.

  The unique solution can be constructed via the following procedure:
  1. Define $f_0 (x) := y_0$.
  2. For each $k in Naturals^+$, define the #defname[$k$th Picard iterate]:
  $ f_k (x) := y_0 + int_(x_0)^x F(t, f_(k - 1) (t)) d t $
  3. The sequence of Picard iterates converges uniformly to the solution $f$.
]

= Lebesgue integrability condition

== Oscillation

#definition(title: [Oscillation])[
  Let $f : Reals to Reals$ and $S subset Reals$. The #defname[oscillation] of $f$ on $S$ is defined as

  $ omega_f (S) := sup{f(S)} - inf{f(S)}. $

  If the supremum or infimum does not exist, it is defined as $+ infinity$.

  The #defname[oscillation] of $f$ at the point $x in S$ is defined as
  $ lim_(epsilon to 0) omega_f (S inter (x - epsilon, x + epsilon)). $
]

#theorem[
  $f$ is continuous at $x_0$ iff the oscillation of $f$ at $x_0$ is zero.
]

== Measure

#definition(title: [Measure])[
  A #defname[measure] is a function that takes a subset $S$ of the reals, and returns its "size" denoted $abs(S)$, following the following properties:
  - $0 <= abs(S) <= infty$.
  - $abs(emptyset) = 0$.
  - $S' := {x + a : x in S} ==> abs(S') = abs(S)$.
  - $abs((0, 1)) = abs([0, 1]) = 1$.
  - #defname[Countably additive]: If ${S_i}$ is a countable collection of disjoint sets, $abs(union S_i) = sum_i abs(S_i)$ .
]

=== Lebesgue outer measure

#definition(title: [Lebesgue outer measure])[
  Cover the set with a countable number of disjoint open intervals, and sum their totals. Take the infimum of all such coverings.

  $ lambda^* (S) := inf { sum(b_i - a_i) {(a_i, b_i)}_(i in Integers^+) "is such a cover"}. $
]

#theorem[
  - Every countable subset of $Reals$ has [Lebesgue outer] measure 0.
  - A subset of a measure 0 set also has measure 0.
  - Any countable union of measure 0 sets has measure 0.
]

== Lebesgue integrability condition

#theorem(title: [Lebesgue Integrability Condition])[
  $f : S to Reals$, where $S$ is compact (closed and bounded), is Riemann-integrable iff it is bounded and its set of discontinuities has measure 0.
]

#corollary[
  Let $f : [a, b] to [c, d]$ be integrable and $g : [c, d] to Reals$ continuous. Then, $g compose f$ is integrable.
]

= Counterexamples & Constructions

== Pathological Functions

#let P(n, body) = [*P#n.* #body]

#P[1][
  *Dirichlet function*: $D(x) = 1$ if $x in QQ$, $0$ if $x in.not QQ$.
  _Properties_: bounded; nowhere continuous (every interval contains both rationals
  and irrationals); NOT integrable ($U(P, D) = 1$, $L(P, D) = 0$ for any partition $P$);
  can be written as $D(x) = lim_(m -> infinity) (lim_(n -> infinity) cos^(2n)(m! pi x))$.
]

#P[2][
  *Thomae's function* (Modified Dirichlet): $f(p/q) = 1/q$ (lowest terms),
  $f("irrational") = 0$.
  _Properties_: bounded; continuous at every irrational (hence almost everywhere);
  discontinuous at every rational; Riemann integrable with $integral_0^1 f = 0$;
  discontinuities are countable (measure 0). Shows the Lebesgue Integrability
  Condition in action.
]

#P[3][
  $f(x) = x sin(1/x)$, $f(0) = 0$.
  _Properties_: continuous everywhere; uniformly continuous on $[0, 1]$;
  NOT Lipschitz at $0$ (oscillates arbitrarily steeply); NOT differentiable at $0$.
]

#P[4][
  $f(x) = x^2 sin(1/x)$, $f(0) = 0$.
  _Properties_: differentiable everywhere; $f'(0) = 0$;
  $f'(x) = 2x sin(1/x) - cos(1/x)$ for $x != 0$;
  $f' arrow.not 0$ as $x -> 0$, so $f'$ is NOT continuous at $0$
  ($f$ is differentiable but $f' in.not C^1$).
]

#P[5][
  $f_n(x) = x^n$ on $[0, 1]$.
  Pointwise limit: $f(x) = 0$ for $x < 1$, $f(1) = 1$ (discontinuous).
  Convergence is NOT uniform: $norm(f_n - f)_infinity = 1$ for all $n$.
  Shows the uniform limit of continuous functions need not hold under pointwise convergence.
]

#P[6][
  *Weierstraß function*: $W(x) = sum_(n=0)^infinity (1/2)^n cos(3^n pi x)$.
  Continuous everywhere, nowhere differentiable
  ($norm(f_n - f)_infinity -> 0$ by the Weierstraß $M$-test, but derivatives blow up).
  Limit of smooth functions can fail to be smooth.
]

#P[7][
  $f(x) = sqrt(x)$ on $[0, 1]$.
  Uniformly continuous (compact domain and continuous).
  NOT Lipschitz at $0$: $abs(sqrt(x) - 0) / abs(x - 0) = 1/sqrt(x) -> infinity$.
  Shows uniform continuity $arrow.double.not$ Lipschitz.
]

#P[8][
  $f(x) = 1/x$ on $(0, 1)$.
  Continuous. NOT uniformly continuous ($delta$ must depend on position;
  Cauchy sequences map to non-Cauchy sequences). NOT bounded.
  Shows $f : (a, b) -> RR$ is uniformly continuous if and only if it extends continuously to $[a, b]$.
]

#P[9][
  $f(x) = abs(x)$.
  Uniformly continuous; Lipschitz (constant $K = 1$);
  NOT differentiable at $0$.
  Shows Lipschitz $arrow.double.not$ differentiable.
]

#P[10][
  If $abs(f(x) - f(y)) <= (x - y)^2$ for all $x, y$, then
  $f'(x) = lim_(h -> 0) (f(x + h) - f(x))/h = 0$ everywhere,
  so $f$ is constant.
]

#P[11][
  *Alternating harmonic series*: $sum (-1)^n / n$ converges
  (by the alternating series test) but NOT absolutely (since $sum 1/n$ diverges).
  Any real number can be achieved by rearrangement (Riemann Rearrangement Theorem).
]

#P[12][
  *Topologist's sine curve*: $f(x) = sin(1/x)$ on $(0, 1]$.
  _Properties_: continuous on $(0, 1]$; NOT uniformly continuous on $(0, 1]$. Differentiable on $(0, 1]$; NOT differentiable at $0$. Integrable on $[0, 1]$ (with arbitrary value of $f(0)$).
]

== Property Constructions

- *Continuous, not uniformly continuous*:
  $f(x) = x^2$ on $RR$; or $sin(1/x)$ on $(0, 1]$.

- *Uniformly continuous, not Lipschitz*:
  $f(x) = sqrt(x)$ on $[0, 1]$.

- *Lipschitz, not differentiable*:
  $f(x) = abs(x)$ (constant $K = 1$).

- *Pointwise convergent, not uniformly convergent*:
  $f_n(x) = x^n$ on $[0, 1]$.

- *Uniformly convergent, but derivatives may not converge*:
  $f_n(x) = sin(n x)/n -> 0$ uniformly, but $f_n'(x) = cos(n x) arrow.not 0$.

- *Bounded, not integrable*:
  Dirichlet function $D(x)$.

- *Integrable, not continuous (even with dense discontinuities)*:
  Thomae's function.

- *Integrable $f$, injective $g$, but $f compose g$ not integrable*:
  Take $f$ = Thomae (discontinuous on $QQ$) and $g$ a bijection mapping
  irrationals to rationals (e.g. Cantor-based);
  $f compose g$ is $0$ on irrationals, $1/q$ on images of rationals ---
  can be made non-integrable.

- *Sequence with $limsup != liminf$*:
  ${(-1)^n}$: $limsup = 1$, $liminf = -1$.

- *Limit comparison test failure*:
  $sum 1/n$ and $sum 1/n^2$: ratio $-> infinity$, both diverge/converge differently ---
  shows the limit comparison test requires $0 < L < infinity$.

== Quick Reference: Implications

Functions:

- Lipschitz $=>$ Uniformly continuous $=>$ Continuous
- Differentiable $=>$ Continuous $=>$ Integrable
- Continuous + compact domain $=>$ Uniformly continuous

Sequences:
- Uniformly convergent $=>$ Pointwise convergent
- Absolutely convergent $=>$ Convergent
- Closed $+$ bounded $<==>$ Sequentially compact

== Contents

#outline(title: none)
