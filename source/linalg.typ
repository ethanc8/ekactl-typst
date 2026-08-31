#import "@local/ethan-standard-style:0.1.0": *
#show: ekactl-style.with(
  section-number: 6,
  title: "Linear algebra (old)"
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

#let Riemann = $cal(R)$

#let card = [card]

#let int = math.integral
#let oint = math.integral.cont
#let iint = math.integral.double
#let oiint = math.integral.surf
#let iiint = math.integral.triple
#let oiiint = math.integral.vol
#let iiiint = math.integral.quad

#let partial = math.upright(math.partial)
#let bound = partial // boundary


#let Derivative = $upright(D)$

#set math.vec(delim: "[")
#set math.mat(delim: "[")

#let infty = math.infinity

#let vn = math.arrow // vec name

#let cross = math.times

#let detmat(..rows) = math.mat(..rows, delim: "|")

#let grad = math.nabla

#let Jacobian = $upright(J)$
#let transpose = $upright(T)$
#let Hessian = $upright(H)$

#let include-non-tested-content = true

#let non-tested-content(x) = x

#let div = math.op("div")
#let curl = math.op("curl")

Let $F = Reals$ or $F = Complex$.

= Linear equations

#definition(title: [Linear equation])[
  An equation that can be written in the form
  $ sum_k a_k x_k = y $
  where all $a_k in F$ and $y in F$.
]

#definition(title: [Solution to a linear equation])[
  The solution to a linear equation is a set ${ s_k }$ such that $sum_k a_k s_k = y$, i.e. substituting $x_k = s_k$ results in the equation being true.
]

#definition(title: [Linear system])[
  A set of linear equations.

  Let $m$ be the number of linear equations in the system. Let $n$ be the number of variables in the system. Then the $j$th equation can be written as
  $ sum_(k=1)^n A_(j k) x_k = y_j $

  Let:
  $ A = mat(A_11, dots.c, A_(1 n); dots.v, dots.down, dots.v; A_(m 1), dots.c, A_(m n))
    quad
    X = vec(x_1, dots.v, x_n)
    quad
    Y = vec(y_1, dots.v, y_m) $

  Then the system can be written as $A X = Y$.
]

#definition(title: [Consistent linear system])[
  A system that has at least one solution.
]

#definition(title: [Linear combination])[
  The linear combination of the equations of a linear system is a linear equation formed by multiplying each equation by $c_j$ where $c_j in F$.

  This linear combination can be written as
  $ sum_(j=1)^m sum_(k=1)^n c_j A_(j k) x_k = sum_(j=1)^m y_j $
]

#theorem[
  All solutions of a linear system are solutions to the linear combination of the equations of the system.
]

#definition(title: [Equivalent linear systems])[
  Two systems are equivalent if they have the same set of solutions.
]

#theorem[
  Two systems are equivalent if each equation in each system is a linear combination of the equations in the other system.
]

== Matrices and rows

#definition(title: [Elementary row operations])[
  The elementary row operations are:

  #definition(title: [Scaling])[
    $R_i mapsto c R_i$ where $c$ is a nonzero scalar.
  ]

  #definition(title: [Replacement])[
    $R_i mapsto R_i + c R_j$ where $c$ is a scalar.
  ]

  #definition(title: [Interchange])[
    Swap $R_i$ and $R_j$.
  ]
]

#theorem(title: [Elementary row operations are invertible])[
  For any elementary row operation $e$, there exists an elementary row operation $e^(-1)$ such that $e^(-1)(e(A)) = A$ for any matrix $A$.
]

#definition(title: [Row equivalence])[
  Two matrices are row-equivalent if each can be derived from the other using a finite number of elementary row operations.
]

#definition(title: [Row echelon form (REF)])[
  A matrix is in REF if it satisfies:
  + All nonzero rows are above all rows of all zeros.
  + Each leading entry of a row is in a column to the right of the leading entry of the row above it.
  + All entries in a column below a leading entry are zeros.
]

#definition(title: [Reduced row echelon form (RREF)])[
  A matrix is in RREF if it is in REF and additionally satisfies:
  - 4. The leading entry in each nonzero row is 1.
  - 5. Each leading 1 is the only nonzero entry in its column
]

#definition(title: [Pivot position])[
  A location $A_(i j)$ where $op("RREF")(A)_(i j)$ is a leading 1.
]

#definition(title: [Pivot column])[
  A column which contains a pivot position.
]

#definition(title: [Pivot])[
  A nonzero number at a pivot position.
]

#procedure(title: [Gauss-Jordan elimination])[
  #procedure(title: [Gaussian elimination])[
    Iterate through the pivot columns of $A$ from left to right. For each pivot column, use elementary row operations to ensure that the pivot position is nonzero and that all entries in the column below the pivot position are zero. This produces $op("REF")(A)$.
  ]

  #procedure(title: [Jordan elimination])[
    Iterate through the pivot columns of $op("REF")(A)$ from right to left. For each pivot column, use elementary row operations to ensure that all other entries in the column other than the pivot are zero and that the pivot is equal to 1. This produces $op("RREF")(A)$.
  ]
]

#definition(title: [Leading variable, determined variable, basic variable])[
  A variable in a pivot column.
]

#definition(title: [Free variable])[
  A variable not in a pivot column.
]

== Homogeneous linear systems

#definition(title: [Homogeneous linear system])[
  A system where $y_0 = y_1 = dots.c = y_m = 0$. It can be written as $A X = 0$.
]

#theorem(title: [Trivial solution])[
  For any homogeneous system, $x_0 = x_1 = dots.c = x_n = 0$ is a solution to the system. Therefore, all homogeneous systems are consistent.
]

#theorem[
  - (a) If there are less equations than there are variables ($m < n$), then $A X = 0$ has an infinite number of solutions.
  - (b) If there are an equal number of equations and variables, then $A$ is row-equivalent to the $n times n$ identity iff $A X = 0$ has only the trivial solution.
  - (c) If there are more equations than there are variables ($m > n$), then
    $ op("RREF")(A) = mat(
      1, 0, dots.c, 0;
      0, 1, dots.c, 0;
      dots.v, dots.v, dots.down, dots.v;
      0, 0, dots.c, 1;
      0, 0, 0, 0;
      dots.v, dots.v, dots.v, dots.v;
      0, 0, 0, 0;
    ) $
    iff $A X = 0$ has only the trivial solution.
]

#procedure(title: [Solution])[
  To solve a homogeneous system, perform Gauss-Jordan elimination on $A$ so that $R = op("RREF")(A)$. Then solve $R X = 0$. The variables which are not in pivot columns are free variables and may be set to any value, typically denoted $u_1, u_2, dots$.
]

== Inhomogeneous linear systems

#procedure(title: [Solution])[
  To solve an inhomogeneous system, perform Gauss-Jordan elimination on $A' = [A|Y]$ so that $R' = [R|Z] = op("RREF")(A')$. Then solve $R X = Z$. Note that not all inhomogeneous systems are solvable (consistent).
]

#colbreak()

= Fields

== Real and complex numbers

#definition(title: [Field properties])[
  The following properties:

  #theorem(title: [Properties of addition])[
    For all $x, y, z in F$:
    - (A1) Commutativity: $x + y = y + x$
    - (A2) Associativity: $(x + y) + z = x + (y + z)$
    - (A3) Identity: $exists 0 in Reals$ s.t. $0 + x = x$
    - (A4) Additive inverse: For $x in F$, $exists -x in F$ s.t. $x + (-x) = 0$
  ]

  #theorem(title: [Properties of multiplication])[
    For all $x, y, z in F$:
    - (M1) Commutativity: $x y = y x$
    - (M2) Associativity: $(x y) z = x (y z)$
    - (M3) Identity: $exists 1 in Reals$ s.t. $1 x = x$ and $1 != 0$
    - (M4) Additive inverse: For $x in F setminus {0}$, $exists x^(-1) in F$ s.t. $x x^(-1) = 1$
  ]

  #theorem(title: [Distributive property])[
    - (D) $x(y + z) = x y + x z$ for all $x, y, z in F$.
  ]
]

== Fields

#definition(title: [Field])[
  A set $F$ which defines the following two operations:
  - Addition: an operation that maps $x, y in F to c in F$ and satisfies the properties of addition
  - Multiplication: an operation that maps $x, y in F to c in F$ and satisfies the properties of multiplication

  for which the distributive property also holds.
]

#theorem[
  $Reals$ and $Complex$ are fields.
]

#definition(title: [Complex number])[
  A number which can be defined by a pair of real numbers $a, b$ where the value of the number is equal to $a + b i$.
]

