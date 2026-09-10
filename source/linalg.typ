#import "@local/ethan-standard-style:0.1.0": *
#show: ekactl-style.with(
	section-number: 6,
	title: "Linear algebra"
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

#let Field = sym.FF

#let Sphere = sym.SS

#let dun = math.union.sq // disjoint union
#let cl = math.overline // closure
#let indmap = math.overline // induced
#let ior = math.degree // interior

#let Riemann = $cal(R)$

#let card = math.op("card")

#let int = math.integral
#let oint = math.integral.cont
#let iint = math.integral.double
#let oiint = math.integral.surf
#let iiint = math.integral.triple
#let oiiint = math.integral.vol
#let iiiint = math.integral.quad

#let partial = math.upright(math.partial)
#let bound = partial // boundary

#set math.vec(delim: "[")
#set math.mat(delim: "[")

#let infty = math.infinity

#let vn = math.arrow // vec name

#let cross = math.times

#let detmat(..rows) = math.mat(..rows, delim: "|")

#let grad = math.nabla

#let Derivative = $upright(D)$
#let Jacobian = $upright(J)$
#let transpose = $upright(T)$
#let Hessian = $upright(H)$

#let div = math.op("div")
#let curl = math.op("curl")

#let RREF = math.op("RREF")
#let span = math.op("span")

#let dirsum = math.limits(sym.plus.o)

#let linmaps = $cal(L)$

Let $Field$ be a field. It's possible that some things in here require $Field = Reals$ or $Field = Complex$; if it does and it's not marked it should be considered a bug.

= Fields

#definition(title: [Field properties])[
	The following properties:

	#theorem(title: [Properties of addition])[
		For all $x, y, z in Field$:
		- (A1) Commutativity: $x + y = y + x$
		- (A2) Associativity: $(x + y) + z = x + (y + z)$
		- (A3) Identity: $exists 0 in Reals$ s.t. $0 + x = x$
		- (A4) Additive inverse: For $x in Field$, $exists -x in Field$ s.t. $x + (-x) = 0$
	]

	#theorem(title: [Properties of multiplication])[
		For all $x, y, z in Field$:
		- (M1) Commutativity: $x y = y x$
		- (M2) Associativity: $(x y) z = x (y z)$
		- (M3) Identity: $exists 1 in Reals$ s.t. $1 x = x$ and $1 != 0$
		- (M4) Additive inverse: For $x in Field setminus {0}$, $exists x^(-1) in Field$ s.t. $x x^(-1) = 1$
	]

	#theorem(title: [Distributive property])[
		- (D) $x(y + z) = x y + x z$ for all $x, y, z in Field$.
	]
]

#definition(title: [Field])[
	A set $Field$ which defines the following two operations:
	- Addition: an operation that maps $x, y in Field to c in Field$ and satisfies the properties of addition
	- Multiplication: an operation that maps $x, y in Field to c in Field$ and satisfies the properties of multiplication

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

= Vector spaces

== Vector spaces

#definition(title: [Vector space])[
	A vector space over $Field$ is a set $V$ with the following operations:
	- *Vector addition*: $u in V, v in V mapsto (u + v) in V$, which satisfies the properties of addition
	- *Scalar multiplication*: $alpha in Field, v in V mapsto alpha v in V$, which satisfies the properties of scalar multiplication
]

#definition(title: [Properties of addition])[
	For all $u, v, w in V$:
	- (A1) Commutativity: $u + v = v + u$
	- (A2) Associativity: $(u + v) + w = u + (v + w)$
	- (A3) Identity: $exists 0 in Reals$ s.t. $0 + u = u$
	- (A4) Additive inverse: For $u in Field$, $exists -u in Field$ s.t. $u + (-u) = 0$
]

#definition(title: [Properties of scalar multiplication])[
	For all $alpha, beta in Field$, $v, w in V$:
	- (S1) Associativity: $(alpha beta) v = alpha (beta v)$
	- (S2) Distributivity over scalar addition: $(alpha + beta) v = alpha v + beta v$
	- (S3) Distributivity over vector addition: $alpha (v + w) = alpha v + alpha w$
	- (S4) Multiplicative identity: $1 v = v$
]

#theorem[
	$Field^n$ is a vector space.
]

#theorem[
	All inverses and identities are unique in a vector space.
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
	- (ii) $alpha in Field$ and $w_1, w_2 in W$ implies $alpha w_1 + w_2 in W$

	Typically, we prove (i) by proving that $0 in W$.
]

== Subspaces of $Field^n$ <sec:vecspace:subspace-Fn>

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
	If $V_1, dots, V_n$ are subspaces of $V$ such that each element of $limits(+)_(k=1)^n V_k = V_1 + dots.c + V_n$ can be written uniquely as $sum_(k=1)^n v_k = v_1 + dots.c + v_n$ where $v_k in V_k$, then $limits(+)_(k=1)^n V_k$ is a *direct sum* and can be written as $dirsum_(k=1)^n V_k = V_1 dirsum dots.c dirsum V_n$.
]

#theorem[
	Let $V_1, dots, V_n$ be subspaces of $V$. Then they are direct sums iff the only way to write $0 = v_1 + dots.c + v_n$ is to take $v_1 = dots.c = v_n = 0$.
]

#theorem[
	If $U$ and $W$ are subspaces of $V$, then $U + W$ is a direct sum iff $U inter W = {0}$. This does not generalize to higher numbers of subspaces.
]

== Spanning <sec:vecspace:span>

#definition(title: [Linear combination])[
	A linear combination of a collection $v_1, dots, v_n$ of vectors in vector space $V$ is a vector of the form
	$ alpha_1 v_1 + dots.c + alpha_n v_n $
	where each $alpha_k in Field$.
]

#definition(title: [Span])[
	Given $W subset.eq V$ where $V$ is a vector field, the set of all linear combinations of vectors in $W$ is called the span of $W$.
	$ op("span")(W) := { sum_(i=1)^n alpha_i w_i : alpha_i in Field, w_i in W } $

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

== Basis <sec:vecspace:basis>

#definition(title: [Basis])[
	A basis of $V$ is a subset of $V$ which is linearly independent and spans $V$.
]

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


== Example vector spaces

#definition(title: [$Field^n$])[
	For a field $Field$, $Field^n$ is the set of all ordered $n$-tuples of elements of $Field$:
	$ Field^n := { (x_1, dots, x_n) : x_1, dots, x_n in Field } $

	where addition and scalar multiplication are defined as expected:
	$ a + b &:= (a_1 + b_1, dots, a_n + b_n) \
		alpha x &:= (alpha x_1, dots, alpha x_n) $
	
	This is an $n$-dimensional vector space over $Field$.

	Its standard ordered basis is
	$ ( vec(1, 0, dots.v, 0), vec(0, 1, dots.v, 0), dots.c, vec(0, 0, dots.v, 1) ). $

	The standard basis vectors are called $hat(i)$, $hat(j)$, $hat(k)$ for $n <= 3$, and called $hat(e)_1, dots, hat(e)_n$ for any $n$.
]