#theorem(title: [Useful things about complex numbers])[
  Let $z = a + b i$ and $w = c + d i$ be complex numbers. Then:
  - $z + w = (a + c) + (b + d) i$
  - $z w = (a c - b d) + (b c + a d) i$
]

#definition(title: [$F^n$])[
  For a field $F$, $F^n$ is the set of all ordered $n$-tuples of elements of $F$:
  $ F^n := { (x_1, dots, x_n) : x_1, dots, x_n in F } $
]

#definition(title: [Addition in $F^n$])[
  If $a, b in F^n$:
  $ a + b = (a_1 + b_1, dots, a_n + b_n) $

  Addition follows the properties of addition (A1-A4).
]

#definition(title: [Product of element of $F$ and element of $F^n$])[
  If $alpha in F$ and $x in F^n$, then
  $ alpha x = (alpha x_1, dots, alpha x_n) $
]

= Vector spaces

== 2.3 Vector spaces

#definition(title: [Vector space])[
  A vector space over $F$ is a set $V$ with the following operations:
  - *Vector addition*: $u in V, v in V mapsto (u + v) in V$, which satisfies the properties of addition
  - *Scalar multiplication*: $alpha in F, v in V mapsto alpha v in V$, which satisfies the properties of scalar multiplication
]

#definition(title: [Properties of addition])[
  For all $u, v, w in V$:
  - (A1) Commutativity: $u + v = v + u$
  - (A2) Associativity: $(u + v) + w = u + (v + w)$
  - (A3) Identity: $exists 0 in Reals$ s.t. $0 + u = u$
  - (A4) Additive inverse: For $u in F$, $exists -u in F$ s.t. $u + (-u) = 0$
]

#definition(title: [Properties of scalar multiplication])[
  For all $alpha, beta in F$, $v, w in V$:
  - (S1) Associativity: $(alpha beta) v = alpha (beta v)$
  - (S2) Distributivity over scalar addition: $(alpha + beta) v = alpha v + beta v$
  - (S3) Distributivity over vector addition: $alpha (v + w) = alpha v + alpha w$
  - (S4) Multiplicative identity: $1 v = v$
]

#theorem[
  $F^n$ is a vector space.
]

#theorem[
  All inverses and identities are unique in a vector space.
]

#definition(title: [$F^omega$])[
  The set of all sequences of elements of $F$:
  $ F^omega := { (x_1, x_2, dots) : x_k in F "for" k in Naturals } $
  where addition and scalar multiplication are defined similarly to $F^n$:
  $ a + b &:= (a_1 + b_1, dots, a_n + b_n) \
    alpha x &:= (alpha x_1, dots, alpha x_n) $
]

#definition(title: [$F^(m,n)$])[
  The set of all $m times n$ matrices with entries in $F$, where addition and scalar multiplication are defined as:
  $ (A + B)_(i j) &:= A_(i j) + B_(i j) \
    (alpha A)_(i j) &:= alpha A_(i j) $
]

#definition(title: [Vector space of functions])[
  Let $V$ be a vector space, $S$ be a set, and
  $ V^S = { f : S to V } $
  (the set of all functions that map members of $S$ to members of $V$). Then $V^S$ is a vector space, if we define for all $p, q in V^S$, $s in F$,

  $ (f + g)(s) = f(s) + g(s) quad (alpha f)(s) = alpha (f(s)) $
]

#definition(title: [Polynomial])[
  A function $p : F to F$ is a polynomial of degree $n$ iff there exist $c_0, dots c_n in F$ such that
  $ p(x) = c_0 + c_1 x + c_2 x^2 + dots.c c_n x^n = sum_(k=0)^n c_k x^k $

  $cal(P)(F)$ is the set of all polynomials of any degree with coefficients in $F$. $cal(P)_n (F)$ is the set of all polynomials of degree $n$ with coefficients in $F$.

  $cal(P)(F)$ and $cal(P)_n (F)$ are vector spaces if we define for all $p, q in cal(P)_n (F)$, $s in F$,

  $ (p + q)(s) = p(s) + q(s) quad (alpha p)(s) = alpha (p(s)) $
]

== Subspaces

#definition(title: [Subspace])[
  Let V be any vector space, and let W be a subset of V. Define vector addition and scalar multiplication on W by restricting the corresponding operations of V to W. If W is a vector space with respect to the restricted operations of V, then W is said to be a subspace of V.
]

#definition(title: [Closed])[
  An operation is closed under a set if applying the operation to elements of the set always results in an element of the set.
]

#definition(title: [Subspace])[
  A subspace of a vector space $V$ is a subset $W$ of $V$ which contains the zero vector and is closed under addition and scalar multiplication.
]

#theorem[
  A subset $W$ of a vector space $V$ is a subspace iff
  - (i) $W$ is nonempty
  - (ii) $alpha in F$ and $w_1, w_2 in W$ implies $alpha w_1 + w_2 in W$

  Typically, we prove (i) by proving that $0 in W$.
]

== Subspaces of $F^n$

#theorem(title: [Subspaces of $Reals^n$])[
  $Reals^n$ contains the following subspaces:
  - ${0}$
  - $Reals^n$
  - Any line through the origin
  - Any plane through the origin
  - etc
]

#definition(title: [Spanning])[
  For vectors to span a space is for it to be sufficient to be able to reach any point in the space using the vectors.
]

#definition(title: [Independence])[
  If a vector can be made out of other vectors, then the vector is independent
]

== Intersections and unions of subspaces

#theorem[
  The intersection of any collection of subspaces of $V$ is a subspace of $V$.
]

#theorem[
  The union of two subspaces of $V$ is a subspace of $V$ iff one of the subspaces is contained in the other.
]

#definition(title: [Sum of subspaces])[
  If $U$ and $W$ are subspaces of a vector space $V$, then
  $ U + W := { u + w : u in U "and" w in W } $
]

#theorem[
  If $U$ and $W$ are subspaces of $V$, then $U + W$ is the smallest subspace of $V$ containing both $U$ and $W$.
]

#definition(title: [Direct sum])[
  If $V_1, dots, V_n$ are subspaces of $V$ such that each element of $limits(plus.circle)_(k=1)^n V_k = V_1 + dots.c + V_n$ can be written uniquely as $sum_(k=1)^n v_k = v_1 + dots.c + v_n$ where $v_k in V_k$, then $limits(plus.circle)_(k=1)^n V_k$ is a *direct sum* and can be written as $limits(plus.circle)_(k=1)^n V_k = V_1 plus.circle dots.c plus.circle V_n$.
]

#theorem[
  Let $V_1, dots, V_n$ be subspaces of $V$. Then they are direct sums iff the only way to write $0 = v_1 + dots.c + v_n$ is to take $v_1 = dots.c = v_n = 0$.
]

#theorem[
  If $U$ and $W$ are subspaces of $V$, then $U + W$ is a direct sum iff $U sect W = {0}$. This does not generalize to higher numbers of subspaces.
]

== Spanning

#definition(title: [Linear combination])[
  A linear combination of a collection $v_1, dots, v_n$ of vectors in vector space $V$ is a vector of the form
  $ alpha_1 v_1 + dots.c + alpha_n v_n $
  where each $alpha_k in F$.
]

#definition(title: [Span])[
  Given $W subset.eq V$ where $V$ is a vector field, the set of all linear combinations of vectors in $W$ is called the span of $W$.
  $ op("span")(W) := { sum_(i=1)^n alpha_i w_i : alpha_i in F, w_i in W } $

  Additionally, we define
  $ op("span")(nothing) = { 0 } $
]

#definition(title: [Subspace generated by a set])[
  Given $W subset.eq V$ where $V$ is a vector field, the subspace generated by $W$ is the smallest subspace of $V$ containing $W$, or equivalently the intersection of all subspaces of $V$ containing $W$.
]

#theorem[
  The span of $W$ is the subspace generated by $W$, i.e. $W$ is the smallest subspace of $V$ containing $W$.
]

#definition(title: [Spanning, spanning set])[
  If $op("span")(W) = V$, then $W$ spans $V$ and $W$ is a spanning set for $V$.
]

#definition(title: [Finite-dimensional vector space])[
  A vector space is finite-dimensional iff it has a finite spanning set.

  Otherwise, it is infinite-dimensional.
]

== Linear independence

#definition(title: [Linear independence])[
  Let $V$ be a vector space. If $W subset.eq V$ is a finite set, it is linearly independent iff the only way to write 0 as a combination
  $ alpha_1 v_1 + dots.c + alpha_m v_m = 0 $
  is by taking $alpha_1 = dots.c = alpha_m = 0$. We also define $nothing$ to be linearly independent.

  If $W subset.eq V$ is an infinite set, it is linearly independent if every finite subset of $W$ is linearly independent.
]

#theorem[
  If $W subset.eq V$ is linearly independent, any subset $U subset.eq W$ is linearly independent.

  If one vector in $W$ is a linear combination of the other vectors (including if $0 in W$), then $W$ is linearly dependent.
]

== Basis

#definition(title: [Basis])[
  A basis of $V$ is a subset of $V$ which is linearly independent and spans $V$.
]

#definition(title: [Standard basis of $F^n$])[
  $ { vec(1, 0, dots.v, 0), vec(0, 1, dots.v, 0), vec(0, 0, dots.v, 1) } $
]

#definition(title: [$P_m(F)$])[]

#definition(title: [Standard basis of $P_m(F)$])[]

== Dimension

#theorem(title: [Plus/minus lemma])[
  Let $S subset.eq V$ (where $V$ is a vector space).
  - If $S$ is linearly independent, and $v$ is not in the span of $S$, then $S union {v}$ is linearly independent.
  - If $v in op("span")(S setminus {v})$, then $op("span")(S) = op("span")(S setminus {v})$.
]

#theorem[
  Let $V$ be a finite-dimensional vector space and $S subset.eq V$. Then,
  - If $op("span")(S) = V$, then $S$ contains a subset $B$ which is a basis of $V$
  - If $S$ is linearly independent, then $S$ can be extended to a basis of $V$
]

#theorem[
  Let $V$ be a finite-dimensional vector space spanned by a set of $m$ vectors. Then any linearly independent set of vectors in $V$ is finite and contains no more than $m$ elements.
]

= Linear maps

== Linear map

#definition(title: [Linear map])[
  Let $V$ and $W$ be vector spaces over $F$. A *linear map* (also called *linear function* or *linear transformation*) from $V$ to $W$ is a function $T : V to W$ with the two properties
  $ T(v_1 + v_2) &= T v_1 + T v_2 && "(additivity)" \
    T(alpha v) &= alpha T v && "(homogeneity)" $
  Equivalently, it is a function with the property that
  $ T(alpha v_1 + v_2) = alpha T v_1 + T v_2 $
  Equivalently, it is a function with the property that
  $ T(alpha_1 v_1 + alpha_2 v_2) = alpha_1 T v_1 + alpha_2 T v_2 $
]

*Note:* Not all elementary linear functions $y = m x + b$ are linear maps! All linear maps in $F^1$ are of the form $y = m x$.

#definition(title: [Linear operator])[
  A function $T : V to V$ which is a linear map.
]

#definition(title: [$cal(L)$])[
  For any vector spaces $V$ and $W$, $cal(L)(V,W)$ is the set of all linear maps from $V$ to $W$.

  $cal(L)(V) := cal(L)(V,V)$.

  $cal(L)(V,W)$ is also called $"Hom"(V,W)$.
]

#lemma(title: [Linear Map Lemma])[
  Let $V$ be a finite-dimensional vector space and $W$ be a vector space. Suppose ${ v_1, dots v_n }$ is a basis of $V$ and $w_1 dots w_n in W$. Then there exists a unique linear map $T : V to W$ such that
  $ T v_k = w_k $
  for each $k in {1, dots, n}$.

  *Note:* This means that there exists a unique linear map that maps a basis to any vectors we wish, and that a linear map is uniquely determined by its output on a basis.
]

#lemma[
  If $T : V to W$ is a linear map, then $T(0) = 0$.
]

#theorem(title: [$cal(L)(V,W)$ is a vector space])[
  If we define
  $ (S + T)(v) &:= S + T \
    (alpha T)(v) &:= alpha T(v) $
  for $S, T in cal(L)(V,W)$, $alpha in F$, then $cal(L)(V,W)$ is a vector space and is a subspace of $V^W$.
]

#definition(title: [Product of linear maps])[
  If $T in cal(L)(U, V)$ and $S in cal(L)(V, W)$, then we define the product $S T in cal(L)(V, W)$ by $S T := S compose T$.
]

#theorem(title: [$cal(L)(V)$ is a unital associative F-algebra])[
  The product of linear maps on $V$ has the following properties:
  - *Bilinearity*: For all $S, T_1, T_2 in cal(L)(V)$, $alpha in F$,
    - $S(T_1 + T_2) = S T_1 + S T_2$
    - $(S_1 + S_2) T = S_1 T + S_2 T$
    - $(alpha S) T = alpha(S T) = S(alpha T)$
  - *Associativity*: $(R S) T = R(S T)$ for all $R, S, T in cal(L)(V)$
  - *Identity* (_unital_): $I T = T I = T$ for all $T in cal(L)(V)$, where $I$ is the identity map $x mapsto x$.

  It is an _F-algebra_ because it is a vector space over a field equipped with bilinear multiplication.
]

== Kernel

#definition(title: [Kernel])[
  The *kernel* or *null space* of a linear map $T : V to W$ is the set of vectors in $V$ which $T$ maps to the zero vector of $W$:
  $ op("null") T = ker T := { v in V : T v = 0 } subset.eq V $
]

#theorem(title: [Kernel is subspace of domain])[
  If $T : V to W$, then $ker T$ is a subspace of $V$.
]

#definition(title: [Injective])[
  A map of sets $f : A to B$ is *injective* or *one-to-one* iff $a_1 != a_2$ implies $f(a_1) != f(a_2)$, or equivalently iff $f(a_1) = f(a_2)$ implies $a_1 = a_2$.
]

#theorem(title: [Injective linear map has trivial kernel])[
  A linear map $T : V to W$ is injective iff $ker T = {0}$.
]

== Image

#definition(title: [Image])[
  Let $T : V to W$ be a linear map. The *image* or *range* of $T$ is the set of all outputs of T:
  $ op("range") T = im T := { T v : v in V } subset.eq W $
]

#theorem(title: [Image is subspace of codomain])[
  If $T : V to W$, then $im T$ is a subspace of $W$.
]

#definition(title: [Surjective])[
  A map of sets $f : A to B$ is surjective iff $im f = B$, or equivalently iff for every $b in B$ there exists $a in A$ s.t. $f(a) = b$.

  Iff $f$ is surjective, $f$ *maps $A$ onto $B$*.
]

== Fundamental Theorem

#theorem(title: [Fundamental Theorem of Linear Maps])[
  Let $T : V to W$ be a linear map with $V$ finite-dimensional. Then $im T$ is finite-dimensional and
  $ dim V = dim ker T + dim im T $
]

#theorem(title: [Corollary to Fundamental Thm])[
  Let $V$ and $W$ be finite-dimensional vector spaces, and let $T : V to W$. Then
  - If $dim V > dim W$, then $T$ is not injective.
  - If $dim V < dim W$, then $T$ is not surjective.
]

== Systems of linear equations as linear maps

#definition(title: [Systems of linear equations as linear maps])[
  For a linear equation mapping vectors in $F^n$ to $F^m$
  $ A x = y $
  we can interpret this as a linear map $T_A : M^(n times 1)(F) to M^(m times 1)(F)$ where $T(x) = A x$.
]

#theorem[
  $ker T_A$ is the solution set of the homogeneous system $A x = 0$.
]

#theorem[
  A homogeneous system of linear equations with more variables than equations has nonzero solutions.

  A system of linear equations with more equations than variables has no solution for some choice of constant terms.
]

== Isomorphisms

#definition(title: [Bijective])[
  Injective and surjective.
]

#definition(title: [Isomorphism])[
  Let $V$ and $W$ be vector spaces over $F$. An *isomorphism from $V$ to $W$* is a bijective linear map $T : V to W$. Iff there exists an isomorphism from $V$ to $W$, $V$ and $W$ are *isomorphic*, which is denoted by $V tilde.equiv W$.
]

#definition(title: [Identity map])[
  The identity map $id_V : V to V$ is defined such that
  $ id_V (v) = v quad "for" v in V $
]

#theorem(title: [Isomorphism is an equivalence relation])[
  - *Reflexive*: For any vector space $V$, $id_V : V to V$ is an isomorphism, i.e. $V tilde.equiv V$ for every $V$.
  - *Symmetric*: If $T : V to W$ is an isomorphism, then $T^(-1) : W to V$ is also an isomorphism. Thus, $V tilde.equiv W$ implies $W tilde.equiv V$.
  - *Transitive*: If $T_1 : U to V$ and $T_2 : V to W$ are isomorphisms, then $T_2 T_1 : U to W$ is an isomorphism. Thus, $U tilde.equiv V$ and $V tilde.equiv W$ implies $U tilde.equiv W$

  Therefore, isomorphism is an equivalence relation on the collection of all vector spaces over $F$.
]