#definition(title: [$Field^omega$])[
	The set of all sequences of elements of $Field$:
	$ Field^omega := { (x_1, x_2, dots) : x_k in Field "for" k in Naturals } $
	where addition and scalar multiplication are defined similarly to $Field^n$:
	$ a + b &:= (a_1 + b_1, dots, a_n + b_n) \
		alpha x &:= (alpha x_1, dots, alpha x_n) $

	This is 
]

#definition(title: [$Field^(m times n)$])[
	The set of all $m times n$ matrices with entries in $Field$, where addition and scalar multiplication are defined as:
	$ (A + B)_(i j) &:= A_(i j) + B_(i j) \
		(alpha A)_(i j) &:= alpha A_(i j) $

	$Field^(m times n)$ is a vector space of dimension $m n$.

	$Field^(m times n)$ is also denoted $M_(m times n)(Field)$, $op("Mat")(m, n; F)$, or similar notations.
]

#definition(title: [Vector space of functions])[
	Let $V$ be a vector space, $S$ be a set, and
	$ V^S = { f : S to V } $
	(the set of all functions that map members of $S$ to members of $V$). Then $V^S$ is a vector space, if we define for all $p, q in V^S$, $s in Field$,

	$ (f + g)(s) = f(s) + g(s) quad (alpha f)(s) = alpha (f(s)) $
]

#definition(title: [Polynomial])[
	A function $p : Field to Field$ is a polynomial of degree $n$ iff there exist $c_0, dots c_n in Field$ such that
	$ p(x) = c_0 + c_1 x + c_2 x^2 + dots.c c_n x^n = sum_(k=0)^n c_k x^k $

	$cal(P)(Field)$ is the set of all polynomials of any degree with coefficients in $Field$. $cal(P)_n (Field)$ is the set of all polynomials of degree $n$ with coefficients in $Field$.

	$cal(P)(Field)$ and $cal(P)_n (Field)$ are vector spaces if we define for all $p, q in cal(P)_n (Field)$, $s in Field$,

	$ (p + q)(s) = p(s) + q(s) quad (alpha p)(s) = alpha (p(s)) $
]

= Linear maps

== Linear map

#definition(title: [Linear map])[
	Let $V$ and $W$ be vector spaces over $Field$. A *linear map* (also called *linear function* or *linear transformation*) from $V$ to $W$ is a function $T : V to W$ with the two properties
	$ T(v_1 + v_2) &= T v_1 + T v_2 && "(additivity)" \
		T(alpha v) &= alpha T v && "(homogeneity)" $
	Equivalently, it is a function with the property that
	$ T(alpha v_1 + v_2) = alpha T v_1 + T v_2 $
	Equivalently, it is a function with the property that
	$ T(alpha_1 v_1 + alpha_2 v_2) = alpha_1 T v_1 + alpha_2 T v_2 $
]

*Note:* Not all elementary linear functions $y = m x + b$ are linear maps! All linear maps in $Field^1$ are of the form $y = m x$.

#definition(title: [Linear operator])[
	A function $T : V to V$ which is a linear map.
]

#definition(title: [$linmaps$])[
	For any vector spaces $V$ and $W$, $linmaps(V,W)$ is the set of all linear maps from $V$ to $W$.

	$linmaps(V) := linmaps(V,V)$.

	$linmaps(V,W)$ is also called $"Hom"(V,W)$.
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

#theorem(title: [$linmaps(V,W)$ is a vector space])[
	If we define
	$ (S + T)(v) &:= S + T \
		(alpha T)(v) &:= alpha T(v) $
	for $S, T in linmaps(V,W)$, $alpha in Field$, then $linmaps(V,W)$ is a vector space and is a subspace of $V^W$.
]

#definition(title: [Product of linear maps])[
	If $T in linmaps(U, V)$ and $S in linmaps(V, W)$, then we define the product $S T in linmaps(V, W)$ by $S T := S compose T$.
]

#theorem(title: [$linmaps(V)$ is a unital associative F-algebra])[
	The product of linear maps on $V$ has the following properties:
	- *Bilinearity*: For all $S, T_1, T_2 in linmaps(V)$, $alpha in Field$,
		- $S(T_1 + T_2) = S T_1 + S T_2$
		- $(S_1 + S_2) T = S_1 T + S_2 T$
		- $(alpha S) T = alpha(S T) = S(alpha T)$
	- *Associativity*: $(R S) T = R(S T)$ for all $R, S, T in linmaps(V)$
	- *Identity* (_unital_): $I T = T I = T$ for all $T in linmaps(V)$, where $I$ is the identity map $x mapsto x$.

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

== Invertible linear maps

// TODO, see Axler 3D

== Isomorphisms

#definition(title: [Bijective])[
	Injective and surjective.
]

#definition(title: [Isomorphism])[
	Let $V$ and $W$ be vector spaces over $Field$. An *isomorphism from $V$ to $W$* is a bijective linear map $T : V to W$. Iff there exists an isomorphism from $V$ to $W$, $V$ and $W$ are *isomorphic*, which is denoted by $V tilde.equiv W$.
]

#definition(title: [Identity map])[
	The identity map $id_V : V to V$ is defined such that
	$ id_V (v) = v quad "for" v in V $
]

#theorem(title: [Isomorphism is an equivalence relation])[
	- *Reflexive*: For any vector space $V$, $id_V : V to V$ is an isomorphism, i.e. $V tilde.equiv V$ for every $V$.
	- *Symmetric*: If $T : V to W$ is an isomorphism, then $T^(-1) : W to V$ is also an isomorphism. Thus, $V tilde.equiv W$ implies $W tilde.equiv V$.
	- *Transitive*: If $T_1 : U to V$ and $T_2 : V to W$ are isomorphisms, then $T_2 T_1 : U to W$ is an isomorphism. Thus, $U tilde.equiv V$ and $V tilde.equiv W$ implies $U tilde.equiv W$

	Therefore, isomorphism is an equivalence relation on the collection of all vector spaces over $Field$.
]

#definition(title: [Isomorphism class])[
	The isomorphism class $[V]$ of a vector space $V$ is the set of all vector spaces isomorphic to $V$.
]

#lemma[
	Any two isomorphism classes are disjoint or equal.
]

#theorem[
	Two finite-dimensional vector spaces over $Field$ are isomorphic iff they have the same dimension.

	Equivalently, any finite-dimensional vector space $V$ over $Field$ is isomorphic to $Field^(dim V)$.
]

#theorem[
	If $V$ and $W$ are finite-dimensional vector spaces of the same dimension and $T : V to W$ is a linear map, then if $T$ is injective or surjective, it is an isomorphism.
]

#lemma[
	$cal(P)_n (Field) tilde.equiv Field^(n+1)$.
]

= Linear systems and matrix arithmetic

Having developed linear maps abstractly, we now fix bases and see how they correspond exactly to matrices, then specialize to $Field^n$, where the central object of study is a system $A X = Y$.

== Matrices

#see[#link("https://linear.axler.net/LADR4e.pdf#page=85")[Axler [3C]]]

#definition[
	An $m times n$ matrix is a rectangular array of numbers with $m$ rows and $n$ columns.
	$ A = mat(
		a_11, a_12, dots.h, a_(1n);
		a_21, a_22, dots.h, a_(2n);
		dots.v, dots.v, dots.down, dots.v;
		a_(m 1), a_(m 2), dots.h, a_(m n);
	) $
	$a_(i j)$ is in the $i$th row and $j$th column of $A$.
]

#definition(title: [Matrix sum and scalar product])[
	Given $m times n$-matrices $A$ and $B$, their sum $A + B$ is
	$ A + B := mat(
		a_11 + b_11, a_12 + b_12, dots.h, a_(1n) + b_(1n);
		a_21 + b_21, a_22 + b_22, dots.h, a_(2n) + b_(2n);
		dots.v, dots.v, dots.down, dots.v;
		a_(m 1) + b_(m 1), a_(m 2) + b_(m 2), dots.h, a_(m n) + b_(m n);
	). $
	Addition is only defined if $A$ and $B$ have the same number of rows and columns.

	If $c in Field$, the scalar product $c A$ is
	$ c A := mat(
		c a_11, c a_12, dots.h, c a_(1n);
		c a_21, c a_22, dots.h, c a_(2n);
		dots.v, dots.v, dots.down, dots.v;
		c a_(m 1), c a_(m 2), dots.h, c a_(m n);
	). $
]

#definition(title: [Column, row vector])[
	A column vector is an $m times 1$-matrix. A row vector is a $1 times n$-matrix.
]

#definition(title: [Transpose of a matrix])[
	If $A$ is an $m times n$ matrix, then its transpose $A^transpose$ is the $n times m$ matrix obtained by interchanging the rows and columns of $A$:
	$ [A^transpose_(i j)] = [A_(j i)] $
] <def:matrix-transpose>

#remark[
	The transpose of a column vector is a row vector and vice versa.
]

== Coordinates

#see[#link("https://raw.githubusercontent.com/ethanc8/ekactl-references/trunk/linalg/trimm/unit-4/4.5%20Matrix%20of%20a%20Linear%20Map.pdf")[Trimm [4.5]], #link("https://raw.githubusercontent.com/ethanc8/ekactl-references/trunk/linalg/karthik/4_5.pdf")[Karthik [4.5]]]

#definition(title: [Ordered basis])[
	An ordered basis of a $n$-dimensional vector space $V$ is an $n$-tuple which is an ordering of a basis of $V$.
]

For the following definitions, let $B := ( v_1, dots, v_n )$ be an ordered basis of $V$, where $V$ is an $n$-dimensional vector space over $Field$.

#definition(title: [Linear combination map (basis isomorphism)])[
	The *linear combination map* or *basis isomorphism* is the isomorphism $L_B : Field^n to V$ defined by
	$ L_B (arrow(x)) = x_1 v_1 + dots.c + x_n v_n $
]

#definition(title: [Coordinate isomorphism])[
	The *coordinate isomorphism* is the isomorphism $L_B^(-1) : V to Field^n$.

	This means that for any vector space, its vectors can be expressed as vectors in $Field^n$.
]

#definition(title: [Coordinate vector])[
	Let $v$ be a vector in $V$. Then the coordinate vector $[v]_B in Field^n$ of $v$ is defined as
	$ [v]_B := L_B^(-1)(v) $

	Equivalently, it is the vector such that
	$ L_B ([v]_B) = v $
]

== Matrix of a linear map

#see[#link("https://linear.axler.net/LADR4e.pdf#page=83")[Axler [3C]], #link("https://raw.githubusercontent.com/ethanc8/ekactl-references/trunk/linalg/trimm/unit-4/4.5%20Matrix%20of%20a%20Linear%20Map.pdf")[Trimm [4.5]], #link("https://raw.githubusercontent.com/ethanc8/ekactl-references/trunk/linalg/karthik/4_5.pdf")[Karthik [4.5]]]

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
	The matrix of a linear map $T : Field^n to Field^m$ with respect to the standard bases of $Field^n$ and $Field^m$.
] <def:standard-matrix>

#theorem[
	Suppose $S, T in linmaps(V, W)$. Then $[S + T] = [S] + [T]$.

	Suppose $lambda in Field$ and $T in linmaps(V, W)$. Then, $[lambda T] = lambda [T]$.
]

#remark[
	Every $m times n$ matrix $A$ is the standard matrix of the linear map $T_A : Field^n to Field^m$, $T_A (X) := A X$ (matrix-vector multiplication is defined precisely in @def:matrix-vector-mult below). This is the correspondence that lets us study the abstract map $T_A$ purely as concrete array arithmetic on $A$, and it's the reason $ker T_A$ (equivalently, the null space $op("Nul") A$) is exactly the solution set of the homogeneous system $A X = 0$.
]

== Linear systems

#see[#link("https://raw.githubusercontent.com/ethanc8/ekactl-references/trunk/linalg/math257/CompleteLectureNotes--Filled.pdf#Outline0.1")[MATH 257 [Module 1]], Trimm [#link("https://github.com/ethanc8/ekactl-references/raw/trunk/linalg/trimm/unit-1/1.1%20Linear%20Equations.pdf")[1.1], #link("https://github.com/ethanc8/ekactl-references/raw/trunk/linalg/trimm/unit-1/1.2%20Elimination.pdf")[1.2], #link("https://github.com/ethanc8/ekactl-references/raw/trunk/linalg/trimm/unit-1/1.3%20Elementary%20Row%20Operations.pdf")[1.3]]]

#definition(title: [Linear equation])[
	Let $V$ and $W$ be vector spaces over $Field$, let $T : V to W$ be a linear map, and let $y in W$. A #defname[linear equation] in the unknown $v in V$ is an equation of the form
	$ T v = y. $

	When $V = Field^n$ and $W = Field$ (so $T$ is a linear functional on $Field^n$), writing the standard matrix of $T$ (@def:standard-matrix) as the row $[a_1 quad dots.c quad a_n]$ and $v = (x_1, dots, x_n)$, this recovers the familiar scalar form
	$ sum_k a_k x_k = y. $

	A #defname[solution] to $T v = y$ is an element $s in V$ such that $T s = y$.
]

#definition(title: [Linear system])[
	A #defname[linear system] is a finite collection of linear equations
	$ T_1 v = y_1, quad dots, quad T_m v = y_m $
	sharing the same unknown $v in V$, where each $T_j : V to W_j$ is a linear map and each $y_j in W_j$.

	A #defname[solution] to the system is an $s in V$ that solves every equation simultaneously, i.e. $T_j s = y_j$ for all $j$.
]