#definition(title: [Isomorphism class])[
  The isomorphism class $[V]$ of a vector space $V$ is the set of all vector spaces isomorphic to $V$.
]

#lemma[
  Any two isomorphism classes are disjoint or equal.
]

#theorem[
  Two finite-dimensional vector spaces over $F$ are isomorphic iff they have the same dimension.

  Equivalently, any finite-dimensional vector space $V$ over $F$ is isomorphic to $F^(dim V)$.
]

#theorem[
  If $V$ and $W$ are finite-dimensional vector spaces of the same dimension and $T : V to W$ is a linear map, then if $T$ is injective or surjective, it is an isomorphism.
]

#lemma[
  $cal(P)_n (F) tilde.equiv F^(n+1)$.
]

== Coordinates

For the following definitions, let $B := { v_1, dots, v_n }$ be a basis of $V$, where $V$ is an $n$-dimensional vector space over $F$.

#definition(title: [Linear combination map (basis isomorphism)])[
  The *linear combination map* or *basis isomorphism* is the isomorphism $L_B : F^n to V$ defined by
  $ L_B (arrow(x)) = x_1 v_1 + dots.c + x_n v_n $
]

#definition(title: [Coordinate isomorphism])[
  The *coordinate isomorphism* is the isomorphism $L_B^(-1) : V to F^n$.

  This means that for any vector space, its vectors can be expressed as vectors in $F^n$.
]

#definition(title: [Coordinate vector])[
  Let $v$ be a vector in $V$. Then the coordinate vector $[v]_B in F^n$ of $v$ is defined as
  $ [v]_B := L_B^(-1)(v) $

  Equivalently, it is the vector such that
  $ L_B ([v]_B) = v $
]

#definition(title: [Ordered basis])[
  An ordered basis of a $n$-dimensional vector space $V$ is an $n$-tuple which is an ordering of a basis of $V$.
]

== Matrix of a linear map

#definition(title: [Matrix of a linear map])[
  Let $B_V = (v_1, dots, v_n)$ be a basis of $V$ and $B_W = (w_1, dots, w_m)$ be a basis of $W$. Let $T : V to W$ be a linear map.

  Then the matrix of $T$ with respect to $B_V$ and $B_W$ is denoted as
  $ [T]_(B_W B_V) $

  It is the $m times n$ matrix defined such that its $j$th column is the coordinate vector of $T v_j$ with respect to $B_W$:
  $ ([T]_(B_W B_V))_(* j) = [T v_j]_(B_W) $

  Equivalently, it is the $m times n$ matrix that satisfies
  $ T v_j = sum_(i=1)^m ([T]_(B_W B_V))_(i j) w_i $
]

#lemma[
  Applying a linear map $T$ to a vector $v$ is equivalent to multiplying the coordinate vector of $v$ by the matrix of $T$:
  $ [T v] = [T][v] $
]

#definition(title: [Standard matrix])[
  The matrix of a linear map $T : F^n to F^m$ with respect to the standard bases of $F^n$ and $F^m$.
]

#lemma[
  $ dim cal(L)(V, W) = (dim V)(dim W) $
]

#lemma[
  Composing two linear maps $T_1$ and $T_2$ is equivalent to multiplying the matrices of the two linear maps:
  $ T_1 compose T_2 = [T_1][T_2] $
]

#definition(title: [Matrix multiplication])[
  The matrix multiplication of the $m times n$ matrix $A$ and the $n times p$ matrix $B$ is made by dot-producting the rows of the first by the columns of the second:
  $ [A B_(i j)] = [A_(i *) dot B_(* j)] = [sum_(k=1)^n A_(i k) B_(k j)] $
]

#theorem(title: [Properties of matrix multiplication])[
  Let $A$, $B$, $C$ be matrices and $r$ and $s$ be scalars in $F$. Then
  $ A(r B + s C) &= r(A B) + s(A C) \
    (B + C) A &= B A + C A \
    A(B C) &= (A B) C $

  Effectively, matrix multiplication is distributive and associative. It is not always commutative.
]

== Fundamental matrix spaces

Given a matrix $A in F^(m,n)$, define $T_A := x mapsto A x$. Then $T_A : F^n to F^m$.

#definition(title: [Null space, nullity])[
  The *null space* of $A$ is the kernel of $T_A$:
  $ op("Nul") A := ker T_A = {x in F^n : A x = 0} $

  which is the solution set of the homogeneous linear system $A x = 0$.

  $ op("nullity") A := dim op("Nul") A $
]

#definition(title: [Column space, rank])[
  The *column space* of $A$ is the image of $T_A$:
  $ op("Col") A := im T_A
    &= {T_A x : x in F^n} \
    &= {A x : x in F^n} \
    &= { sum_(i=1)^n x_i A_(* i) : x_i in F } \
    &= op("span") { A_(* 1), dots, A_(* n) } $

  which is the span of the column vectors of the matrix $A$.

  $ op("rank") A := dim op("Col") A $
]

#lemma[
  $ op("rank") A &= "the number of pivot columns" \
    op("nullity") A &= "the number of non-pivot columns" $

  Therefore,
  $ n = op("nullity") A + op("rank") A $
]

#procedure(title: [Finding bases of $op("Nul") A$, $op("Col") A$, $op("Row") A$])[
  + The pivot columns of $A$ are a basis of $op("Col") A$.
  + The pivot rows of $op("RREF")(A)$ are a basis of $op("Row") A$. (row space is preserved under row operations)
  + The vectors spanning $A x = 0$ are a basis of $op("Nul") A$.
]

#definition(title: [Transpose of a matrix])[
  If $A$ is an $m times n$ matrix, then its transpose $A^T$ is the $n times m$ matrix obtained by interchanging the rows and columns of $A$:
  $ [A^T_(i j)] = [A_(j i)] $
]

#definition(title: [Row space])[
  The row space of $A$ is the span of the row vectors of $A$:
  $ op("Row") A := op("span") { A_(1 *), dots, A_(m *) } = op("Col") A^T $
]

#lemma[
  $ dim op("Row") A = dim op("Col") A = op("rank") A $
]

#definition(title: [Left null space])[
  The left null space of $A$ is the null space of $A^T$. It is the solution set of the homogeneous linear system $A^T y = 0$ or equivalently of $y^T A = 0^T$.
]

#procedure(title: [Finding the left null space without column operations])[
  To find the left null space of the $n times m$ matrix $A$, make a column vector $b = (b_1, dots, b_m)^T$ and calculate $op("RREF")([A | b])$. Then the basis of the left null space is given by the rows of $op("RREF")([A | b])$ for which the left side is all zero (where $b_1, dots, b_m$ are the basis in which $A$ is expressed in (the basis $B$ for which $A = [T]_B$, which is usually the standard basis)).

  Alternately, calculate $op("RREF")([A | I])$, then the basis of the left null space is given by the rows of $op("RREF")([A | I])$ for which the left side is all zero.
]

== Invertible matrices

#definition(title: [Invertible matrix])[
  Let $A$ be an $n times n$ matrix. If there exists an $n times n$ matrix $B$ s.t. $A B = B A = I$, then $A$ is *invertible* and *non-singular* and $B$ is the *inverse* of $A$:
  $ A^(-1) := B $
  A matrix which is not invertible is *non-invertible* and *singular*.
]

#lemma[
  The matrix of an isomorphism of finite-dimensional vector spaces is invertible.
]

#lemma[
  If a matrix is invertible, it has a unique inverse.
]

#lemma[
  Any finite product $A_1 dots.c A_k$ of invertible $n times n$ matrices is invertible with
  $ (A_1 dots.c A_k)^(-1) = A_k^(-1) dots.c A_1^(-1) $
]

#definition(title: [Elementary matrix])[
  An $n times n$ matrix is an *elementary matrix* if it can be obtained from the $n times n$ identity matrix by a single elementary row operation.
]

#theorem[
  If $e : F^(n,n) to F^(n,n)$ is an elementary row operation and $A in F^(n,n)$, then
  $ e(A) = e(I) A $
]

#theorem(title: [Invertible Matrix Theorem])[
  If $A$ is an $n times n$ matrix, then the following conditions are equivalent:
  - $A$ is invertible.
  - $A$ is row-equivalent to the $n times n$ identity matrix.
  - $A$ is a product of elementary matrices.
]