#theorem(title: [Combining linear maps into one])[
	Let $T_k : V to W_k$ be linear maps for $k = 1, dots, m$. Then
	$ T : V to W_1 times dots.c times W_m, quad T v := (T_1 v, dots, T_m v) $
	is linear, and for any $Y = (y_1, dots, y_m) in W_1 times dots.c times W_m$,
	$ T v = Y quad "iff" quad T_k v = y_k "for every" k. $
] <thm:combine-linear-maps>

#corollary(title: [A linear system is a single linear equation])[
	A linear system $T_1 v = y_1, dots, T_m v = y_m$ has the same solution set as the single linear equation
	$ T v = Y $
	where $T : V to W_1 times dots.c times W_m$ is defined by $T v := (T_1 v, dots, T_m v)$ and $Y := (y_1, dots, y_m) in W_1 times dots.c times W_m$.
]

#remark[
	When $V = Field^n$ and all $W_k = Field$, this is exactly how a linear system becomes the matrix equation $A X = Y$ --- the standard matrix of $T$ is the $m times n$ matrix $A$ whose $j$th row is the standard matrix of $T_j$ --- i.e. gluing the equations' coefficient rows together. Concretely, if $m$ is the number of equations and $n$ the number of variables, the $j$th equation
	$ sum_(k=1)^n A_(j k) X_k = Y_j $
	glues into
	$ A = mat(A_11, dots.c, A_(1 n); dots.v, dots.down, dots.v; A_(m 1), dots.c, A_(m n))
		quad
		X = vec(X_1, dots.v, X_n)
		quad
		Y = vec(Y_1, dots.v, Y_m), $
	giving the compact form $A X = Y$. (Matrix-vector multiplication, which makes precise sense of $A X$, is defined in @def:matrix-vector-mult below.)
]

#remark[
	This is the "row" side of the same picture whose "column" side is @def:matrix-vector-mult: gluing $m$ scalar equations $T_j v = y_j$ *row-by-row* into $A$ builds the map $T = (T_1, dots, T_m) : V to Field^m$ above, while --- as the next section shows --- reading $A$'s *columns* as vectors and taking $A X$ to mean the linear combination $X_1 a_1 + dots.c + X_n a_n$ recovers the same equation $A X = Y$ from the span perspective. One matrix, two equivalent readings.
]

#definition(title: [Coefficient and augmented matrix])[
	Given a linear system with combined equation $T X = Y$ (equivalently $A X = Y$) and $V = Field^n$, its #defname[coefficient] matrix is the standard matrix $A$ of $T$, and its #defname[augmented] matrix is $[A | Y]$.
]

#definition(title: [Consistent linear system])[
	A system that has at least one solution.
]

#definition(title: [Equivalent linear systems])[
	Two systems are equivalent iff they have the same set of solutions.
]

== Matrix-vector multiplication

#see[#link("https://raw.githubusercontent.com/ethanc8/ekactl-references/trunk/linalg/math257/CompleteLectureNotes--Filled.pdf#Outline0.5")[MATH 257 [Module 5, Module 6]], #link("file:///home/ethan/Downloads/f26-math257--Lecture3.pdf")[Chuang [Lecture 3]]]

#definition(title: [Matrix-vector multiplication])[
	Let $X in Field^n$ and $A = display(mat(a_1, dots.c, a_n))$ be an $m times n$-matrix. We define the product $A X$ by
	$ A X := X_1 a_1 + X_2 a_2 + dots.c + X_n a_n. $

	- $A X$ is a linear combination of the columns of $A$ using the entries in $X$ as coefficients.
	- $A X$ is only defined if the number of entries of $X$ is equal to the number of columns of $A$.
] <def:matrix-vector-mult>

#remark[
	Solving linear systems is the same as finding linear combinations: solving $A X = Y$ means finding coefficients expressing $Y$ as a linear combination of $A$'s columns, i.e. finding $Y in span{a_1, dots, a_n}$ (span: see [Vector spaces]).
]

#theorem[
	Let $A = display(mat(vn(a)_1, dots.c, vn(a)_n))$ be an $m times n$ matrix and $vn(b) in Field^m$. For any $(x_1, dots, x_n) in Field^n$, the following are equivalent:
	- $(x_1, dots, x_n)$ is a solution of the vector equation $x_1 vn(a)_1 + dots.c + x_n vn(a)_n = vn(b)$
	- $vec(x_1, dots.v, x_n)$ is a solution of the matrix equation $A X = vn(b)$
	- $(x_1, dots, x_n)$ is a solution of the linear system with augmented matrix $[A | vn(b)]$
]

#corollary[
	The equation $A X = vn(b)$ has a solution iff $vn(b) in span{vn(a)_1, dots, vn(a)_n}$.
]

== Row operations

#see[#link("https://raw.githubusercontent.com/ethanc8/ekactl-references/trunk/linalg/math257/CompleteLectureNotes--Filled.pdf#Outline0.2")[MATH 257 [Module 2]], Trimm [#link("https://github.com/ethanc8/ekactl-references/raw/trunk/linalg/trimm/unit-1/1.3%20Elementary%20Row%20Operations.pdf")[1.3]]]

#definition(title: [Elementary row operations])[
	The elementary row operations are:

	- *Scaling:* $R_i mapsto c R_i$ where $c$ is a nonzero scalar.
	- *Replacement:* $R_i mapsto R_i + c R_j$ where $c$ is a scalar.
	- *Interchange:* Swap $R_i$ and $R_j$.
]

#theorem(title: [Elementary row operations are invertible])[
	For any elementary row operation $e$, there exists an elementary row operation $e^(-1)$ such that $e^(-1)(e(A)) = A$ for any matrix $A$.
]

#definition(title: [Row equivalence])[
	Two matrices are row-equivalent iff each can be derived from the other using a finite number of elementary row operations.
]

#remark[
	Each elementary row operation replaces an equation of the system by a linear combination of itself with (or a scalar multiple of, or a swap with) another equation — this is why row-equivalent augmented matrices give equivalent systems.
]

#theorem[
	If the augmented matrices of two linear systems are row equivalent, then the two systems are equivalent.
]

== Echelon forms

#see[#link("https://raw.githubusercontent.com/ethanc8/ekactl-references/trunk/linalg/math257/CompleteLectureNotes--Filled.pdf#Outline0.3")[MATH 257 [Lecture 3, 4]], Trimm [#link("https://raw.githubusercontent.com/ethanc8/ekactl-references/trunk/linalg/trimm/unit-1/1.4%20Row%20Echelon%20Matrices.pdf")[1.4]]]

#definition(title: [Row echelon form (REF)])[
	A matrix is in REF iff it satisfies:
	1. All nonzero rows are above all rows of all zeros.
	2. Each leading entry of a row is in a column to the right of the leading entry of the row above it.
	3. All entries in a column below a leading entry are zeros.
]

#definition(title: [Reduced row echelon form (RREF)])[
	A matrix is in RREF iff it is in REF and additionally satisfies:
	4. The leading entry in each nonzero row is 1.
	5. Each leading 1 is the only nonzero entry in its column
]

#definition[
	$RREF(A)$ is the unique matrix which is in RREF and is row-equivalent to $A$.
]

#definition(title: [Pivot position])[
	A location $A_(i j)$ where $RREF(A)_(i j)$ is a leading 1.
]

#definition(title: [Pivot column])[
	A column which contains a pivot position.
]

#definition(title: [Pivot])[
	A nonzero number at a pivot position.
]

#definition(title: [Leading variable, determined variable, basic variable, pivot variable])[
	A variable in a pivot column.
]

#definition(title: [Free variable])[
	A variable not in a pivot column.
]

#procedure(title: [Gauss-Jordan elimination])[
	#procedure(title: [Gaussian elimination])[
		Iterate through the pivot columns of $A$ from left to right.

		For each pivot column, use elementary row operations to ensure that:
		- the pivot position is nonzero
		- all entries in the column below the pivot position are zero
		This produces $op("REF")(A)$.
	]

	#procedure(title: [Jordan elimination])[
		Iterate through the pivot columns of $op("REF")(A)$ from right to left. For each pivot column, use elementary row operations to ensure that:
		- all other entries in the column other than the pivot are zero
		- the pivot is equal to 1.
		This produces $RREF(A)$.
	]
]

== Homogeneous linear systems

#definition(title: [Homogeneous linear system])[
	A system where $y_0 = y_1 = dots.c = y_m = 0$. It can be written as $A X = 0$.
]

#theorem(title: [Trivial solution])[
	For any homogeneous system, $x_0 = x_1 = dots.c = x_n = 0$ is a solution to the system. Therefore, all homogeneous systems are consistent.
]

#theorem[
	- If there are less equations than there are variables ($m < n$), then $A X = 0$ has an infinite number of solutions.
	- If there are an equal number of equations and variables, then $A$ is row-equivalent to the $n times n$ identity iff $A X = 0$ has only the trivial solution.
	- If there are more equations than there are variables ($m > n$), then
		$ RREF(A) = mat(
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
	To solve a homogeneous system, perform Gauss-Jordan elimination on $A$ so that $R = RREF(A)$. Then solve $R X = 0$. The variables which are not in pivot columns are free variables and may be set to any value, typically denoted $u_1, u_2, dots$.
]

== Inhomogeneous linear systems

#procedure(title: [Solution])[
	To solve an inhomogeneous system, perform Gauss-Jordan elimination on $A' = [A | Y]$ so that $R' = [R | Z] = RREF(A')$. Then solve $R X = Z$. Note that not all inhomogeneous systems are solvable (consistent).
]

#theorem[
	If $A$ is $m times n$ with more equations than variables ($m > n$), then there exists $Y in Field^m$ such that $A X = Y$ is inconsistent.
]

== Matrix multiplication

#see[#link("https://linear.axler.net/LADR4e.pdf#page=83")[Axler [3C]], #link("https://raw.githubusercontent.com/ethanc8/ekactl-references/trunk/linalg/math257/CompleteLectureNotes--Filled.pdf#Outline0.7")[MATH 257 [Module 7, 8]]]

#definition(title: [Matrix multiplication])[
	The matrix multiplication of the $m times n$ matrix $A$ and the $n times p$ matrix $B$ is made by dot-producting the rows of the first by the columns of the second:
	$ [A B_(i j)] = [A_(i *) dot B_(* j)] = [sum_(k=1)^n A_(i k) B_(k j)] $
] <def:matrix-mult>

#theorem[
	Let $A$ be an $m times n$ matrix and $B$ be an $n times p$ matrix. Then for every $x in Field^p$
	$ A(B x) = (A B) x. $
]

#lemma[
	Composing two linear maps $T_1$ and $T_2$ is equivalent to multiplying the matrices of the two linear maps:
	$ T_1 compose T_2 = [T_1][T_2] $
]

*Note.* Other ways to compute $A B$.

#procedure(title: [Row-Column Rule])[
	Let $A$ be $m times n$ and $B$ be $n times p$ such that
	$ A = mat(R_1; dots.v; R_m), quad "and" quad B = mat(C_1, dots.c, C_p). $
	Then
	$ A B = mat(
		R_1 C_1, dots.h, R_1 C_p;
		R_2 C_1, dots.h, R_2 C_p;
		dots.v, dots.down, dots.v;
		R_m C_1, dots.h, R_m C_p;
	) $
	and $(A B)_(i j) = R_i C_j = a_(i 1) b_(1 j) + a_(i 2) b_(2 j) + dots.c + a_(i n) b_(n j)$.
]

#procedure(title: [Outer Product Rule])[
	Let $A$ be $m times n$ and $B$ be $n times p$ such that
	$ A = mat(C_1, dots.c, C_n), quad "and" quad B = mat(R_1; dots.v; R_n). $
	Then
	$ A B = C_1 R_1 + dots.c + C_n R_n $
]

#definition[
	The identity matrix $I_n$ of size $n$ is defined as
	$ I_n = mat(
		1, 0, dots.h, 0;
		0, 1, dots.h, 0;
		dots.v, dots.v, dots.down, dots.v;
		0, 0, dots.h, 1;
	). $
]

#theorem[
	Let $A$ be an $m times n$ matrix and let $B$ and $C$ be matrices for which the indicated sums and products are defined.
	- *Associative:* $A(B C) = (A B) C$
	- *Distributive over matrices:* $A(B + C) = A B + A C$, $(B + C) A = B A + C A$
	- *Distributive over scalars:* $r(A B) = (r A) B = A(r B)$ for every scalar $r$,
	- *Linear:* $A(r B + s C) = r A B + s A C$ for every scalars $r, s$
	- *Identity:* $I_m A = A = A I_n$
] <thm:matrix-mult-properties>

#theorem[
	The transpose of a product is the product of transposes in opposite order:
	$ (A B)^transpose = B^transpose A^transpose $
]

#definition[
	Let $A$ be a square matrix. We write $A^k$ for $A dots.c A$, $k$-times; that is $A^k$ is obtained by multiplying $A$ $k$-times with itself.
]

== LU decomposition

#see[#link("https://raw.githubusercontent.com/ethanc8/ekactl-references/trunk/linalg/math257/CompleteLectureNotes--Filled.pdf#Outline0.12")[MATH 257 [Module 12]]]

= Matrices as linear maps

== Elementary matrices

#see[#link("https://raw.githubusercontent.com/ethanc8/ekactl-references/trunk/linalg/trimm/unit-4/4.7%20Invertible%20Matrices.pdf")[Trimm [4.7]], #link("https://raw.githubusercontent.com/ethanc8/ekactl-references/trunk/linalg/karthik/4_7.pdf")[Karthik [4.7]], #link("https://raw.githubusercontent.com/ethanc8/ekactl-references/trunk/linalg/math257/CompleteLectureNotes--Filled.pdf#Outline0.9")[MATH 257 [Module 9]]]