#theorem[
  If $A$ is an invertible $n times n$ matrix and $E_k dots.c E_1 A = I$ where each $E_j$ is an elementary matrix, then $E_k dots.c E_1 I = A^(-1)$.
]

#lemma[
  If $A$ is row-equivalent to $I$, then $[A | I]$ is row-equivalent to $[I | A^(-1)]$. Otherwise, $A$ doesn't have an inverse.
]

#procedure(title: [Computation of $A^(-1)$])[
  Row-reduce the augmented matrix $[A | I]$. If $A$ is row-equivalent to $I$, then $op("RREF")([A | I]) = [I | A^(-1)]$. Otherwise, $A$ doesn't have an inverse.
]

#lemma[
  The linear system $A x = y$ of $n$ equations with $n$ unknowns has a unique solution iff $A$ is invertible.
]

== Change of basis

#definition(title: [Change of basis matrix])[
  The *change of basis matrix* or *transition matrix* of an $n$-dimensional vector space $V$ with relation to the ordered bases $B$ and $B'$ is the $n times n$ matrix whose $j$th column is the coordinate vector of the $j$th vector in $B$ with respect to $B'$:
  $ C_(* j) := [v_j]_(B') $
]

#procedure(title: [Finding the transition matrix])[
  Given bases $B$ and $B'$, row-reduce the augmented matrix $[[w_i] | [v_i]]$, whose first $n$ columns are the coordinate vectors $[w_i]$ of the vectors of $B'$ and whose last $n$ columns are the coordinate vectors $[v_i]$ of the vectors of $B$. Then the transition matrix from $B$ to $B'$ is the right-hand side of $op("RREF")([[w_i] | [v_i]])$.
]

#lemma(title: [Inverting a transition matrix])[
  $ C_(B' to B) = C_(B to B')^(-1) $

  Note that $C_(B' to B)$ is the matrix formed by the coordinate vectors of the basis vectors of $B'$ with respect to $B$.
]

#lemma(title: [Changing the basis of a vector])[
  If $B$ and $B'$ are bases of $V$, $v in V$, and $C_(B to B')$ is the transition matrix from $B$ to $B'$, then
  $ [v]_(B') = C_(B to B') [v]_B $
]

#lemma(title: [Changing the basis of a linear map by changing its matrix])[
  If $B$ and $B'$ are bases of $V$, $T in cal(L)(V)$, and $C_(B to B')$ is the transition matrix from $B$ to $B'$, then
  $ [T]_(B') = C_(B to B') [T]_B C_(B' to B) $
]

#procedure(title: [Changing the basis of a linear map by applying the linear map to basis vectors])[
  If $B$ and $B' = (w_1, dots, w_n)$ are bases of $V$, $T in cal(L)(V)$, and $C_(B to B')$ is the transition matrix from $B$ to $B'$, then
  $ T_(B') = mat(C_(B to B') [T]_B [w_1]_B, dots.c, C_(B to B') [T]_B [w_n]_B) $
  (Apply $T$ to each of the basis vectors of $B'$ and then convert $T w_i$ to the basis $B'$)
]

== Similarity

#definition(title: [Similar matrices])[
  Two $n times n$ matrices $A$ and $B$ are similar if there exists an invertible matrix $C$ s.t. $B = C^(-1) A C$.

  Similarity is an equivalence relation on $F^(n,n)$.
]

#definition(title: [Similarity invariant])[
  A property of a $n times n$ matrix $A$ which holds for all matrices similar to $A$.
]

#theorem(title: [Useful similarity invariants])[
  The following properties are similarity invariants:
  + invertibility
  + nullity
  + rank
]

== Linear functionals

#definition(title: [Linear functional])[
  Let $V$ be a vector space over $F$. Then a linear map $T : V to F$ is a *linear functional* on $V$.
]

#definition(title: [Dual space])[
  Let $V$ be a vector space over $F$. Then the dual space of $V$ is the vector space of linear functionals on $V$, $V^* := cal(L)(V, F)$.
]

#definition(title: [Kronecker delta])[
  $ delta_(i j) := cases(
    1 & "if" i = j,
    0 & "if" i != j,
  ) $
]

#definition(title: [$i$th coordinate function])[]

#definition(title: [Dual basis])[]

#lemma[
  Let $V$ be an $n$-dimensional vector space and $B = {v_1, dots v_n}$ be a basis of $V$. Then for each $i in {1, dots, n}$ there exists a unique linear functional $f_i$ (called the *$i$th coordinate function for $B$*) such that
  $ f_i (v_j) = delta_(i j) quad "for all" j in {1, dots, n} $

  For any $v in V$, we can express $v$ as a linear combination of elements of $B$, where the coefficients are given by $f_i (v)$:
  $ v = sum_(j=1)^n f_j (v) v_j $

  Additionally,
  $ B^* := {f_1, dots, f_n} $
  is a basis of $V^*$, and is called the *dual basis* of the basis $B$ of $V$.

  Any linear functional $f : V to F$ can be written uniquely as
  $ f = sum_(i=1)^n f(v_i) f_i $

  and $f(v)$ can be written as
  $ f(v) = sum_(i=1)^n f(v_i) ([v]_B)_i $
]

== Trace

#definition(title: [Trace of a matrix])[
  The trace of an $n times n$ matrix $A$ is the sum of the diagonal elements of $A$:
  $ tr(A) := sum_(i=1)^n A_(i i) $

  $tr : F^(n,n) to F$ is a linear functional.
]

#theorem(title: [Properties of the trace])[
  Let $A, B$ be $n times n$ matrices and $c$ be a scalar. Then
  - $tr(A + B) = tr(A) + tr(B)$
  - $tr(c A) = c thin tr(A)$
  - $tr(A^T) = tr(A)$
  - $tr(A B) = tr(B A)$ (this generalizes to more than 2 factors)
  - The trace is similarity-invariant: if $A$ and $B$ are similar then $tr(A) = tr(B)$
]

== Transpose

#definition(title: [Transpose of linear map])[
  Let $V$ and $W$ be vector spaces over $F$, and let $T in cal(L)(V, W)$. The *transpose of $T$* or *dual map of $T$* is the linear map $T^* = T^T in cal(L)(W^*, V^*)$ defined for each $f in W^*$ by
  $ T^*(f) = T^T (f) := f compose T $

  That is, for each linear functional $f in W^*$, $T^T (f)$ is the linear functional in $V^*$ defined by (for each $v in V$)
  $ T^T (f)(v) = f(T v) $
]

#theorem(title: [Properties of the transpose])[
  For all linear maps $T_1$, $T_2$, $T$ and $alpha in F$,
  - $(T_1 + T_2)^T = alpha T_1^T + T_2^T$ (the map $T mapsto T^T$ is linear)
  - $(T_1 compose T_2)^T = T_2^T + T_1^T$
]

#theorem(title: [Matrix of transpose is transpose of matrix])[
  The matrix of $T^T$ is the transpose of the matrix of $T$:
  $ [T^T]_(B_W^* B_V^*) = ([T]_(B_V B_W))^T $
]

#lemma[
  Let $V$ and $W$ be finite-dimensional vector spaces, $T in cal(L)(V, W)$ and $g in W^*$. Choose ordered bases $B_V = (v_1, dots, v_n)$ and $B_W = (w_1, dots, w_m)$ for $V$ and $W$, respectively, and let $B_V^* = (f_1, dots, f_n)$ and $B_W^* = (g_1, dots, g_m)$ be the corresponding dual bases of $V^*$ and $W^*$. Let $S = (1)$ be the standard ordered basis of $F$. Then
  $ [T^T g]_(B_V^*, S) = [g]_(B_W^*, S) [T]_(V, W) $
]

#lemma[
  Let $V$ and $W$ be finite-dimensional vector spaces, $T in cal(L)(V, W)$, $T^T in cal(L)(W^*, V^*)$. Then:
  - $ op("rank") T^T = op("rank") T <= min {dim V, dim W} $
  - $T$ is injective iff $T^T$ is surjective
  - $T$ is surjective iff $T^T$ is injective
]

= Multilinear algebra and determinants

== Bilinear forms

#definition(title: [Bilinear form])[
  Let $V$ be a vector space over $F$. A *bilinear form* on $V$ is a function $B : V times V to F$ which is linear in each variable separately when the other variable is held constant. That is, for all $v_1, v_2, v in V$ and $alpha B(v, v_1) + B(v, v_2)$,
  $ B(alpha v_1 + v_2, v) = alpha B(v_1, v) + B(v_2, v) $
  and
  $ B(v, alpha v_1 + v_2) = alpha B(v, v_1) + B(v, v_2) $
]