#definition[
	An elementary matrix is one that is obtained by performing a single elementary row operation on an identity matrix.

	A permutation matrix is one that is obtained by performing row exchanges on an identity matrix.
] <def:elementary-matrix>

#theorem[
	If $e : Field^(n times n) to Field^(n times n)$ is an elementary row operation and $A in Field^(n times n)$, then
	$ e(A) = e(I) A. $
]

#corollary[
	Let $A$ and $B$ be $m times n$ matrices. Then, $B$ is row-equivalent to $A$ iff $B = e_k (I) dots.c e_1 (I) A$, where $e_1(I), dots, e_k (I)$ are elementary matrices of size $m times m$,
]

== Invertible matrices

#see[#link("https://raw.githubusercontent.com/ethanc8/ekactl-references/trunk/linalg/trimm/unit-4/4.7%20Invertible%20Matrices.pdf")[Trimm [4.7]], #link("https://raw.githubusercontent.com/ethanc8/ekactl-references/trunk/linalg/karthik/4_7.pdf")[Karthik [4.7]], #link("https://raw.githubusercontent.com/ethanc8/ekactl-references/trunk/linalg/math257/CompleteLectureNotes--Filled.pdf#Outline0.10")[MATH 257 [Module 10, 11]]]

#remark[
	The inverse of a real number $a$ is denoted by $a^(-1)$. For example, $7^(-1) = 1\/7$ and $7 dot 7^(-1) = 7^(-1) dot 7 = 1$. Note that not all real numbers have an inverse. Namely, $0^(-1)$ is not defined as there is no real number $b$ such that $0 dot b = 1$.
]

#definition(title: [Invertible matrix])[
	An $n times n$ matrix $A$ is #defname[invertible] iff there is an $n times n$ matrix $B$ satisfying
	$ B A = A B = I_n $
	where $I_n$ is the $n times n$ identity matrix. There is a unique such $B$, called the inverse of $A$, $A^(-1) := B$.

	A matrix that is not invertible is #defname[singular].
] <def:invertible-matrix>

#lemma[
	The matrix of an isomorphism of finite-dimensional vector spaces is invertible.
]

#theorem[
	Suppose $A$ and $B$ are invertible. Then:
	- $A^(-1)$ is invertible and $(A^(-1))^(-1) = A$.
	- $A B$ is invertible and $(A B)^(-1) = B^(-1) A^(-1)$. More generally, any finite product $A_1 dots.c A_k$ of invertible $n times n$ matrices is invertible, with $(A_1 dots.c A_k)^(-1) = A_k^(-1) dots.c A_1^(-1)$.
	- $A^transpose$ is invertible and $(A^transpose)^(-1) = (A^(-1))^transpose$.
]

#theorem[
	Let $A$ be an $n times n$ matrix. Then $A X = Y$ has a unique solution for every $Y in Field^n$ iff $A$ is invertible, in which case the unique solution is $X = A^(-1) Y$.
] <thm:unique-solution-iff-invertible>

#theorem[
	Let $A = mat(a, b; c, d)$. If $a d - b c != 0$, then $A$ is invertible and
	$ A^(-1) = 1/(a d - b c) mat(d, -b; -c, a). $
	If $a d - b c = 0$, then $A$ is not invertible.
]

#theorem(title: [Invertible Matrix Theorem])[
	If $A$ is an $n times n$ matrix, the following conditions are equivalent:
	- $A$ is invertible.
	- $A$ is row-equivalent to the $n times n$ identity matrix.
	- $A$ has pivots in every row and column.
	- $A vn(x) = vn(y)$ has a unique solution.
	- $A$ is a product of elementary matrices.
] <thm:invertible-matrix-theorem>

#theorem[
	Suppose $A$ is invertible. Then every sequence of elementary row operations that reduces $A$ to $I_n$ also transforms $I_n$ to $A^(-1)$. Equivalently, $[A | I]$ is row-equivalent to $[I | A^(-1)]$.
]

#procedure(title: [Computation of $A^(-1)$])[
	Row-reduce the augmented matrix $[A | I]$. If $A$ is row-equivalent to $I$, then $RREF([A | I]) = [I | A^(-1)]$. Otherwise, $A$ doesn't have an inverse.
]

== Fundamental matrix spaces

Given a matrix $A in Field^(m,n)$, define $T_A := x mapsto A x$. Then $T_A : Field^n to Field^m$.

#definition(title: [Null space, nullity])[
	The *null space* of $A$ is the kernel of $T_A$:
	$ op("Nul") A := ker T_A = {x in Field^n : A x = 0} $

	which is the solution set of the homogeneous linear system $A x = 0$.

	$ op("nullity") A := dim op("Nul") A $
]

#definition(title: [Column space, rank])[
	The *column space* of $A$ is the image of $T_A$:
	$ op("Col") A := im T_A
		&= {T_A x : x in Field^n} \
		&= {A x : x in Field^n} \
		&= { sum_(i=1)^n x_i A_(* i) : x_i in Field } \
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
	+ The pivot rows of $RREF(A)$ are a basis of $op("Row") A$. (row space is preserved under row operations)
	+ The vectors spanning $A x = 0$ are a basis of $op("Nul") A$.
]

#theorion-restate(filter: <def:matrix-transpose>)

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
	To find the left null space of the $n times m$ matrix $A$, make a column vector $b = (b_1, dots, b_m)^T$ and calculate $RREF([A | b])$. Then the basis of the left null space is given by the rows of $RREF([A | b])$ for which the left side is all zero (where $b_1, dots, b_m$ are the basis in which $A$ is expressed in (the basis $B$ for which $A = [T]_B$, which is usually the standard basis)).

	Alternately, calculate $RREF([A | I])$, then the basis of the left null space is given by the rows of $RREF([A | I])$ for which the left side is all zero.
]

== Change of basis

#definition(title: [Change of basis matrix])[
	The *change of basis matrix* or *transition matrix* of an $n$-dimensional vector space $V$ with relation to the ordered bases $B$ and $B'$ is the $n times n$ matrix whose $j$th column is the coordinate vector of the $j$th vector in $B$ with respect to $B'$:
	$ C_(* j) := [v_j]_(B') $
]

#procedure(title: [Finding the transition matrix])[
	Given bases $B$ and $B'$, row-reduce the augmented matrix $[[w_i] | [v_i]]$, whose first $n$ columns are the coordinate vectors $[w_i]$ of the vectors of $B'$ and whose last $n$ columns are the coordinate vectors $[v_i]$ of the vectors of $B$. Then the transition matrix from $B$ to $B'$ is the right-hand side of $RREF([[w_i] | [v_i]])$.
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
	If $B$ and $B'$ are bases of $V$, $T in linmaps(V)$, and $C_(B to B')$ is the transition matrix from $B$ to $B'$, then
	$ [T]_(B') = C_(B to B') [T]_B C_(B' to B) $
]

#procedure(title: [Changing the basis of a linear map by applying the linear map to basis vectors])[
	If $B$ and $B' = (w_1, dots, w_n)$ are bases of $V$, $T in linmaps(V)$, and $C_(B to B')$ is the transition matrix from $B$ to $B'$, then
	$ T_(B') = mat(C_(B to B') [T]_B [w_1]_B, dots.c, C_(B to B') [T]_B [w_n]_B) $
	(Apply $T$ to each of the basis vectors of $B'$ and then convert $T w_i$ to the basis $B'$)
]

== Similarity

#definition(title: [Similar matrices])[
	Two $n times n$ matrices $A$ and $B$ are similar if there exists an invertible matrix $C$ s.t. $B = C^(-1) A C$.

	Similarity is an equivalence relation on $Field^(n,n)$.
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
	Let $V$ be a vector space over $Field$. Then a linear map $T : V to Field$ is a *linear functional* on $V$.
]

#definition(title: [Dual space])[
	Let $V$ be a vector space over $Field$. Then the dual space of $V$ is the vector space of linear functionals on $V$, $V^* := linmaps(V, Field)$.
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

	Any linear functional $f : V to Field$ can be written uniquely as
	$ f = sum_(i=1)^n f(v_i) f_i $

	and $f(v)$ can be written as
	$ f(v) = sum_(i=1)^n f(v_i) ([v]_B)_i $
]

== Trace

#definition(title: [Trace of a matrix])[
	The trace of an $n times n$ matrix $A$ is the sum of the diagonal elements of $A$:
	$ tr(A) := sum_(i=1)^n A_(i i) $

	$tr : Field^(n,n) to Field$ is a linear functional.
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
	Let $V$ and $W$ be vector spaces over $Field$, and let $T in linmaps(V, W)$. The *transpose of $T$* or *dual map of $T$* is the linear map $T^* = T^transpose in linmaps(W^*, V^*)$ defined for each $f in W^*$ by
	$ T^*(f) = T^transpose (f) := f compose T $

	That is, for each linear functional $f in W^*$, $T^transpose (f)$ is the linear functional in $V^*$ defined by (for each $v in V$)
	$ T^transpose (f)(v) = f(T v) $
]

#theorem(title: [Properties of the transpose])[
	For all linear maps $T_1$, $T_2$, $T$ and $alpha in Field$,
	- $(T_1 + T_2)^T = alpha T_1^T + T_2^T$ (the map $T mapsto T^T$ is linear)
	- $(T_1 compose T_2)^T = T_2^T + T_1^T$
]

#theorem(title: [Matrix of transpose is transpose of matrix])[
	The matrix of $T^T$ is the transpose of the matrix of $T$:
	$ [T^T]_(B_W^* B_V^*) = ([T]_(B_V B_W))^T $
]

#lemma[
	Let $V$ and $W$ be finite-dimensional vector spaces, $T in linmaps(V, W)$ and $g in W^*$. Choose ordered bases $B_V = (v_1, dots, v_n)$ and $B_W = (w_1, dots, w_m)$ for $V$ and $W$, respectively, and let $B_V^* = (f_1, dots, f_n)$ and $B_W^* = (g_1, dots, g_m)$ be the corresponding dual bases of $V^*$ and $W^*$. Let $S = (1)$ be the standard ordered basis of $Field$. Then
	$ [T^T g]_(B_V^*, S) = [g]_(B_W^*, S) [T]_(V, W) $
]

#lemma[
	Let $V$ and $W$ be finite-dimensional vector spaces, $T in linmaps(V, W)$, $T^T in linmaps(W^*, V^*)$. Then:
	- $ op("rank") T^T = op("rank") T <= min {dim V, dim W} $
	- $T$ is injective iff $T^T$ is surjective
	- $T$ is surjective iff $T^T$ is injective
]

= Multilinear algebra and determinants

== Bilinear forms

#definition(title: [Bilinear form])[
	Let $V$ be a vector space over $Field$. A *bilinear form* on $V$ is a function $B : V times V to Field$ which is linear in each variable separately when the other variable is held constant. That is, for all $v_1, v_2, v in V$ and $alpha B(v, v_1) + B(v, v_2)$,
	$ B(alpha v_1 + v_2, v) = alpha B(v_1, v) + B(v_2, v) $
	and
	$ B(v, alpha v_1 + v_2) = alpha B(v, v_1) + B(v, v_2) $
]

#lemma[
	If $V$ is a vector space over $Field$ and $f, g in linmaps(V, Field)$, then $B(u, v) := f(u) g(v)$ is a bilinear form on $V$.
]

#definition[
	$V^((2))$ denotes the set of all bilinear forms on $V$.
]

#lemma[
	$V^((2))$ is a subspace of $V times V to Field$.
]

#definition(title: [Matrix of a bilinear form])[
	Let $B$ be a bilinear form on $V$ and let $arrow(e) = (e_1, dots e_n)$ be an ordered basis of $V$. Then the matrix of $B$ with respect to $arrow(e)$ is the matrix $[B]$ defined by:
	$ [B]_(i j) = B(e_i, e_j) $
]

#theorem[
	If $B$ is a bilinear form on $V$, $[B]$ is its matrix with respect to the ordered basis $arrow(e)$, $v, w in Field$, and $[v]$ and $[w]$ are the coordinate vectors of $v$ and $w$ with respect to the ordered basis $arrow(e)$, then
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
	$V^((2)) = V^((2))_("sym") plus.o V^((2))_("alt")$, and $V^((2))_("sym")$ and $V^((2))_("alt")$ are subspaces of $V^((2))$.
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
	For $T in linmaps(V)$, the *determinant* of $T$ is the unique scalar such that $M_T := M compose T = (det T) M$ for all $M in V_("alt")^((dim V))$.
]

#definition(title: [Determinant of a square matrix])[
	Let $n$ be a positive integer, $A$ be an $n times n$ matrix with entries in $Field$, and $T in linmaps(Field^n)$ be the operator whose matrix with respect to the standard basis of $Field^n$ is $A$. Then the determinant of $A$ is $det A := det T$.
]

#lemma[
	Let $(v_1, dots, v_n)$ be an ordered $n$-tuple of column vectors. Then the map $(v_1, dots, v_n) mapsto |v_1 dots.c v_n|$ is an alternating $n$-linear form on $Field^n$.
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
	- If $S, T in linmaps(V)$, then $det(S T) = (det S)(det T)$.
	- If $A$ and $B$ are $n times n$ matrices, then $det(A B) = (det A)(det B)$.
]

#theorem[
	A linear operator $T in linmaps(V)$ is an isomorphism iff $det T != 0$.

	If $T$ is an isomorphism, then $det(T^(-1)) = (det T)^(-1)$.
]

#theorem[
	The following are equivalent:
	- $A$ is invertible.
	- $det A != 0$.
	- The homogeneous system $A X = 0$ has only the unique solution.
]