#lemma[
  If $V$ is a vector space over $F$ and $f, g in cal(L)(V, F)$, then $B(u, v) := f(u) g(v)$ is a bilinear form on $V$.
]

#definition[
  $V^((2))$ denotes the set of all bilinear forms on $V$.
]

#lemma[
  $V^((2))$ is a subspace of $V times V to F$.
]

#definition(title: [Matrix of a bilinear form])[
  Let $B$ be a bilinear form on $V$ and let $arrow(e) = (e_1, dots e_n)$ be an ordered basis of $V$. Then the matrix of $B$ with respect to $arrow(e)$ is the matrix $[B]$ defined by:
  $ [B]_(i j) = B(e_i, e_j) $
]

#theorem[
  If $B$ is a bilinear form on $V$, $[B]$ is its matrix with respect to the ordered basis $arrow(e)$, $v, w in F$, and $[v]$ and $[w]$ are the coordinate vectors of $v$ and $w$ with respect to the ordered basis $arrow(e)$, then
  $ B(v, w) = [v]^T [B] [w] $
]

== Symmetric bilinear forms

#definition(title: [Symmetric bilinear form])[
  A bilinear form $B in V^((2))$ is symmetric iff $B(u, w) = B(w, u)$ for all $u, w in V$. The set of all symmetric bilinear forms on $V$ is denoted by $V^((2))_("sym")$.
]

#definition(title: [Symmetric matrix])[
  An $n times n$ matrix $A$ is symmetric iff $A^T = A$.
]

#theorem[
  If $B in V^((2))$, then the following conditions are equivalent.
  - $B$ is a symmetric bilinear form on $V$.
  - $[B]$ is a symmetric matrix for every basis of $V$.
  - $[B]$ is a symmetric matrix for some basis of $V$.
  - $[B]$ is a diagonal matrix for some basis of $V$.
]

== Alternating bilinear forms

#definition(title: [Alternating bilinear form])[
  A bilinear form $B in V^((2))$ is alternating if
  $ B(u, w) = -B(w, u) $
  for all $u, w in V$. The set of alternating bilinear forms on $V$ is denoted by $V^((2))_("alt")$.
]

#definition(title: [Antisymmetric matrix])[
  A matrix $A$ is antisymmetric iff $A^T = -A$.
]

#theorem[
  If $B in V^((2))$, then the following conditions are equivalent.
  - $B$ is an alternating bilinear form on $V$.
  - $[B]$ is an antisymmetric matrix for every basis of $V$.
  - $B(v, v) = 0$ for all $v in V$
]

#lemma[
  $V^((2)) = V^((2))_("sym") plus.circle V^((2))_("alt")$, and $V^((2))_("sym")$ and $V^((2))_("alt")$ are subspaces of $V^((2))$.
]

== Multilinear forms

#definition[
  $ V^m := underbrace(V times V times dots.c times V, m "times") $
]

#definition(title: [Multilinear form])[
  An $m$-linear form on $V$ is a map which is linear in each entry when all other entries are held fixed.

  The set of $m$-linear forms on $V$ is denoted by $V^((m))$.
]

== Alternating multilinear forms

#definition(title: [Alternating multilinear form])[
  An $m$-linear form $M$ is alternating iff
  $ M(v_1, dots, v_i, dots, v_j, dots v_m) = -M(v_1, dots, v_j, dots, v_i, dots v_m) $
  for all $i, j$.
]

#lemma[
  $M in V^((m))$ is alternating iff $v_i = v_j$ implies $M(v_1, dots, v_m) = 0$ for all $i != j in [1, m]$.
]

#lemma[
  If $M in V^((m))_("alt")$ and ${v_1, dots, v_m}$ is linearly dependent, then $M(v_1, dots, v_m) = 0$.
]

#lemma[
  If $m > dim V$, then $dim V^((m))_("alt") = 0$.
]

== Permutations

#definition(title: [Permutation])[
  A permutation of the set $A = {1, 2, dots, m}$ is a bijection $sigma : A to A$ (equivalently, a reordering of the ordered list $A$). It is often denoted by a matrix
  $ mat(1, 2, dots.c, m; sigma(1), sigma(2), dots.c, sigma(m)) $
  where the inputs form the first row and the corresponding outputs form the second row.
]

#definition(title: [Group])[
  A group is a set $G$ which contains a binary operation $dot$ such that
  - *Identity*: There exists an identity element $e in G$ such that $a dot e = a$
  - *Inverse*: There exists an inverse $a^(-1)$ for each $a in G$ such that $a dot a^(-1) = I$
  - *Associativity*: $(a dot b) dot c = a dot (b dot c)$
]

#theorem[
  The set $S_m$ of all permutations of $A = {1, 2, dots, m}$ is a group under composition. The identity element is the trivial permutation $x mapsto x$:
  $ mat(1, 2, dots.c, m; 1, 2, dots.c, m) $

  The inverse of a permutation is denoted $sigma^(-1)$, and the composition of two permutations is denoted $tau compose sigma = tau sigma$.
]

#definition(title: [Cyclic permutation, $r$-cycle])[
  A *cyclic permutation* or *$r$-cycle* is a permutation defined by and denoted by a list $(a_1 med a_2 med dots.c med a_r)$ where the $a_i$ are distinct, such that $sigma(a_i) = a_(i+1)$ for $i in [1, r]$, $sigma(a_r) = a_1$, and $sigma(a_l) = a_l$ for $l > r$.

  A 2-cycle is also called a *transposition*.
]

#definition(title: [Disjoint cycles])[
  Cycles which share no elements in common.
]

#theorem[
  Any permutation $sigma$ can be written as a composition of disjoint transpositions.
]

#definition(title: [Even, odd, sign])[
  A permutation $sigma$ is *even* and $op("sgn")(sigma) = +1$ iff it is a product of an even number of disjoint transpositions.

  It is *odd* and $op("sgn")(sigma) = -1$ iff it is a product of an odd number of disjoint transpositions.
]

#procedure(title: [Writing a permutation as a series of disjoint cycles])[
  Take any element $a$ of the input set $A$, and apply $sigma$ repeatedly until $a = sigma dots.c sigma(a)$. Then we have cycle $a mapsto sigma(a) mapsto dots.c mapsto sigma dots.c sigma(a) = a$. Repeat for all remaining elements that are not part of this cycle.
]

#procedure(title: [Writing a permutation as a series of disjoint transpositions])[
  Apply the above procedure to the permutation. Then for each of the disjoint cycles in the series that are not transpositions, apply that procedure to each of those cycles until they are transpositions (2-cycles).
]

#lemma[
  $op("sgn")(tau sigma) = op("sgn")(tau) op("sgn")(sigma)$ for all $tau, sigma in S_m$.
]

#lemma[
  An $r$-cycle is an even permutation iff $r$ is odd, and an odd permutation iff $r$ is even.
]

#procedure(title: [Determining the sign of a permutation])[
  Decompose the permutation into a product of disjoint cycles. Then the parity (oddness/evenness) of the permutation is the number of cycles of even length in its decomposition.
]

// == Permutation action on multilinear forms
//
// #definition(title: [Group action])[
//   Let $G$ be a group and $X$ be a set.
//
//   A *left group action* of $G$ on $X$ is a mapping $alpha : G times X to X$ (which we denote $g, x mapsto g x$) which satisfies the following two properties:
//   - *Identity*: $e x = x$, for all $x in X$, where $e$ is the identity element of $G$.
//   - *Compatibility*: $h(g x) = (h g) x$ for all $g, h in G$ and $x in X$.
//
//   A *right group action* of $G$ on $X$ is a mapping $alpha : X times G to X$ (which we denote $x, g mapsto x g$) which satisfies the following two properties:
//   - *Identity*: $x e = x$, for all $x in X$, where $e$ is the identity element of $G$.
//   - *Compatibility*: $x(g h) = (x g) h$ for all $g, h in G$ and $x in X$.
// ]
//
// #definition(title: [Orbit])[
//   If there is a left action of $G$ on $X$, then the set
//   $ cal(O)_x := { g x in X : g in G } $
//   is called the orbit of the element $x in X$.
// ]
//
// Unfinished, probably unnecessary

== Determinant

#definition[
  $[v_1 dots.c v_n]$ is the matrix whose $j$th column is $v_j$.

  $|v_1 dots.c v_n|$ is the determinant of said matrix.
]

#definition(title: [Determinant of a linear operator])[
  For $T in cal(L)(V)$, the *determinant* of $T$ is the unique scalar such that $M_T := M compose T = (det T) M$ for all $M in V_("alt")^((dim V))$.
]

#definition(title: [Determinant of a square matrix])[
  Let $n$ be a positive integer, $A$ be an $n times n$ matrix with entries in $F$, and $T in cal(L)(F^n)$ be the operator whose matrix with respect to the standard basis of $F^n$ is $A$. Then the determinant of $A$ is $det A := det T$.
]

#lemma[
  Let $(v_1, dots, v_n)$ be an ordered $n$-tuple of column vectors. Then the map $(v_1, dots, v_n) mapsto |v_1 dots.c v_n|$ is an alternating $n$-linear form on $F^n$.
]

#lemma(title: [$O(n!)$ method for calculating determinant])[
  If $A$ is an $n times n$ matrix,
  $ det A = sum_(sigma in S_n) op("sgn")(sigma) A_(sigma(1) 1) dots.c A_(sigma(n) n) $
]

#theorem(title: [Cofactor method (also $O(n!)$)])[
  Let $A$ be an $n times n$ matrix. Define $A[i|j]$ to be the result of removing the $i$th row and $j$th column from $A$. Define the *$i j$-cofactor* of $A$ to be
  $ C_(i j) := (-1)^(i+j) det(A[i|j]) $

  Then for any row numbered $i$,
  $ det A = sum_(k=1)^n A_(i k) C_(i k) $

  And for any column numbered $j$,
  $ det A = sum_(k=1)^n A_(k j) C_(k j) $

  Note that the coefficient $(-1)^(i+j)$ in $C_(i j)$ forms the following pattern:
  $ mat(
    +, -, +, dots.c;
    -, +, -, dots.c;
    +, -, +, dots.c;
    dots.v, dots.v, dots.v, dots.down;
  ) $
]

#lemma[
  If $A$ is a triangular matrix with $lambda_1, dots, lambda_n$ on the diagonal, then $det A = lambda_1 dots.c lambda_n$ ($det A$ is the product of the elements on the diagonal).
]

== Properties of the determinant

#theorem(title: [Determinant is multiplicative])[
  - If $S, T in cal(L)(V)$, then $det(S T) = (det S)(det T)$.
  - If $A$ and $B$ are $n times n$ matrices, then $det(A B) = (det A)(det B)$.
]

#theorem[
  A linear operator $T in cal(L)(V)$ is an isomorphism iff $det T != 0$.

  If $T$ is an isomorphism, then $det(T^(-1)) = (det T)^(-1)$.
]

#theorem[
  The following are equivalent:
  - $A$ is invertible.
  - $det A != 0$.
  - The homogeneous system $A X = 0$ has only the unique solution.
]

#theorem(title: [Determinant is similarity invariant])[
  Let $T in cal(L)(V)$ and $S : W to V$ be an invertible linear map. Then
  $ det(S^(-1) T S) = det T $
]

#theorem[
  For all $T in cal(L)(V)$, $det T = det [T]$, where $[T]$ is the matrix of $T$ with respect to any basis of $V$.
]

#theorem[
  If $A$ is a square matrix, or if $A in cal(L)(V)$, then
  $ det(A^T) = det(A) $
]

#theorem(title: [Effect of row and column operations on the determinant])[
  Let $A$ be an $n times n$ matrix.
  - If two rows or columns of $A$ are equal, then $det A = 0$.
  - If $B$ is the result of swapping two rows or columns of $A$, then $det B = -det A$.
  - If $B$ is the result of multiplying one row or column of $A$ by the scalar $lambda$, then $det B = lambda det A$
  - If $B$ is the result of replacing a column or row by the sum of itself and a scalar multiple of another column or row, then $det B = det A$. (this does not apply adding a column to a scalar multiple of a row or vice-versa.)
]

#theorem(title: [Effect of elementary row operations (summary)])[
  Let $A$ be an $n times n$ matrix.
  - *Scaling*: $R_i mapsto c R_i implies det B = c det A$.
  - *Replacement*: $R_i mapsto R_i + c R_j implies det B = det A$
  - *Interchange*: $R_i arrow.l.r R_j implies det B = -det A$
]

#procedure(title: [$O(n^3)$ procedure for finding determinant])[
  Row-reduce the matrix $A$ to row-echelon form ($R := op("REF")(A)$). Then $det R$ is the product of the items along the diagonal of $R$. To find $det A$, apply the above theorems.
]

== Cramer's rule

#definition(title: [Adjugate matrix])[
  Let $A$ be an $n times n$ matrix. Then the adjugate matrix of $A$ is the transpose of the matrix of cofactors, i.e.
  $ op("adj") A = C^T $

  where $C$ is defined by
  $ C_(i j) = (-1)^(i+j) det(A[i|j]) $
]

#lemma[
  Let $A$ be an invertible $n times n$ matrix. Then
  $ A^(-1) = 1/(det A) op("adj") A $
]

#theorem(title: [Cramer's Rule])[
  Let $A$ be an invertible $n times n$ matrix. For any $arrow(b) in Reals^n$, the unique solution $arrow(x)$ of the linear system $A arrow(x) = arrow(b)$ has entries given by
  $ x_i = (det A_i (arrow(b)))/(det A) $
  where $A_i (arrow(b))$ is the result of replacing the $i$th column of $A$ by $arrow(b)$.
]

= Eigenvalues and eigenvectors

== Eigenvalues and eigenvectors

#theorem(title: [Diagonality condition])[
  Let $V$ be a finite-dimensional vector space, $B = (v_1, dots, v_n)$ be an ordered basis for $V$, and $T in cal(L)(V)$. Then $[T]_B$ is diagonal iff $T(v_i) = lambda_i v_i$ for all $i$, where $lambda_i$ is the $i$th element along the diagonal of $[T]_B$.
]

#definition(title: [Eigenvalue, eigenvector of a linear operator])[
  Let $V$ be a vector space and $T in cal(L)(V)$. An *eigenvalue* of $T$ is a scalar $lambda$ s.t. there exists a nonzero vector $v in V$ s.t.
  $ T(v) = lambda v $

  The vector $v$ is the *eigenvector* of $T$ associated with the eigenvalue $lambda$.
]

#lemma[
  If $v$ is an eigenvector of $T$ associated with eigenvalue $lambda$ and if $B$ is a basis of $V$, then
  $ [T(v)]_B = lambda [v]_B $
]

#definition(title: [Eigenvalue, eigenvector of a square matrix])[
  An *eigenvalue* of the $n times n$ matrix $A$ is a scalar $lambda$ s.t. there exists a nonzero vector $v in Reals^n$ s.t.
  $ A v = lambda v $

  The vector $v$ is the *eigenvector* of $A$ associated with the eigenvalue $lambda$.
]

#lemma[
  Similar matrices have the same eigenvalues.

  Any matrix representing $T in cal(L)(V)$ has the same eigenvalues as $T$.
]

#definition(title: [Eigenspace])[
  A scalar $lambda$ is an eigenvalue of $A$ iff $A v = lambda v$ has a nontrivial solution. This is equivalent to the homogeneous linear system (where $I$ is the $n times n$ identity matrix)
  $ (A - lambda I) v = 0 $

  The set of all solutions to this equation is the *eigenspace* of $A$ associated to the eigenvalue $lambda$, which we denote by $E_lambda$.
]

#lemma[
  If $A in Reals^(n times n)$, then the eigenspace of $A$ corresponding to $lambda$ is a subspace of $Reals^n$.
]

#lemma[
  Let $A$ be an $n times n$ matrix. Then $det(lambda I - A)$ is a monic (leading coefficient 1) polynomial of degree $n$ on $lambda$.
]

#definition[
  For any $n times n$ matrix $A$, the monic, degree $n$ polynomial $det(lambda I - A)$ is the *characteristic polynomial* of $A$. The equation
  $ det(lambda I - A) = 0 $
  is the *characteristic equation* of $A$.
]

#lemma[
  Similar matrices have the same characteristic equation.
]

#lemma[
  The eigenvalues of a triangular matrix are the entries on the main diagonal.
]

#theorem(title: [Rational root theorem])[
  Let $p(x) = a_n x^n + a_(n-1) x^(n-1) + dots.c + a_1 x + a_0$ be a degree-$n$ polynomial with integer coefficients. If $x = p/q$ is a rational root of $p(x)$, then $a_0$ is divisible by $p$ and $a_n$ is divisible by $q$.
]