#theorem(title: [Determinant is similarity invariant])[
	Let $T in linmaps(V)$ and $S : W to V$ be an invertible linear map. Then
	$ det(S^(-1) T S) = det T $
]

#theorem[
	For all $T in linmaps(V)$, $det T = det [T]$, where $[T]$ is the matrix of $T$ with respect to any basis of $V$.
]

#theorem[
	If $A$ is a square matrix, or if $A in linmaps(V)$, then
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
	Let $V$ be a finite-dimensional vector space, $B = (v_1, dots, v_n)$ be an ordered basis for $V$, and $T in linmaps(V)$. Then $[T]_B$ is diagonal iff $T(v_i) = lambda_i v_i$ for all $i$, where $lambda_i$ is the $i$th element along the diagonal of $[T]_B$.
]

#definition(title: [Eigenvalue, eigenvector of a linear operator])[
	Let $V$ be a vector space and $T in linmaps(V)$. An *eigenvalue* of $T$ is a scalar $lambda$ s.t. there exists a nonzero vector $v in V$ s.t.
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

	Any matrix representing $T in linmaps(V)$ has the same eigenvalues as $T$.
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
	A linear operator $T in linmaps(V)$ is said to be diagonalizable if there exists a basis consisting of eigenvectors of $T$. Such a basis is called an *eigenbasis*.
]

#lemma[
	If $T in linmaps(V)$, then every set of eigenvectors corresponding to distinct eigenvalues of $T$ is linearly independent.
]

#lemma[
	If $dim V = n$ and $T in linmaps(V)$ has $n$ distinct eigenvalues, then $T$ is diagonalizable.
]

#definition(title: [Multiplicity of a root of a polynomial])[
	Let $p(x)$ be a polynomial. Then an element $a in Field$ is a root of multiplicity $k$ iff there exists a polynomial $s(x)$ such that $s(a) != 0$ and $p(x) = (x - a)^k s(x)$.
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
//   Suppose $T in linmaps(V)$ and $lambda_1, dots, lambda_n$ are distinct eigenvalues of $T$. Then
//   $ E_(lambda_1) plus.o dots.c plus.o E_(lambda_m) $
//   (the sum of the eigenspaces is a direct sum). Furthermore, if $V$ is finite-dimensional, then
//   $ dim E_(lambda_1) + dots.c + dim E_(lambda_m) <= dim V $
// ]

#theorem(title: [Conditions equivalent to diagonalizability])[
	Let $V$ be a finite-dimensional vector space, $T in linmaps(V)$, and $lambda_1, dots, lambda_n$ be the distinct eigenvalues of $T$. Then the following are equivalent:
	- $V$ has a basis consisting of eigenvectors of $T$
	- $V = E_(lambda_1) plus.o dots.c plus.o E_(lambda_m)$
	- $dim V = dim E_(lambda_1) + dots.c + dim E_(lambda_m)$
	- The geometric multiplicity of each eigenvector is equal to its algebraic multiplicity.
]

#procedure(title: [Diagonalizing a linear operator])[
	Let $T in linmaps(V)$. Choose an ordering $B = (v_1, v_2, dots, v_n)$ of the eigenvectors of $T$, corresponding to the eigenvalues $lambda_1, lambda_2, dots, lambda_n$. Then $[T]_B$, the diagonalization of $T$, the matrix of $T$ with respect to $B$, is
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

For any discussion of inner product spaces, let $Field$ be $Reals$ or $Complex$.

== Inner product

#see[Trimm 7.1]

#definition(title: [Positive definite])[
	A map $f : V times V to Field$ is positive definite iff for any $v in V$ where $v != 0$,
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

= Resources


== Main resources

- *Trimm* -- notes from "TrimmAlg", the linear algebra class taught by Dr. Anderson Trimm in S25
	- *Karthik* -- a student's solutions to worksheets from TrimmAlg
	- This class follows Axler, but presents some things from Strang in an Axler-style presentation
- *MATH 257* -- notes from MATH 257 "Linear Algebra with Computational Applications", taught in F26
	- *Chaung* -- notes from the 09:00 lecture given by Jer-Chin Chuang in F26
	- This is a more numerical/applied class
	- This class mostly follows Strang and MIT 18.06, but also introduces worked examples in NumPy code
- *Axler* -- #link("https://linear.axler.net/LADR4e.pdf")[_Linear Algebra Done Right_, 4th edition, by Sheldon Axler]
	- #link("https://lew98.github.io/Mathematics/LADR_Solutions/LADR_Solutions.pdf")[Solution manual by GitHub user `@lew98`]
	- A very abstract book

== Supplementary resources

- *Klein* -- _Coding the Matrix: Linear Algebra through Applications to Computer Science_, by Philip N. Klein
- *UCDavis* -- #link("https://www.math.ucdavis.edu/~linear/")[open-access textbook _Linear Algebra_, by Cherney, Denton, Thomas, and Waldron]
	- Strang-like approach
- *Alayont & Schlicker* -- #link("https://scholarworks.gvsu.edu/books/21/")[Linear Algebra and Applications: An Inquiry-Based Approach]
	- Inquiry-based approach, i.e. investigation of examples

=== Gilbert Strang's curriculum
- *Strang-LAIA* -- _Linear Algebra and Its Applications_
	- Strang's oldest textbook
- *Strang-ILA* -- _Introduction to Linear Algebra_
	- The book in Strang's course MIT 18.06
- *Strang-LALD* -- _Linear Algebra and Learning from Data_
- #link("https://web.mit.edu/18.06/www/")[MIT 18.06]
- #link("https://ocw.mit.edu/courses/18-06sc-linear-algebra-fall-2011/")[MIT 18.06SC]
	- Designed for self-study
- MIT 18.065 "Matrix Methods in Data Analysis, Signal Processing, and Machine Learning"
	- #link("https://ocw.mit.edu/courses/18-065-matrix-methods-in-data-analysis-signal-processing-and-machine-learning-spring-2018/")[MIT 18.065, Spring 2018]
	- #link("https://github.com/mitmath/18065")[MIT 18.065, Spring 2023]

== Videos

=== 3Blue1Brown

1. #link("https://www.youtube.com/watch?v=fNk_zzaMoSs&list=PLZHQObOWTQDPD3MizzM2xVFitgF8hE_ab&index=1")[Vectors]
	- $Reals^2$ and $Reals^3$ (geometrically)
	- Vectors as arrays and as arrows from the origin
	- Vector addition in $Reals^2$ and $Reals^3$
2. #link("https://www.youtube.com/watch?v=k7RM-ot2NWY&list=PLZHQObOWTQDPD3MizzM2xVFitgF8hE_ab&index=2")[Linear combinations, span, and basis vectors]
	- Basis (@sec:vecspace:basis)
	- Spanning (@sec:vecspace:span)
	- Subspaces of $Reals^2$/$Reals^3$ (@sec:vecspace:subspace-Fn)
3. 