#procedure(title: [Computing eigenvalues])[
  Firstly, if the matrix is triangular, then the eigenvalues are the entries on the main diagonal.

  Otherwise, solve the characteristic equation for $lambda$ to get the eigenvalues:
  $ det(lambda I - A) = 0 $

  Plug each eigenvalue into the equation
  $ (A - lambda I) v = 0 $
  and the solution set is the eigenspace. Pick any vector in the eigenspace to be your eigenvector.
]

== Diagonalizable operators

#definition(title: [Diagonalizable operator])[
  A linear operator $T in cal(L)(V)$ is said to be diagonalizable if there exists a basis consisting of eigenvectors of $T$. Such a basis is called an *eigenbasis*.
]

#lemma[
  If $T in cal(L)(V)$, then every set of eigenvectors corresponding to distinct eigenvalues of $T$ is linearly independent.
]

#lemma[
  If $dim V = n$ and $T in cal(L)(V)$ has $n$ distinct eigenvalues, then $T$ is diagonalizable.
]

#definition(title: [Multiplicity of a root of a polynomial])[
  Let $p(x)$ be a polynomial. Then an element $a in F$ is a root of multiplicity $k$ iff there exists a polynomial $s(x)$ such that $s(a) != 0$ and $p(x) = (x - a)^k s(x)$.
]

#definition(title: [Algebraic multiplicity])[
  The algebraic multiplicity of the eigenvalue $lambda_k$ is the multiplicity of $lambda_k$ as a root of the characteristic polynomial of $A$.
]

#definition(title: [Geometric multiplicity])[
  The geometric multiplicity of the eigenvalue $lambda_k$ is the dimension of the eigenspace corresponding to $lambda_k$.
]

// #lemma[
//   For all eigenvalues $lambda_k$, its geometric multiplicity is less than or equal to its algebraic multiplicity.
// ]
//
// #lemma[
//   Suppose $T in cal(L)(V)$ and $lambda_1, dots, lambda_n$ are distinct eigenvalues of $T$. Then
//   $ E_(lambda_1) plus.circle dots.c plus.circle E_(lambda_m) $
//   (the sum of the eigenspaces is a direct sum). Furthermore, if $V$ is finite-dimensional, then
//   $ dim E_(lambda_1) + dots.c + dim E_(lambda_m) <= dim V $
// ]

#theorem(title: [Conditions equivalent to diagonalizability])[
  Let $V$ be a finite-dimensional vector space, $T in cal(L)(V)$, and $lambda_1, dots, lambda_n$ be the distinct eigenvalues of $T$. Then the following are equivalent:
  - $V$ has a basis consisting of eigenvectors of $T$
  - $V = E_(lambda_1) plus.circle dots.c plus.circle E_(lambda_m)$
  - $dim V = dim E_(lambda_1) + dots.c + dim E_(lambda_m)$
  - The geometric multiplicity of each eigenvector is equal to its algebraic multiplicity.
]

#procedure(title: [Diagonalizing a linear operator])[
  Let $T in cal(L)(V)$. Choose an ordering $B = (v_1, v_2, dots, v_n)$ of the eigenvectors of $T$, corresponding to the eigenvalues $lambda_1, lambda_2, dots, lambda_n$. Then $[T]_B$, the diagonalization of $T$, the matrix of $T$ with respect to $B$, is
  $ mat(
    lambda_1, 0, dots.c, 0;
    0, lambda_2, dots.c, 0;
    dots.v, dots.v, dots.down, dots.v;
    0, 0, dots.c, lambda_n;
  ) $
]

== Powers of a diagonalizable operator

#lemma[
  If $v$ is an eigenvector of $T$ with eigenvalue $lambda$ and $n$ is a positive integer, then $T^n v = lambda^n v$.
]

#lemma[
  If $T$ is diagonalizable, then there exists a basis $D$ such that the diagonalization of $T$ is equal to
  $ [T]_D = C_(e to D) [T]_e C_(D to e) $
  (where $C_(e to D)$ is the transition matrix from the standard basis to $D$)

  Furthermore, for any positive integer $n$,
  $ [T]_e^n = C_(D to e) [T]_D^n C_(e to D) $
]

#procedure(title: [Power of a diagonal matrix])[
  Let $D$ be a diagonal matrix equal to
  $ mat(
    lambda_1, 0, dots.c, 0;
    0, lambda_2, dots.c, 0;
    dots.v, dots.v, dots.down, dots.v;
    0, 0, dots.c, lambda_n;
  ) $

  Then $D^n$ is equal to
  $ mat(
    lambda_1^n, 0, dots.c, 0;
    0, lambda_2^n, dots.c, 0;
    dots.v, dots.v, dots.down, dots.v;
    0, 0, dots.c, lambda_n^n;
  ) $
]

= Inner product spaces

== Inner product

#see[Trimm 7.1]

#definition(title: [Positive definite])[
  A map $f : V times V to F$ is positive definite iff for any $v in V$ where $v != 0$,
  $ f(v, v) > 0 $
  and $f(0, 0) = 0$.
]

#definition(title: [Inner product on a real vector space])[
  Let $V$ be a real vector space. Then an inner product on $V$ is a positive definite symmetric bilinear form on $V$.

  The inner product of $v, w in V$ is denoted $(v, w)$.
]

#definition(title: [Dot product on $Reals^n$])[
  The dot product is the mapping that maps $x, y in Reals^n$ to the real number
  $ x dot y = sum_(i=1)^n x_i y_i $

  It is an inner product on $Reals^n$, and satisfies the following properties for any $v, w, x in V$:
  - $(c v + w) dot x = c v dot x + w dot y$
  - $v dot w = w dot v$
  - $x dot (c v + w) = c x dot v + x dot w$
  - $|v| = sqrt(v dot v)$
]

#definition(title: [Complex conjugate])[
  The complex conjugate of the complex number $a + b i$ is
  $ overline(a + b i) = a - b i $
]

#definition(title: [Conjugate-linear map])[
  A map $f : V to W$ where $V$ and $W$ are complex vector spaces is conjugate-linear iff for all $x, y in V$, $s in Complex$,
  - *Additivity*: $f(x + y) = f(x) + f(y)$
  - *Conjugate homogeneity*: $f(s x) = overline(s) f(x)$

  A conjugate-linear map is a type of *semilinear map*.
]

#definition(title: [Sesquilinear map])[
  A map $f : V times V to W$ which is linear in the first argument and semilinear in the second argument.

  Iff it is conjugate-linear in the second argument, for all $z_1, z_2 in Complex^n$, $c in Complex$,
  $ f(w, c z_1 + z_2) = overline(c) f(w, z_1) + f(2, z_2) $
]

#definition(title: [Inner product on a complex vector space])[
  Let $V$ be a complex vector space. Then an inner product on $V$ is a positive-definite sesquilinear form on $V$.
]

#definition(title: [Dot product on $Complex^n$])[
  The dot product is the mapping that maps $z, w in Complex^n$ to the complex number
  $ z dot w = sum_(i=1)^n z_i overline(w_i) $

  It is an inner product on $Complex^n$, and satisfies the following properties for any $v, w, x in V$:
  - $(c v + w) dot x = c v dot x + w dot y$
  - $v dot w = overline(w dot v)$
  - $x dot (c v + w) = overline(c) x dot v + x dot w$
  - $|v| = sqrt(v dot v)$
]

#definition(title: [Inner product space])[
  A vector space $V$ together with an inner product on $V$.
]

== Orthogonality

#see[Trimm 7.1]

For this section, let $V$ be an inner product space.

#definition(title: [Orthogonality])[
  Two vectors $u, v in V$ are orthogonal iff $(u, v) = 0$.
]

#lemma[
  0 is orthogonal to all vectors.
]

#theorem(title: [Pythagorean Theorem])[
  If $u, v in V$ are orthogonal, then
  $ |u + v|^2 = |u|^2 + |v|^2 $
]

#theorem(title: [Orthogonal decomposition])[
  Let $u, v in V$. Then $u$ can be uniquely decomposed as
  $ u = u_parallel + u_perp $
  where $u_parallel parallel v$ and $u_perp perp v$.
]

#theorem[
  For all $u, v in V$,
  - *Cauchy-Schwarz inequality*: $|(u, v)| <= |u| |v|$
  - *Triangle Inequality*: $|u + v| <= |u| + |v|$
  - *Reverse Triangle Inequality*: $abs(|u| - |v|) <= |u - v|$
  - *Parallelogram Law*: $|u + v|^2 + |u - v|^2 = 2(|u|^2 + |v|^2)$
]