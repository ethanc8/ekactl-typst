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
#let REF = math.op("REF")
#let span = math.op("span")

#let Nul = math.op("Nul")
#let Col = math.op("Col")
#let Row = math.op("Row")
#let rank = math.op("rank")
#let nullity = math.op("nullity")

#let proj = math.op("proj")

#let dirsum = math.limits(sym.plus.o)

#let linmaps = $cal(L)$

#let conj = overline

#let inprod(a, b) = $chevron.l #a #b chevron.r$

#show link: set text(blue)

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

== Complex numbers

#see[#link("https://raw.githubusercontent.com/ethanc8/ekactl-references/trunk/linalg/math257/CompleteLectureNotes--Filled.pdf#Outline0.48")[MATH 257 [Modul3 48]]]

#definition(title: [Complex number])[
	A number which can be defined by a pair of real numbers $a, b$ where the value of the number is equal to $a + b i$.
]

#theorem(title: [Useful things about complex numbers])[
	Let $z = a + b i$ and $w = c + d i$ be complex numbers. Then:
	- $z + w = (a + c) + (b + d) i$
	- $z w = (a c - b d) + (b c + a d) i$
]

#definition(title: [Complex conjugate])[
	The complex conjugate of the complex number $a + b i$ is
	$ overline(a + b i) = a - b i $
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
	Let $V$ be a vector space. If $W subset.eq V$ is a finite set, it is #defname[linearly independent] iff one of the following equivalent conditions:
	- the only way to write 0 as a combination
		$ alpha_1 v_1 + dots.c + alpha_m v_m = 0 $
		is by taking $alpha_1 = dots.c = alpha_m = 0$.
	- there does not exist $w in W$ (possibly $w = 0$) s.t. $w$ is a linear combination of the other elements of $W$.
	
	We also define $emptyset$ to be linearly independent.

	If $W subset.eq V$ is an infinite set, it is linearly independent if fevery finite subset of $W$ is linearly independent.

	#defname[Linear dependence] is the opposite of linear independence.
]

#theorem[
	If $W subset.eq V$ is linearly independent, any subset $U subset.eq W$ is linearly independent.
]

#theorem[
	Let $A$ be an $m times n$ matrix. The following are equivalent:
	- The columns of $A$ are linearly independent.
	- $A x = 0$ has only the solution $x = 0$.
	- $A$ has $n$ pivots.
	- there are no free variables for $A x = 0$.
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

== Linear map <sec:linmap:linmap>

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

#see[#link("https://raw.githubusercontent.com/ethanc8/ekactl-references/trunk/linalg/trimm/unit-4/4.2%20Kernel%20and%20Image.pdf")[Trimm 4.2], #link("https://raw.githubusercontent.com/ethanc8/ekactl-references/trunk/linalg/karthik/4_2.pdf")[Karthik 4.2], #link("https://linear.axler.net/LADR4e.pdf#section.3.2")[Axler 3B]]

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

#see[#link("https://raw.githubusercontent.com/ethanc8/ekactl-references/trunk/linalg/trimm/unit-4/4.2%20Kernel%20and%20Image.pdf")[Trimm 4.2], #link("https://raw.githubusercontent.com/ethanc8/ekactl-references/trunk/linalg/karthik/4_2.pdf")[Karthik 4.2], #link("https://linear.axler.net/LADR4e.pdf#section.3.2")[Axler 3B]]

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

== Matrix of a linear map <sec:matsys:matmap>

#see[#link("https://linear.axler.net/LADR4e.pdf#page=83")[Axler [3C]], #link("https://raw.githubusercontent.com/ethanc8/ekactl-references/trunk/linalg/trimm/unit-4/4.5%20Matrix%20of%20a%20Linear%20Map.pdf")[Trimm [4.5]], #link("https://raw.githubusercontent.com/ethanc8/ekactl-references/trunk/linalg/karthik/4_5.pdf")[Karthik [4.5]]]

#definition(title: [Matrix of a linear map])[
	Let $B_V = (v_1, dots, v_n)$ be a basis of $V$ and $B_W = (w_1, dots, w_m)$ be a basis of $W$. Let $T : V to W$ be a linear map.

	Then the matrix of $T$ with respect to $B_V$ and $B_W$ is denoted as
	$ [T]_(B_W B_V). $

	It is the $m times n$ matrix defined such that its $j$th column is the coordinate vector of $T v_j$ with respect to $B_W$:
	$ ([T]_(B_W B_V))_(* j) = [T v_j]_(B_W). \
	[T]_(B_W B_V) = mat(T v_0, dots.c, T v_n)_(B_W)
	$

	Equivalently, it is the $m times n$ matrix that satisfies
	$ T v_j = sum_(i=1)^m ([T]_(B_W B_V))_(i j) w_i. $
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

== Linear systems <sec:matsys:linsys>

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

== Matrix-vector multiplication <sec:matsys:matvec>

#see[#link("https://raw.githubusercontent.com/ethanc8/ekactl-references/trunk/linalg/math257/CompleteLectureNotes--Filled.pdf#Outline0.5")[MATH 257 [Module 5, Module 6]], #link("file:///home/ethan/Downloads/f26-math257--Lecture3.pdf")[Chuang [Lecture 3]]]

#see[#link("https://www.youtube.com/watch?v=kYB8IZa5AuE&list=PLZHQObOWTQDPD3MizzM2xVFitgF8hE_ab&index=3")[3Blue1Brown [3]]]

#remark[
	Consider $T : Field^2 to Field^2$. Since $[T] = display(mat(T hat(i), T hat(j)))$, and
	$ T(x, y) &= T((x, 0) + (0, y)) \
	&= T(x, 0) + T(0, y) \
	&= T(x hat(i)) + T(y hat(j)) \
	&= x T(hat(i)) + y T(hat(j)), $

	we define $A vn(x) := x_1 A_(*1) + x_2 A_(*2)$. The following definition generalizes this.
]

#definition(title: [Matrix-vector multiplication])[
	Let $vn(x) in Field^n$ and $A = display(mat(A_(*1), dots.c, A_(*n)))$ be an $m times n$-matrix. We define the product $A X$ by
	$ A vn(x) := x_1 A_(*1) + x_2 A_(*2) + dots.c + x_n A_(*n). $

	- $A vn(x)$ is a linear combination of the columns of $A$ using the entries in $vn(x)$ as coefficients.
	- $A vn(x)$ is only defined if the number of entries of $vn(x)$ is equal to the number of columns of $A$.
] <def:matrix-vector-mult>

#remark[
	Solving linear systems is the same as finding linear combinations: solving $A vn(x) = vn(y)$ means finding coefficients expressing $Y$ as a linear combination of $A$'s columns, i.e. finding $Y in span{a_1, dots, a_n}$ (span: see [Vector spaces]).
]

#theorem[
	Let $A = display(mat(vn(a)_1, dots.c, vn(a)_n))$ be an $m times n$ matrix and $vn(y) in Field^m$. For any $(x_1, dots, x_n) in Field^n$, the following are equivalent:
	- $(x_1, dots, x_n)$ is a solution of the vector equation $x_1 vn(a)_1 + dots.c + x_n vn(a)_n = vn(y)$
	- $vn(x) = vec(x_1, dots.v, x_n)$ is a solution of the matrix equation $A vn(x) = vn(y)$
	- $(x_1, dots, x_n)$ is a solution of the linear system with augmented matrix $[A | vn(y)]$
]

#corollary[
	The equation $A vn(x) = vn(y)$ has a solution iff $vn(y) in span{vn(a)_1, dots, vn(a)_n}$.
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

== Matrix multiplication <sec:matsys:matmul>

#see[#link("https://linear.axler.net/LADR4e.pdf#page=83")[Axler [3C]], #link("https://raw.githubusercontent.com/ethanc8/ekactl-references/trunk/linalg/math257/CompleteLectureNotes--Filled.pdf#Outline0.7")[MATH 257 [Module 7, 8]]]

#remark[
	Let $T_1 in linmaps(Field^n, Field^m)$, $T_2 in linmaps(Field^p, Field^n)$. We want to determine $[T_1 compose T_2]$ in terms of $[T_1]$ and $[T_2]$.

	Recall that the columns of the matrix of a linear map are the coordinate vectors of the map applied to each basis vector:
	$ A := [T_1] &= mat([T_1 e_1], dots.c, [T_1 e_n]) \
	  B := [T_2] &= mat([T_2 e_1], dots.c, [T_2 e_p]) $

	(*Note:* The number of columns is the input dimension, and the number of rows is the output dimension.)

	Thus, we need to find $[(T_1 compose T_2)(e_j)]$ for each $j in {1, dots, p}$.

	$ [(T_1 compose T_2)(e_j)] &= [T_1(T_2 e_j)] \
	  &= [T_1][T_2 e_j] \
	  &= A B_(* j). $

	Since this holds for every column $j$, $[T_1 compose T_2] = display(mat(A B_(* 1), dots.c, A B_(* p)))$, so we define $A B$ this way.
]

#definition(title: [Matrix multiplication])[
	Let $A$ be an $m times n$-matrix and let $B = mat(B_(* 1), dots.c, B_(* p))$ be an $n times p$-matrix. We define
	$ A B := mat(A B_(* 1), A B_(* 2), dots.h, A B_(* p)) $
] <def:matrix-mult>

#theorem[
	Let $A$ be an $m times n$ matrix and $B$ be an $n times p$ matrix. Then for every $x in Field^p$
	$ A(B x) = (A B) x. $
]

#lemma[
	Composing two linear maps $T_1$ and $T_2$ is equivalent to multiplying the matrices of the two linear maps:
	$ [T_1 compose T_2] = [T_1][T_2] $
]

*Note.* Other ways to compute $A B$.

#procedure(title: [Row-Column Rule])[
	Let $A$ be $m times n$ and $B$ be $n times p$. Then, $A B$ is formed by dot-producting the rows of the first ($A$) with the columns of the second ($B$):
	$ A B = mat(
		A_(1 *) B_(* 1), dots.h, A_(1 *) B_(* p);
		A_(2 *) B_(* p), dots.h, A_(2 *) B_(* p);
		dots.v, dots.down, dots.v;
		A_(m *) B_(* p), dots.h, A_(m *) B_(* p);
	) \
	(A B)_(i j) = A_(i *) B_(* j).
	$

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

== Invertible matrices <sec:matmap:invmat>

#see[#link("https://raw.githubusercontent.com/ethanc8/ekactl-references/trunk/linalg/trimm/unit-4/4.7%20Invertible%20Matrices.pdf")[Trimm [4.7]], #link("https://raw.githubusercontent.com/ethanc8/ekactl-references/trunk/linalg/karthik/4_7.pdf")[Karthik [4.7]], #link("https://raw.githubusercontent.com/ethanc8/ekactl-references/trunk/linalg/math257/CompleteLectureNotes--Filled.pdf#Outline0.10")[MATH 257 [Module 10, 11]]]

#remark[
	The inverse of a real number $a$ is denoted by $a^(-1)$. For example, $7^(-1) = 1\/7$ and $7 dot 7^(-1) = 7^(-1) dot 7 = 1$. Note that not all real numbers have an inverse. Namely, $0^(-1)$ is not defined as there is no real number $b$ such that $0 dot b = 1$.
]

#definition(title: [Invertible matrix])[
	An $n times n$ matrix $A$ is #defname[invertible] iff there is an $n times n$ matrix $A^(-1)$ satisfying
	$ A^(-1) A = A A^(-1) = I_n $
	where $I_n$ is the $n times n$ identity matrix. There is a unique such $B$, called the inverse of $A$\.

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
If $A$ is an $n times n$ matrix, and is the matrix of the linear map $T_A$, the following conditions are equivalent:
- $A$ is invertible.
- $T_A$ is injective.
	- $A vn(x) = vn(y)$ has a unique solution for every $vn(y) in Field^n$.
	- $A vn(x) = 0$ has only the trivial solution ($vn(x) = vn(0)$).
	- $op("Nul") A = {0}$
	- $op("nullity") A = 0$
	- The columns of $A$ are linearly independent.
- $T_A$ is surjective.
	- $op("Col") A = Field^n$.
	- The columns of $A$ span $Field^n$.
	- $op("rank") A = n$.
- $T_A$ is bijective.
	- $T_A$ is an isomorphism.
- $A$ is row-equivalent to the $n times n$ identity matrix.
	- $A$ has pivots in every row and column.
	- $A$ is a product of elementary matrices.
- $det A != 0$.
- $0$ is not an eigenvalue of $A$.
] <thm:invertible-matrix-theorem>

#theorem[
	Suppose $A$ is invertible. Then every sequence of elementary row operations that reduces $A$ to $I_n$ also transforms $I_n$ to $A^(-1)$. Equivalently, $[A | I]$ is row-equivalent to $[I | A^(-1)]$.
]

#procedure(title: [Computation of $A^(-1)$])[
	Row-reduce the augmented matrix $[A | I]$. If $A$ is row-equivalent to $I$, then $RREF([A | I]) = [I | A^(-1)]$. Otherwise, $A$ doesn't have an inverse.
]

*Note* -- The following is not in any of the sources; it comes from the solutions to MATH 257 HW3.

#lemma(title: [Inverse elementary row operations])[
	The inverses of the elementary row operations are:

	#table(
		columns: 2,
		stroke: none,
		[Forward], [Inverse],
		$display(R_i mapsto c R_i)$, $display(R_i mapsto 1/c R_i)$,
		$display(R_i mapsto R_i + c R_j)$, $display(R_i mapsto R_i - c R_j)$,
		$display(R_i <-> R_j)$, $display(R_i <-> R_j)$
	)

	Assume $c != 0$ and $i != j$.
]

#procedure(title: [Computation of inverse of matrix under elementary ops])[
	Let $A$ be the result of applying $e_1, ..., e_n$ in order to $I$. Then, $A^(-1)$ is the result of applying $(e_n)^(-1), ..., (e_1)^(-1)$ in order to $I$.

	*Warning:* The order must be reversed!
]

== Left and right inverse

#see[#link("https://ocw.mit.edu/courses/18-06sc-linear-algebra-fall-2011/pages/positive-definite-matrices-and-applications/left-and-right-inverses-pseudoinverse/")[MIT 18.06SC [Lecture 33]], Strang-ILA-6e [4.5], MATH 257 [HW3.4], #link("https://math.stackexchange.com/questions/1694351/finding-all-left-inverses-of-a-matrix")]

Let $A$ be an $m times n$ matrix with $n > m$. We wish to find $B$ s.t. $A B = I$, i.e. $B$ is the #defname[right-inverse] of $A$. The right-inverse is not unique. //; the following procedures may give you different right-inverses.

#theorem(title: [Finding left/right-inverse])[
	Notice that $A A^transpose$ is square, and that
	$ A (A^transpose (A A^transpose)^(-1)) = (A A^transpose) (A A^transpose)^(-1) = -1. $

	Thus, a right-inverse of $A$ is
	$ A^(-1)_"right" := A^transpose (A A^transpose)^(-1). $

	It only exists when $A$ has independent rows.

	Similarly, we can find that a left-inverse of $A$ is
	$ A^(-1)_"left" := (A^transpose A)^(-1) A^transpose. $

	It only exists when $A$ has independent columns.
]

Here are some alternative ways to do it. They aren't very useful.

#procedure(title: [Computation of right-inverse by zeroing out rows])[
  Choose $n - m$ rows of $B$ to zero out. By the outer product rule, zeroing
  the $j$th row of $B$ causes the $j$th column of $A$ to contribute nothing to
  $A B$, so that column can be ignored. After zeroing those rows, the remaining
  rows of $B$ form a square matrix $B'$, and the corresponding columns of $A$
  form a square matrix $A'$. For $A B = I$ to hold, we need $A' B' = I$, so
  $B' = (A')^(-1)$.

  If $A'$ is singular, choose a different set of rows to zero out. If no choice
  yields an invertible $A'$, then no right-inverse exists.
]

#procedure(title: [Column-by-column computation of right-inverse])[
	Apply $A$ to each column of $B$ separately and set the result
  equal to the corresponding column of $I$, giving one linear system per column of $B$ to solve.
]

// From Strang-ILA-6e:

// #image("/assets/image.png")
// #image("/assets/image-1.png")

== LU decomposition

#see[#link("https://raw.githubusercontent.com/ethanc8/ekactl-references/trunk/linalg/math257/CompleteLectureNotes--Filled.pdf#Outline0.12")[MATH 257 [Module 12, 13]], Strang-ILA-6e [2.3]]

#see[_(extras)_ Strang-LALD [I.4], Strang-ILA-5e [2.6], Strang-LAFE [2.3], #link("https://ocw.mit.edu/courses/18-06-linear-algebra-spring-2010/4d876a9159e32543eb0d73b4d4382f4c_MIT18_06S10ZoomNotes.pdf#page=19")[Strang-ZoomNotes [2.3, 2.5]], #link("https://ocw.mit.edu/courses/18-06sc-linear-algebra-fall-2011/pages/ax-b-and-the-four-subspaces/factorization-into-a-lu/")[MIT 18.06SC [Lecture 4]]]

#definition[
	An $n times n$ matrix $A$ is called
	- upper triangular iff it is of the form
		$ mat(
			star, star, star, star, star;
			0, star, star, star, star;
			0, 0, star, star, star;
			0, 0, 0, dots.down, dots.v;
			0, 0, 0, 0, star;
		), $
		i.e. all the entries below the main diagonal are zero.
	- lower triangular iff it is of the form
		$ mat(
			star, 0, 0, 0, 0;
			star, star, 0, 0, 0;
			star, star, star, 0, 0;
			star, star, star, dots.down, dots.v;
			star, star, star, star, star;
		), $
		i.e. all the entries above the main diagonal are zero.
	- diagonal iff it only has entries on the main diagonal.
]

#theorem[
	The product of two lower (upper) triangular matrices is lower (upper) triangular.

	The inverse of a lower (upper) triangular matrix (if it exists) is again lower (upper) triangular.
]

#definition(title: [LU decomposition])[
	A matrix $A$ has an #defname[LU decomposition] iff there is a lower triangular matrix $L$ and an upper triangular matrix $U$ such that $A = L U$.
]

#lemma[
	Not every matrix has an LU decomposition. The LU decomposition of a matrix is not unique.
]

#procedure(title: [Finding LU decomposition ($O(n^3)$)])[
	Suppose that $REF(A)$ can be found by operations $e_1, ..., e_n$ of the form $R_i mapsto R_i + c R_j$ where $j < i$:
	$ U := REF(A) = e_n (I) dots.c e_1 (I) A. $
	We define $U := REF(A)$ since $REF(A)$ is always upper-triangular. Finding $U$ takes approximately $1/3 n^3$ multiplications and $1/3 n^3$ subtractions.

	Then,
	$ L := e_1^(-1)(I) dots.c e_n^(-1)(I) $
	is lower-triangular.
]

#lemma[
	The elementary matrix for a replacement ($R_i mapsto R_i + c R_j$) with $j < i$ or scaling ($R_i mapsto c R_i$) operation is lower triangular.
]

#theorem[
	Let $A$ be an $n times n$-matrix. If $A$ can be brought to echelon form just using row operations of the form $R_i mapsto R_i + c R_j$ where $j < i$, then $A$ has an LU decomposition.
]

#lemma[
	Every matrix $A$ has some permutation matrix (possibly the identity) s.t. $P A = L U$, where $L U$ is an LU decomposition.

	Equivalently, every matrix has some permutation of its rows which has an $L U$ decomposition.
]

#procedure(title: [Using LU decomposition ($O(n^2)$)])[
	Suppose $A = L U$ where $L$ is lower triangular and $U$ is upper triangular. Then, we can solve the problem $A vn(x) = vn(b)$ by:
	1. Solving $L vn(y) = vn(b)$ for $vn(y)$ using forward-substitution (going from top down).
	2. Solving $U vn(x) = vn(y)$ for $vn(x)$ using back-substitution (going from bottom up).
]

#remark[
	LU decomposition is most useful when one has to solve many linear systems $A vn(x) = vn(y)$ with the same coefficients but different right-hand side $vn(y)$.
]

== Fundamental matrix spaces <sec:matmap:funmatspaces>

#see[MATH 257 [#link("https://raw.githubusercontent.com/ethanc8/ekactl-references/trunk/linalg/math257/CompleteLectureNotes--Filled.pdf#Outline0.17")[Module 17], #link("https://raw.githubusercontent.com/ethanc8/ekactl-references/trunk/linalg/math257/CompleteLectureNotes--Filled.pdf#Outline0.21")[Module 21]], #link("https://raw.githubusercontent.com/ethanc8/ekactl-references/trunk/linalg/trimm/unit-4/4.6%20Fundamental%20Matrix%20Spaces.pdf")[Trimm 4.6], #link("https://raw.githubusercontent.com/ethanc8/ekactl-references/trunk/linalg/karthik/4_6.pdf")[Karthik 4.2] #link("https://linear.axler.net/LADR4e.pdf#subsection*.31")[Axler 3C.31]]

Given a matrix $A in Field^(m,n)$, define $T_A := x mapsto A x$. Then $T_A : Field^n to Field^m$.

#definition(title: [Null space, nullity])[
	The *null space* of $A$ is the kernel of $T_A$:
	$ Nul A := ker T_A = {x in Field^n : A x = 0} $

	which is the solution set of the homogeneous linear system $A x = 0$.

	$ nullity A := dim Nul A $
]

#definition(title: [Column space, rank])[
	The *column space* of $A$ is the image of $T_A$:
	$ Col A := im T_A
		&= {T_A x : x in Field^n} \
		&= {A x : x in Field^n} \
		&= { sum_(i=1)^n x_i A_(* i) : x_i in Field } \
		&= span { A_(* 1), dots, A_(* n) } $

	which is the span of the column vectors of the matrix $A$.

	$ rank A := dim Col A $
]

#theorem(title: [Rank-nullity theorem])[
	$ rank A &= "the number of pivot columns" \
		nullity A &= "the number of non-pivot columns" $

	Therefore,
	$ n = nullity A + rank A, $
	where $n$ is the number of columns of $A$, or equivalently the dimension of the domain of $T_A$.
]

#procedure(title: [Finding bases of $Nul A$, $Col A$, $Row A$])[
	+ The pivot columns of $A$ are a basis of $Col A$.
	+ The pivot rows of $A$ or of $RREF(A)$ are a basis of $Row A$. (row space is preserved under row operations)
	+ The vectors spanning $A x = 0$ are a basis of $Nul A$, so
		+ Find the parametric form of the solutions to $A x = 0$.
		+ Express solutions for $x$ as a linear combination of vectors with the free variables as coefficients.
		+ These vectors form a basis of $Nul A$.
]

#theorion-restate(filter: <def:matrix-transpose>)

#definition(title: [Row space])[
	The row space of $A$ is the span of the row vectors of $A$:
	$ Row A := span { A_(1 *), dots, A_(m *) } = Col A^T $
]

#lemma[
	$ dim Row A = dim Col A = rank A $
]

#definition(title: [Left null space])[
	The left null space of $A$ is the null space of $A^T$. It is the solution set of the homogeneous linear system $A^T y = 0$ or equivalently of $y^T A = 0^T$.
]

#procedure(title: [Finding the left null space without column operations])[
	To find the left null space of the $n times m$ matrix $A$, make a column vector $b = (b_1, dots, b_m)^T$ and calculate $RREF([A | b])$. Then the basis of the left null space is given by the rows of $RREF([A | b])$ for which the left side is all zero (where $b_1, dots, b_m$ are the basis in which $A$ is expressed in (the basis $B$ for which $A = [T]_B$, which is usually the standard basis)).

	Alternately, calculate $RREF([A | I])$, then the basis of the left null space is given by the rows of $RREF([A | I])$ for which the left side is all zero.
]

#lemma[
	If $A$ is a real-valued matrix:
	$ Nul(A^transpose) &= Col(A)^perp \
	Row(A) = Col(A^transpose) &= Nul(A)^perp $
] <lem:nullspace-orthogonal>

== Change of basis

#definition(title: [Change of basis matrix])[
	The *change of basis matrix* or *transition matrix* of an $n$-dimensional vector space $V$ from the ordered basis $B$ to $B'$ is the $n times n$ matrix whose $j$th column is the coordinate vector of the $j$th vector in $B$ with respect to $B'$:
	$ (C_(B to B'))_(* j) := [v_j]_(B') $

	$C_(B to B')$ is also denoted $I_(B'B)$.
]

#procedure(title: [Finding the transition matrix])[
	Given bases $B$ and $B'$, row-reduce the augmented matrix $[B' | B ] = [[w_i] | [v_i]]$, whose first $n$ columns are the coordinate vectors $[w_i]$ of the vectors of $B'$ and whose last $n$ columns are the coordinate vectors $[v_i]$ of the vectors of $B$. Then the transition matrix from $B$ to $B'$ is the right-hand side of $RREF([B' | B])$.

	$ C_(B to B') = op("rhs")(RREF([B' | B])). $
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

#see[#link("https://raw.githubusercontent.com/ethanc8/ekactl-references/trunk/linalg/trimm/unit-5/5.1%20Bilinear%20Forms.pdf")[Trimm [5.1]], #link("https://linear.axler.net/LADR4e.pdf#section.9.1")[Axler [9A]]]

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

#see[#link("https://raw.githubusercontent.com/ethanc8/ekactl-references/trunk/linalg/trimm/unit-5/5.2%20Symmetric%20and%20Alternating%20Bilinear%20Forms.pdf")[Trimm [5.2]], #link("https://linear.axler.net/LADR4e.pdf#section.9.1")[Axler [9A]]]

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

#see[#link("https://raw.githubusercontent.com/ethanc8/ekactl-references/trunk/linalg/trimm/unit-5/5.2%20Symmetric%20and%20Alternating%20Bilinear%20Forms.pdf")[Trimm [5.2]], #link("https://linear.axler.net/LADR4e.pdf#section.9.1")[Axler [9A]]]

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

#see[#link("https://raw.githubusercontent.com/ethanc8/ekactl-references/trunk/linalg/trimm/unit-5/5.3%20Alternating%20Multilinear%20Forms.pdf")[Trimm [5.3]], #link("https://linear.axler.net/LADR4e.pdf#section.9.2")[Axler [9B]]]

#definition[
	$ V^m := underbrace(V times V times dots.c times V, m "times") $
]

#definition(title: [Multilinear form])[
	An $m$-linear form on $V$ is a map which is linear in each entry when all other entries are held fixed.

	The set of $m$-linear forms on $V$ is denoted by $V^((m))$.
]

== Alternating multilinear forms

#see[#link("https://raw.githubusercontent.com/ethanc8/ekactl-references/trunk/linalg/trimm/unit-5/5.3%20Alternating%20Multilinear%20Forms.pdf")[Trimm [5.3]], #link("https://linear.axler.net/LADR4e.pdf#section.9.2")[Axler [9B]]]

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

#see[#link("https://raw.githubusercontent.com/ethanc8/ekactl-references/trunk/linalg/trimm/unit-5/5.3%20Alternating%20Multilinear%20Forms.pdf")[Trimm [5.3]], #link("https://linear.axler.net/LADR4e.pdf#section.9.2")[Axler [9B]]]

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

#see[#link("https://raw.githubusercontent.com/ethanc8/ekactl-references/trunk/linalg/trimm/unit-5/5.4%20Definition%20of%20the%20Determinant.pdf")[Trimm [5.4]], #link("https://linear.axler.net/LADR4e.pdf#section.9.3")[Axler [9C]], #link("https://www.youtube.com/watch?v=Ip3X9LOh2dk&list=PLZHQObOWTQDPD3MizzM2xVFitgF8hE_ab&index=7")[3B1B [Chapter 6]], #link("https://raw.githubusercontent.com/ethanc8/ekactl-references/trunk/linalg/ekactl-extras/determinant-multilinear.pdf")[Explanation by LLM], #link("https://raw.githubusercontent.com/ethanc8/ekactl-references/trunk/linalg/math257/CompleteLectureNotes--Filled.pdf#Outline0.28")[MATH 257 [Modules 28-29]]]

#see[_(extra practice)_ #link("https://raw.githubusercontent.com/ethanc8/ekactl-references/trunk/linalg/trimm/unit-5/5.4b%20Determinants%20Practice%20I.pdf")[Trimm [5.4b]]]

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

#theorem[
	Let $(v_1, dots, v_n)$ be an ordered $n$-tuple of column vectors. Then the map $(v_1, dots, v_n) mapsto |v_1 dots.c v_n|$ is an alternating $n$-linear form on $Field^n$.

	The determinant $det A$ is alternating and multilinear in the columns of $A$ and alternating and multilinear in the rows of $A$.
]

#theorem(title: [Leibniz formula ($O(n!)$)])[
	If $A$ is an $n times n$ matrix,
	$ det A = sum_(sigma in S_n) op("sgn")(sigma) A_(sigma(1) 1) dots.c A_(sigma(n) n) $
]

#procedure(title: [Cofactor method ($O(n!)$)])[
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

#theorem(title: [Determinant is scaling of volume])[
	Suppose $T in linmaps(Reals^n)$ and $Omega subset.eq Reals^n$. Then
	$ op("volume")(T(Omega)) = abs(det T) op("volume")(Omega). $
]

== Properties of the determinant

#see[#link("https://raw.githubusercontent.com/ethanc8/ekactl-references/trunk/linalg/trimm/unit-5/5.5%20Properties%20of%20the%20Determinant-1.pdf")[Trimm [5]], #link("https://linear.axler.net/LADR4e.pdf#section.9.3")[Axler [9C]]]

#see[_(extra practice)_ #link("https://raw.githubusercontent.com/ethanc8/ekactl-references/trunk/linalg/trimm/unit-5/5.4b%20Determinants%20Practice%20I.pdf")[Trimm [5.4b]]]


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
	- If $B$ is the result of replacing a column by the sum of itself and a scalar multiple of another column, then $det B = det A$.
	- If $B$ is the result of replacing a row by the sum of itself and a scalar multiple of another row, then $det B = det A$.
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

#theorem[
	The columns of $A$ are linearly dependent iff $det A = 0$.
]

== Vandermonde determinant

#see[#link("https://en.wikipedia.org/wiki/Vandermonde_matrix")[Wikipedia], #link("https://linear.axler.net/LADR4e.pdf#section.9.3")[Axler [9C]]]

#definition(title: [Vandermonde matrix])[
	A matrix in which each row consists of successive powers of a number. For example, with three values:

	$ V(x_1, x_2, x_3) := mat(
		1, x_1, x_1^2;
		1, x_2, x_2^2;
		1, x_3, x_3^2;
	) $
]

#theorem(title: [Vandermonde determinant])[
	If $V$ is a Vandermonde matrix, then

	$ det(V) = product_(i < j) (x_j - x_i). $

	For example, 
	$ det(V(x_1, x_2, x_3)) = (x_2 - x_1)(x_3 - x_1)(x_3 - x_2). $
]

== Cramer's rule

#see[#link("https://raw.githubusercontent.com/ethanc8/ekactl-references/trunk/linalg/trimm/unit-5/5.6%20Cramer's%20Rule.pdf")[Trimm [5.6]]]

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

= Eigentheory

== Eigenvalues and eigenvectors

#see[#link("https://raw.githubusercontent.com/ethanc8/ekactl-references/trunk/linalg/math257/CompleteLectureNotes--Filled.pdf#Outline0.30")[MATH 257 [Module 30]], #link("https://raw.githubusercontent.com/ethanc8/ekactl-references/trunk/linalg/trimm/unit-6/6.1%20Eigenvalues%20and%20Eigenvectors-2.pdf")[Trimm [6.1]], #link("https://linear.axler.net/LADR4e.pdf#section.5.1")[Axler [5A]], #link("https://www.axler.net/DwD.pdf")[Axler-DwD]]

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

	The set of all solutions to this equation is the *eigenspace* of $A$ associated to the eigenvalue $lambda$:
	$ E_lambda := Nul(A - lambda I) $
]

#lemma[
	If $A in Reals^(n times n)$, then the eigenspace of $A$ corresponding to $lambda$ is a subspace of $Reals^n$.
]

#lemma[
	If $T in linmaps(V)$, then every set of eigenvectors corresponding to distinct eigenvalues of $T$ is linearly independent.
]

== Characteristic polynomial

#see[#link("https://raw.githubusercontent.com/ethanc8/ekactl-references/trunk/linalg/math257/CompleteLectureNotes--Filled.pdf#Outline0.31")[MATH 257 [Module 31]], #link("https://raw.githubusercontent.com/ethanc8/ekactl-references/trunk/linalg/trimm/unit-6/6.1%20Eigenvalues%20and%20Eigenvectors-2.pdf")[Trimm [6.1]], #link("https://linear.axler.net/LADR4e.pdf#section.5.2")[Axler [5B]], #link("https://www.axler.net/DwD.pdf")[Axler-DwD]]

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

#see[#link("https://raw.githubusercontent.com/ethanc8/ekactl-references/trunk/linalg/math257/CompleteLectureNotes--Filled.pdf#Outline0.34")[MATH 257 [Module 34]], #link("https://raw.githubusercontent.com/ethanc8/ekactl-references/trunk/linalg/trimm/unit-6/6.2%20Diagonalizable%20Operators.pdf")[Trimm [6.2]], #link("https://linear.axler.net/LADR4e.pdf#section.5.4")[Axler [5D]], #link("https://www.axler.net/DwD.pdf")[Axler-DwD]]

#definition(title: [Diagonalizable operator])[
	A linear operator $T in linmaps(V)$ is said to be diagonalizable if there exists a basis consisting of eigenvectors of $T$. Such a basis is called an *eigenbasis*.
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
	The geometric multiplicity of the eigenvalue $lambda_k$ is the dimension of the eigenspace corresponding to $lambda_k$,
	$ dim(Nul(A - lambda I)). $
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
	- $T$ is diagonalizable.
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

#see[#link("https://raw.githubusercontent.com/ethanc8/ekactl-references/trunk/linalg/math257/CompleteLectureNotes--Filled.pdf#Outline0.35")[MATH 257 [Module 35]], #link("https://raw.githubusercontent.com/ethanc8/ekactl-references/trunk/linalg/trimm/unit-6/6.3%20Powers%20of%20a%20Diagonalizable%20Operator.pdf")[Trimm [6.3]], #link("https://linear.axler.net/LADR4e.pdf#section.5.4")[Axler [5D]], #link("https://www.axler.net/DwD.pdf")[Axler-DwD]]

#lemma[
	If $v$ is an eigenvector of $T$ with eigenvalue $lambda$ and $n$ is a positive integer, then $T^n v = lambda^n v$.
]

#lemma[
	If $T$ is diagonalizable, then there exists a basis $D$ such that the diagonalization of $T$ is equal to
	$ [T]_D = C_(e to D) [T]_e C_(D to e) $
	(where $C_(e to D)$ is the transition matrix from the standard basis to $D$).

	This is often written in the equivalent form

	$ A &= P D P^(-1) \
	[T]_e &= C_(D to e) [T]_D C_(e to D). $

	Furthermore, for any positive integer $n$,
	$ [T]_e^n &= C_(D to e) [T]_D^n C_(e to D) \
	A^n &= P D^n P^(-1). $
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

== Matrix exponential

#see[#link("https://raw.githubusercontent.com/ethanc8/ekactl-references/trunk/linalg/math257/CompleteLectureNotes--Filled.pdf#Outline0.36")[MATH 257 [Module 36]]]

#definition[
	Let $A$ be an $n times n$-matrix. We define the matrix exponential $e^(A t)$ as
	$ e^(A t) = sum_(k >= 0) ((A t)^k)/(k!) = I + A t + ((A t)^2)/2! + ((A t)^3)/3! + dots.c $
]

#theorem[
	Let $A$ be an $n times n$ matrix. Then
	- the series $e^(A t)$ always converges,
	- $e^(A t) e^(-A t) = I_n$,
	- $e^(A t) e^(A s) = e^(A(t+s))$,
	- $d/(d t) (e^(A t)) = A e^(A t)$.
]

#theorem[
	Let $A$ be an $n times n$ matrix such that $A = P D P^(-1)$ for some invertible matrix $P$ and some diagonal matrix $D$. Then
	$ e^(A t) = P e^(D t) P^(-1). $
]

= Inner product spaces and orthogonality

For any discussion of inner product spaces, let $Field$ be $Reals$ or $Complex$.

== Inner product <sec:innerprod:innerprod>

#see[#link("https://linear.axler.net/LADR4e.pdf#section.6.1")[Axler [6A]], #link("https://raw.githubusercontent.com/ethanc8/ekactl-references/trunk/linalg/trimm/unit-7/7.1%20Inner%20Product%20Spaces-1.pdf")[Trimm [7.1]], #link("https://raw.githubusercontent.com/ethanc8/ekactl-references/trunk/linalg/math257/CompleteLectureNotes--Filled.pdf#Outline0.15")[MATH 257 [Module 15]]] // TODO Chuang

#definition(title: [Positive definite])[
	A map $f : V times V to Field$ is positive definite iff for any $v in V$ where $v != 0$,
	$ f(v, v) > 0 $
	and $f(0, 0) = 0$.
]

#definition(title: [Inner product on a real vector space])[
	Let $V$ be a real vector space. Then an inner product on $V$ is a positive definite symmetric bilinear form on $V$.

	The inner product of $v, w in V$ is denoted $(v, w)$.
]

#definition(title: [Norm])[
	If $u, v mapsto (u, v)$ is an inner product, then the #defname[norm] of a vector $v$ is defined as
	$ norm(v) := (v, v). $
]

#definition(title: [Dot product on $Reals^n$])[
	The dot product is the mapping that maps $v, w in Reals^n$ to the real number
	$ v dot w = sum_(i=1)^n v_i w_i = v^transpose w $

	It is an inner product on $Reals^n$, and satisfies the following properties for any $v, w, x in V$:
	- $(c v + w) dot x = c v dot x + w dot y$
	- $v dot w = w dot v$
	- $x dot (c v + w) = c x dot v + x dot w$
	- $norm(v) = sqrt(v dot v)$
]

#definition(title: [Conjugate-linear map])[
	A map $f : V to W$ where $V$ and $W$ are complex vector spaces is conjugate-linear iff for all $x, y in V$, $s in Complex$,
	- *Additivity*: $f(x + y) = f(x) + f(y)$
	- *Conjugate homogeneity*: $f(s x) = overline(s) f(x)$

	A conjugate-linear map is a type of *semilinear map*.
]

#definition(title: [Sesquilinear map])[
	A map $f : V times V to W$ which is linear in the first argument and semilinear in the second argument.

	If $V$ and $W$ are complex vector spaces, then semilinear is taken to mean conjugate-linear. Then, $f$ is sesquilinear iff for all $w, z_1, z_2 in V$, $c in Complex$,
	$ f(c w_1 + w_2, z) &= c f(w_1, z) + f(w_2, z), \
    f(w, c z_1 + z_2) &= overline(c) f(w, z_1) + f(w, z_2). $
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
	- $norm(v) = sqrt(v dot v)$
]

#definition(title: [Inner product space])[
	A vector space $V$ together with an inner product on $V$.
]

#theorem[
	For all $u, v in V$,
	- *Cauchy-Schwarz inequality*: $abs((u, v)) <= norm(u) norm(v)$
	- *Triangle Inequality*: $norm(u + v) <= norm(u) + norm(v)$
	- *Reverse Triangle Inequality*: $abs(|u| - |v|) <= norm(u - v)$
	- *Parallelogram Law*: $norm(u + v)^2 + norm(u - v)^2 = 2(norm(u)^2 + norm(v)^2)$
]

Let $V$ be an inner product space.

#definition(title: [Orthogonality])[
	Two vectors $u, v in V$ are orthogonal iff $(u, v) = 0$.
]

#lemma[
	0 is orthogonal to all vectors.
]

#theorem(title: [Pythagorean Theorem])[
	If $u, v in V$ are orthogonal, then
	$ norm(u + v)^2 = norm(u)^2 + norm(v)^2 $
]

#theorem(title: [Orthogonal decomposition])[
	Let $u, v in V$. Then $u$ can be uniquely decomposed as
	$ u = u_parallel + u_perp $
	where $u_parallel parallel v$ (i.e. $u_parallel = c v$ for some $c in Field$) and $u_perp perp v$ (i.e. $(u_perp, v) = 0$).

	We can construct them as:
	$ u_parallel := ((u, v))/norm(v)^2 v quad u_perp := u - u_parallel $
]

#definition(title: [Unit vector])[
	$v in V$ is a #defname[unit vector] iff $norm(v) = 1$.
]

#definition(title: [Orthogonal set])[
	A set $A$ where every $v, w in A$ are orthogonal.
]

#definition(title: [Orthonormal set])[
	An orthogonal set $A$ where every $v in A$ has $norm(v) = 1$.
]

== Orthogonal complement

#see[#link("https://raw.githubusercontent.com/ethanc8/ekactl-references/trunk/linalg/math257/CompleteLectureNotes--Filled.pdf#Outline0.23")[MATH 257 [Module 23]]]

#definition(title: [Orthogonal complement])[
	Let $W$ be a subspace of $Reals^n$. The #defname[orthogonal complement] of $W$ is the subspace $W^perp$ of all vectors that are orthogonal to $W$; that is
	$ W^perp := { v in Reals^n : v dot w = 0 "for all" w in W }. $
]

#remark[
	Observe that $(W^perp)^perp = W$.
]

#lemma(title: [Transpose is the adjoint of the dot product])[
	For all $x in Reals^n$ and $y in Reals^m$,
	$ (A x) dot y = x dot (A^transpose y). $
] <lem:transpose-adjoint>

#theorion-restate(filter: <lem:nullspace-orthogonal>)

#theorem[
	Let $V$ be a subspace of $Reals^n$. Then $dim V + dim V^perp = n$.
]

== Orthogonal projection

#see[#link("https://raw.githubusercontent.com/ethanc8/ekactl-references/trunk/linalg/math257/CompleteLectureNotes--Filled.pdf#Outline0.38")[MATH 257 [Modules 38, 39]]]

#definition(title: [Orthogonal projection onto a subspace])[
	Let $W$ be a subspace of $Reals^n$ and $vn(v) in Reals^n$. Then, $vn(v)$ can be written uniquely as
	$ vn(v) = vn(v)^parallel + vn(v)^perp $
	with
	- $vn(v)^parallel in W$
	- $vn(v)^perp in W^perp$.

	The #defname[orthogonal projection] of $vn(v)$ onto $W$ is $vn(v)^parallel$, denoted $proj_W vn(v)$.

	If $W = span(vn(w))$ for some vector $vn(w)$, then
	$ proj_vn(w) vn(v) := proj_span(vn(w)) vn(v). $
]

#theorem(title: [Orthogonal projection formula])[
	If $(vn(w)_1, ..., vn(w)_m)$ is an orthogonal basis of $W$, then
	$ proj_W (vn(v)) = ((vn(v) dot vn(w)_1)/(vn(w)_1 dot vn(w)_1)) vn(w)_1 + dots.c + ((vn(v) dot vn(w)_m)/(vn(w)_m dot vn(w)_m)) vn(w)_m. $

	For a projection onto a vector's span:
	$ proj_vn(w) (vn(v)) = (vn(v) dot vn(w))/(vn(w) dot vn(w)) vn(w). $
]

#definition(title: [Orthogonal projection map and matrix])[
	The #defname[orthogonal projection map] onto $W$ is the map $proj_W : Reals^n to Reals^n$ which is guaranteed to be linear.

	The matrix of this map under the standard basis is the #defname[orthogonal projection matrix], denoted $P_W := [proj_W]_cal(E)$.
]

#theorem(title: [Orthogonal projection matrix onto a vector])[
	$ proj_vn(w) (vn(v)) = P_vn(w) vn(v) $
	where $P_vn(w)$ is the $n times n$ orthogonal projection matrix onto $span(vn(w))$:
	$ P_vn(w) = 1/(vn(w) dot vn(w)) vn(w) vn(w)^transpose. $
]

#theorem(title: [Orthogonal projection matrix onto a column space])[
	Let $A$ be an $m times n$ matrix with linearly independent columns. Then
	$ P_(Col(A)) = A(A^T A)^(-1) A^T.  $
]

#lemma[
	- If $proj_W v = v$, then $v in W$.
	- If $proj_W v = 0$, then $v in W^perp$.
]

#lemma(title: [Orthogonal projection onto $W^perp$])[
	$ P_(W^perp) = I - P_W. $

	This follows from that $v^parallel = v - v^perp$.
]

== Least squares

#see[#link("https://raw.githubusercontent.com/ethanc8/ekactl-references/trunk/linalg/math257/CompleteLectureNotes--Filled.pdf#Outline0.40")[MATH 257 [Module 40]]]

In here, we want to find the best solution to $A x = b$ where $b in.not im(A) = Col(A)$.

#definition(title: [Least squares solution])[
	Let $A$ be an $m times n$ matrix and $b in Reals^m$. Let $op("dist")$ be the Euclidean distance. A #defname[least squares solution] of the system $A x = b$ is a vector $hat(x) in Reals^n$ such that
	$ op("dist")(A hat(x), b) = min_(x in Reals^n) op("dist")(A x, b). $
]

#theorem[
	Let $A$ be an $m times n$ matrix and $b in Reals^m$. Then $hat(x)$ is a least-squares solution to $A x = b$ if and only if (the following equivalent conditions):
	- $A hat(x) = proj_(Col(A)) b$.
	- $A^T A hat(x) = A^T b$, called the #defname[normal equation].
]

#image("/assets/image-2.png")

_Image from #link("https://pdodds.w3.uvm.edu/teaching/courses/2008-08UVM-124/content/docs/strang1993a.pdf")[Strang's 1993 paper]._

== Linear regression

#see[MATH 257 [#link("https://raw.githubusercontent.com/ethanc8/ekactl-references/trunk/linalg/math257/CompleteLectureNotes--Filled.pdf#Outline0.41")[Module 41], CL9]]

#procedure(title: [Linear regression])[
	Say we have a set of $n$ data points ${(t_1, y_1), ..., (t_n, y_n)}$. We want to fit this to the linear combination of $m$ different functions $f_1, ..., f_m$,
	$ y = x_1 f_1(t) + dots.c + x_m f_m(t) $
	1. Make the #defname[design matrix] $A$:
		$ A := mat(
			f_1(t_1), dots.c, f_m(t_1);
			dots.v, dots.down, dots.v;
			f_1(t_n), dots.c, f_m(t_n);
		). $
		As an example, the design matrix for $y = x_1 t^2 + x_2 t + x_3$ is
		$ A := mat(
			t_1^2, t_1, 1;
			dots.v, dots.v, dots.v;
			t_n^2, t_n, 1;
		). $
	2. Make the equation we want to solve:
	$ A vec(x_1, dots.v, x_m) = vec(y_1, dots.v, y_n). $
	3. Find a least-squares solution to the equation by solving for $hat(x)$:
	$ A^transpose A hat(x) = A^transpose y. $
]

#procedure(title: [Linear regression with QR decomposition])[
	1. Make the #defname[design matrix] $A$:
		$ A := mat(
			f_1(t_1), dots.c, f_m(t_1);
			dots.v, dots.down, dots.v;
			f_1(t_n), dots.c, f_m(t_n);
		). $
	2. Make the equation we want to solve:
	$ A vec(x_1, dots.v, x_m) = vec(y_1, dots.v, y_n). $
	3. $Q R$-decompose $A$ (see the next section) and solve the equation
	$ R hat(x) = Q^transpose y. $
]

== Gram-Schmidt and $Q R$-decomposition

#see[#link("https://raw.githubusercontent.com/ethanc8/ekactl-references/trunk/linalg/math257/CompleteLectureNotes--Filled.pdf#Outline0.42")[MATH 257 [Module 42]], Axler [#link("https://linear.axler.net/LADR4e.pdf#section.6.2")[6B], #link("https://linear.axler.net/LADR4e.pdf")[7D.3]]]

#theorem[
	Every subspace of $Reals^n$ has an orthonormal basis.
]

#procedure(title: [Gram-Schmidt orthonormalization])[
	Given a basis $vn(a)_1, ..., vn(a)_n$, produce an orthogonal basis $vn(b)_1, ..., vn(b)_n$ and an orthonormal basis $vn(q)_1, ..., vn(q)_n$ by:
	$ b_1 :&= a_1 & q_1 :&= b_1/norm(b_1) \
	b_2 :&= a_2 - proj_(b_1) (a_2) \
	&= a_2 - (a_2 dot q_1)q_1 & q_2 :&= b_2/norm(b_2) \
	b_3 :&= a_3 - proj_(span(b_1, b_2))(a_3) \
	&= a_3 - (a_3 dot q_1)q_1 + (a_3 dot q_2) q_2 &quad q_3 :&= b_3/norm(b_3) \
	&dots.v & &dots.v $
]

#theorem(title: [$Q R$-decomposition])[
	Let $A$ be an $m times n$ matrix of rank $n$. Then, there exists an $m times n$ matrix $Q$ with orthonormal columns (i.e. a unitary matrix) and an upper triangular $n times n$ invertible matrix $R$ s.t. $A = Q R$.

	$Q$ can be obtained by applying Gram-Schmidt to the columns of $A$.

	$R = Q^transpose A$. Alternately,
	$ R = mat(
		a_1 dot q_1, a_2 dot q_1, dots.c, a_n dot q_1;
		0, a_2 dot q_2, dots.c, a_n dot q_2;
		0, 0, dots.down, dots.v;
		0, 0, dots.c, a_n dot q_n;
	) $
]

#lemma[
	With $a_k$ being the $k$th column of $A$, $q_k$ being the $k$th column of $Q$, and $A = Q R$:
	$ a_1 &= R_(11) q_1 \
	a_2 &= R_(12) q_1 + R_(22) q_2 \
	a_3 &= R_(13) q_1 + R_(23) q_2 + R_33 q_3 \
	dots.v & dots.v $

	#image("/assets/image-3.png")

	_Image from #link("https://raw.githubusercontent.com/kenjihiranabe/The-Art-of-Linear-Algebra/main/The-Art-of-Linear-Algebra.pdf")[The Art of Linear Algebra]._
]

= Singular values and spectral methods

== Adjoint

#see[#link("https://linear.axler.net/LADR4e.pdf#section.7.1")[Axler [7A]], #link("https://web.physics.ucsb.edu/~davidgrabovsky/files-notes/Linear%20Algebra.pdf#page=15")[Grabowsky [8.0]], #link("https://ocw.mit.edu/courses/8-05-quantum-physics-ii-fall-2013/04b0570b349e84d74129eef504498472_MIT8_05F13_Chap_03.pdf#page=22")[Zwiebach [6]]]

#definition(title: [Adjoint])[
	The #defname[adjoint] of $T in linmaps(V to W)$ is the function $T^* : W to V$ s.t.
	$ inprod(T v, w) = inprod(v, T* w). $
]

#theorem[
	Suppose $T in linmaps(V, W)$. Then
	- $(S + T)^* = S^* + T^*$ for all $S in linmaps(V, W)$.
	- $(lambda T)^* = conj(lambda) T^*$ for all $lambda in Field$.
	- $(T^*)^* = T$.
	- $(S T)^* = T^* S^*$ for all $S in linmaps(W, U)$.
	- $I^* = I$.
	- $T$ invertible $implies$ $T^*$ invertible and $(T^*)^(-1) = (T^(-1))^*$.
	- $ker T^* = (im T)^perp$.
	- $im T^* = (ker T)^perp$.
	- $ker T = (im T^*)^perp$.
	- $im T = (ker T^*)^perp$.
]

#definition(title: [Conjugate transpose])[
	The conjugate transpose of an $m times n$ complex-valued matrix $A$ is the $n times m$ matrix $A^*$ obtained by interchanging the rows and columns, and then taking the complex conjugate of each entry:
	$ (A^*)_(j, k) &= conj(A_(k, j)) \
	A^* &= conj(A)^transpose = conj(A^transpose). $
]

#theorem[
	Let $T in linmaps(V, W)$ where $V$ and $W$ are vector spaces on the field $Complex$. Then, the matrix of $T^*$ with respect to orthonormal bases $B_V$ and $B_W$ is the conjugate transpose of $[T]$:
	$ [T^*] = [T]^* = conj([T]^transpose). $
]

#theorem[
	Let $T in linmaps(V, W)$ where $V$ and $W$ are vector spaces on the field $Reals$. Then, the matrix of $T^*$ with respect to orthonormal bases $B_V$ and $B_W$ is the transpose of $[T]$:
	$ [T^*] = [T]^transpose. $
]

== Self-adjoint operators

#see[#link("https://linear.axler.net/LADR4e.pdf#section.7.1")[Axler [7A]], #link("https://web.physics.ucsb.edu/~davidgrabovsky/files-notes/Linear%20Algebra.pdf#page=15")[Grabowsky [8.0]], #link("https://ocw.mit.edu/courses/8-05-quantum-physics-ii-fall-2013/04b0570b349e84d74129eef504498472_MIT8_05F13_Chap_03.pdf#page=24")[Zwiebach [7]]]

#definition(title: [Self-adjoint operator])[
	An operator $T in linmaps(V)$ is #defname[self-adjoint] iff it satisfies the equivalent conditions:
	- $T = T^*$.
	- $inprod(T v, w) = inprod(v, T w)$.

	Iff $V$ is a real inner product space, $T$ is called #defname[symmetric]. Iff $V$ is a complex inner product space, $T$ is called #defname[Hermitian].
]

#theorem[
	$T in linmaps(V)$, with $V$ a real inner product space, is symmetric iff $[T]$ is a #defname[symmetric matrix], i.e. $[T]^transpose = [T]$.

	$T in linmaps(V)$, with $V$ a complex inner product space, is symmetric iff $[T]$ is a #defname[Hermitian matrix], i.e. $conj([T]^transpose) = [T]$.
]

#theorem[
	Let $T in linmaps(V)$ where $V$ is a complex inner product space. Then,
	- $inprod(T v, v) = 0$ for every $v in V$ $<==>$ $T = 0$.
	- $T$ is self-adjoint $<==>$ $inprod(T v, v) in Reals$ for every $v in V$.
]

#theorem[
	If $T in linmaps(V)$ is self-adjoint (regardless of whether $V$ is real or complex), then
	- $inprod(T v, v) = 0$ for every $v in V$ $<==>$ $T = 0$.
]

#theorem[
	Every eigenvalue of a Hermitian (self-adjoint) operator $H in linmaps(V)$ is real (where $V$ is a complex inner product space).

	Thus, every eigenvalue of a symmetric real-valued matrix is real.

	Furthermore, eigenvectors of $H$ corresponding to distinct eigenvalues are orthogonal.
]

== Normal and unitary operators

#see[Axler [#link("https://linear.axler.net/LADR4e.pdf#section.7.1")[7A], #link("https://linear.axler.net/LADR4e.pdf#section.7.1")[7D]], #link("https://web.physics.ucsb.edu/~davidgrabovsky/files-notes/Linear%20Algebra.pdf#page=15")[Grabowsky [8.0]], #link("https://ocw.mit.edu/courses/8-05-quantum-physics-ii-fall-2013/04b0570b349e84d74129eef504498472_MIT8_05F13_Chap_03.pdf#page=24")[Zwiebach [7]]]

#definition(title: [Normal operator])[
	An operator $T in linmaps(V)$ is #defname[normal] iff $T^* T = T T^*$.
]

#theorem[
	$T$ is normal iff $norm(T v) = norm(T^* v)$ for every $v in V$.
]

#theorem[
	Let $T in linmaps(V)$ be a normal operator.
	- $ker T = ker T^*$
	- $im T = im T^*$
	- $V = ker T plus.o im T$
	- $T - lambda I$ is normal for every $lambda in Field$
	- If $v in V$ and $lambda in Field$, $T v = lambda v$ iff $T^* v = conj(lambda) v$.
]

#theorem[
	Let $T in linmaps(V)$ be a normal operator. Then, eigenvectors of $T$ corresponding to distinct eigenvalues are orthogonal.
]

#theorem[
	Every self-adjoint operator is normal.

	Every unitary operator is normal.
]

#definition(title: [Unitary operator])[
	An operator $T in linmaps(V)$ is #defname[unitary] iff it satisfies the equivalent conditions:
	- $inprod(T u, T v) = inprod(u, v)$.
	- $T^* T = T T^* = I$.
]

#theorem(title: [Orthogonal matrix])[
	Let $A$ be a real-valued square matrix.

	$ A^transpose = A^(-1) &<==> A "has orthonormal columns" \
	&<==> A "has orthonormal rows".
	$

	A matrix where $A^(-1) = A^transpose$ is called an #defname[orthogonal matrix].

	Iff $V$ is a real inner product space and $T in linmaps(V)$ is unitary, $T$ is called a #defname[orthogonal operator] and $[T]$ is an orthogonal matrix.
]

#theorem(title: [Unitary matrix])[
	Let $A$ be a square matrix.

	$ A^* = A^(-1) &<==> A "has orthonormal columns" \
	&<==> A "has orthonormal rows".
	$

	A matrix where $A^(-1) = A^*$ is called a #defname[unitary matrix].

	Iff $T in linmaps(V)$ is unitary, $[T]$ is a unitary matrix.
]

#theorem[
	If $T in linmaps(V)$ is unitary, then $T$ is an isometry.
]

#theorem[
	Let $T in linmaps(V)$ be a unitary operator. Then, every eigenvaluue of $T$ has unit norm, and eigenvectors of $T$ corresponding to distinct eigenvalues are orthogonal.
]

== Spectral theorem

#see[#link("https://raw.githubusercontent.com/ethanc8/ekactl-references/trunk/linalg/math257/CompleteLectureNotes--Filled.pdf#Outline0.1")[MATH 257 [Module 43]], #link("https://ocw.mit.edu/courses/18-06sc-linear-algebra-fall-2011/pages/positive-definite-matrices-and-applications/symmetric-matrices-and-positive-definiteness/")[Strang 18.06SC [Lecture 25]]]

#see[Abstract proofs: #link("https://linear.axler.net/LADR4e.pdf#section.7.2")[Axler [7B]], #link("https://web.physics.ucsb.edu/~davidgrabovsky/files-notes/Linear%20Algebra.pdf")[Grabovsky [8.2]]]

#theorem[
	Every operator on a complex vector space has an eigenvector.
]

#theorem(title: [Real spectral theorem])[
	Let $T in linmaps(V)$ where $V$ is a finite-dimensional real inner product space. Then, the following are equivalent:
	- $T$ is self-adjoint.
	- $T$ has a diagonal matrix with respect to some orthonormal basis of $V$.
	- $V$ has an orthonormal basis consisting of eigenvectors of $T$.
]

#theorem(title: [Real spectral theorem for matrices])[
	Iff the real-valued matrix $A = [T]_e$ is symmetric, it has an eigenbasis composed of orthonormal eigenvectors.

	Then, 
	$ A &= C_(D to e) [T]_D C_(e to D) \
	&= Q D Q^(-1) \
	&= Q D Q^transpose $

	where $Q$ is the orthogonal matrix $C_(D to e)$ whose columns are the orthonormal eigenvectors, and $D$ is the diagonal matrix containing the eigenvalues.
]

#theorem(title: [Complex spectral theorem])[
	Let $T in linmaps(V)$ where $V$ is a finite-dimensional complex inner product space. Then, the following are equivalent:
	- $T$ is normal.
	- $T$ has a diagonal matrix with respect to some orthonormal basis of $V$.
	- $V$ has an orthonormal basis consisting of eigenvectors of $T$.
]

#theorem(title: [Complex spectral theorem for matrices])[
	Iff the complex-valued matrix $A = [T]_e$ is conjugate-symmetric (Hermitian) or otherwise normal (i.e. $A^* A = A A^*$), it has an eigenbasis composed of orthonormal eigenvectors.

	Then, 
	$ A &= C_(D to e) [T]_D C_(e to D) \
	&= U D U^(-1) \
	&= U D U^* $

	where $U$ is the unitary matrix $C_(D to e)$ whose columns are the orthonormal eigenvectors, and $D$ is the diagonal matrix containing the eigenvalues.
]

#lemma(title: [Geometric interpetation of spectral theorem])[
	Given a self-adjoint matrix $A$,

	$ A = lambda_1 q_1 q_1^* + dots.c + lambda_n q_n q_n^*. $

	Each $q_k q_k^*$ is the orthogonal projection matrix onto the $k$th eigenvector, so $A$ is a weighted sum of projections onto perpendicular lines. Thus, a self-adjoint operator can only stretch things; it cannot rotate or shear.

#image("/assets/image-4.png")
_Image from #link("https://raw.githubusercontent.com/kenjihiranabe/The-Art-of-Linear-Algebra/main/The-Art-of-Linear-Algebra.pdf")[The Art of Linear Algebra]._

#image("/assets/image-5.png")
_Image from Strang's paper #link("https://doi.org/10.1080/10511970.2024.2321349")["The Art of Linear Algebra"]._
]

== Positive semidefinite operators

#see[#link("https://linear.axler.net/LADR4e.pdf#section.7.3")[Axler [7C]]]

#definition(title: [Positive semidefinite operator])[
	An operator $T in linmaps(V)$ is #defname[positive semidefinite] iff $inprod(T v, v) >= 0$ for all $v in V$.
	
	When $T$ is additionally self-adjoint, this is equivalent to:
	- All eigenvalues of $T$ are nonnegative
	- All leading principal minors of $[T]$ are nonnegative, with respect to an orthonormal basis
	- All pivots of $[T]$ are nonnegative

	Many authors require positive semidefinite operators to be self-adjoint.
]

#theorem[
	For any operator $T$, $T^* T$ and $T T^*$ are self-adjoint, positive semidefinite operators.
]

== Singular value decomposition

#see[#link("https://mml-book.github.io/book/mml-book.pdf#section.4.5")[MML [4.5]], #link("https://linear.axler.net/LADR4e.pdf#section.7.5")[Axler [7E]], #link("https://raw.githubusercontent.com/ethanc8/ekactl-references/trunk/linalg/math257/CompleteLectureNotes--Filled.pdf#Outline0.44")[MATH 257 [Module 44]]]

#theorem(title: [Properties of $T^* T$])[
	Suppose $T in linmaps(V, W)$. Then
	- $T^* T$ is a self-adjoint positive semidefinite operator on $V$.
	- $ker T^* T = ker T$.
	- $im T^* T = im T^*$.
	- $dim im T = dim im T^* = dim im T^* T$.
]

#theorem(title: [Singular value decomposition])[
	Let $A$ be an $m times n$ matrix of rank $r$. Then, $A$ can be written in the form (called the #defname[singular value decomposition])
	$ A = U Sigma V^*, $

	with a unitary $m times m$ matrix $U$, unitary matrix $V$, and (possibly rectangular) diagonal matrix $Sigma$.

	(In $Reals$, $A = U Sigma V^transpose$ and $U$ and $V$ are also orthogonal.)

	$Sigma$ is called the #defname[singular value matrix], and its diagonal entries $sigma_1, ..., sigma_(min(m, n))$ are called #defname[singular values]. By convention, they are ordered in decreasing order ($sigma_1 >= sigma_2 >= dots.c >= 0$.)
	
	The columns of $U$ are called #defname[left-singular vectors] and the columns of $V$ are called #defname[right-singular vectors].

	We can further write $A$ as a sum of outer products weighted by the singular values:

	$ A = U Sigma V^* = sigma_1 u_1 v_1^* + dots.c + sigma_r u_r v_r^*. $

#image("/assets/image-6.png")
_Image from Strang's paper #link("https://doi.org/10.1080/10511970.2024.2321349")["The Art of Linear Algebra"]._
]

#lemma(title: [Geometric intepretation of SVD])[
	Consider a linear map $T : Reals^n to Reals^m$ and its $m times n$ matrix $[T]_(E_m E_n)$. Consider two other bases $B_U$ and $B_V$ of $Reals^m$ and $Reals^n$ respectively.

	The steps of SVD ($[T]_(E_m E_n) = U Sigma V^transpose$) are:
	1. *$V^transpose$ changes basis.* $V^transpose$ performs a change of basis from $E_n$ to $B_V$ in the domain $Reals^n$.
	2. *$Sigma$ scales and augments/reduces dimension.* $Sigma$ scales the new coordinates by the singular values $sigma_i$ (possibly adding or reducing dimensions). $Sigma = [T]_(B_U B_V)$, the matrix of $T$ with respect to $B_V$ and $B_U$. Now, $Sigma V^transpose v$ is a vector with respect to $B_U$, given any input vector $v$ with respect to $E_n$.
	3. *$U$ changes basis.* $U$ performs a change of basis from $B_U$ back to the standard basis $E_m$ in the codomain $Reals^m$.

	Since $V^transpose$ and $U$ are both unitary, they are isometries (preserving all lengths and angles). Thus they can only rotate and reflect. Meanwhile, since $Sigma$ is (possibly rectangular) diagonal, it can only scale and augment or reduce dimension.

	The following image describes this for a transformation $T : Reals^2 to Reals^3$ whose standard matrix is a $3 times 2$ matrix $A$:
	#image("/assets/image-7.png")
	_Image from #link("https://mml-book.github.io/book/mml-book.pdf#section.4.5")[MML [4.5]]._
]

#remark(title: [Construction of the SVD])[
	Let $A$ be an $m times n$ matrix.

	*Constructing the right-singular vectors $B_V$.* We need an orthonormal basis $B_V = (v_1, dots, v_n)$ which we will use as the columns of $V$. We know that $A^* A$ is a self-adjoint positive semidefinite matrix, so we eigendecompose $A^* A$ into $P D P^*$. We obtain (by spectral theorem) unitary matrix $P$ composed of the orthonormal eigenbasis of $A^* A$, and diagonal matrix $D$ composed of the eigenvalues of $A^* A$. If we assume the SVD of $A$ exists, then:
	$ A^* A &= (U Sigma V^*)^* (U Sigma V^*) \
	&= V Sigma^* U^* U Sigma V^*. $
	Since $U$ and $V$ are unitary, $U^* U = I$, so 
	$ A^* A &= V Sigma^* Sigma V^* \
	&= V diag(sigma_1^2, dots, sigma_n^2) V^*. $

	Thus, $V^* = P^*$ and $sigma_i^2 = lambda_i$: the eigenvectors of $A^* A$ are the right-singular vectors of $A$ and the eigenvalues of $A^* A$ are the squares of the singular values of $A$.

	*Constructing the left-singular vectors $B_U$.* We need an orthonormal basis $B_U = (u_1, dots, u_m)$ which we will use as the columns of $U$. We know that $A A^*$ is a self-adjoint positive semidefinite matrix, so we eigendecompose $A A^*$ into $P D P^*$, obtaining unitary $P$ and diagonal $D$. Assuming the SVD of $A$ exists,
	$ A A^* &= (U Sigma V^*) (U Sigma V^*)^* \
	&= U Sigma V^* V Sigma^* U^* \
	&= U Sigma Sigma^* U^* \
	&= U diag(sigma_1^2, dots, sigma_m^2) U^*. $

	Thus, $U = P$ and $sigma_i^2 = lambda_i$: the eigenvectors of $A A^*$ are the left-singular vectors of $A$ and the eigenvalues of $A A^*$ are the squares of the singular values of $A$.

	*Constructing the singular value matrix.* $A A^*$ and $A^* A$ possess the same eigenvalues, since if $A A^* v = lambda v$ with $lambda != 0$, then $(A^* A)(A^* v) = A^* (A A^* v) = lambda(A^* v)$, and $A^* v != 0$ since $lambda != 0$. (Alternately if $A$ is real-valued, then we know that $A A^* = (A^* A)^transpose$, and the eigenvalues of a matrix and its transpose are the same.) Thus the nonzero entries of $Sigma$ in both cases must be the same.

	Now we need to show that the images of the $v_i$ under $A$ must be orthogonal, i.e. we want to show that $inprod(A v_i, A v_j) = 0$ for all $i != j$. For any $i != j$, we have that
	$ inprod(A v_i, A v_j) = inprod(v_i, A^* A v_j) = inprod(v_i, lambda_j v_j) = lambda_j inprod(v_i, v_j) = 0. $
	(Using definition of the adjoint, then that $v_j$ is an eigenvector of $A^* A$, then orthogonality of eigenvectors.)

	*Constructing left-singular vectors consistent with $V$ and $Sigma$.* We now need to construct left-singular vectors consistent with $V$ and $Sigma$, s.t $A = U Sigma V^transpose$.

	To do this, we normalize the images of the right-singular vectors:
	$ u_i := (A v_i)/norm(A v_i) = 1/sqrt(lambda_i) A v_i = 1/(sigma_i) A v_i. $

	*Singular value equation.* Rearranging our most recent definition of the $u_i$:
	$ A v_i = sigma_i u_i quad i = 1, dots, r. $

	When $n < m$, the singular value equation holds only for $i <= n$. We need to find more $u_i$, so we find these by extending the ${u_i}$ to an orthonormal basis of the whole space (by concatenating ${u_i}$ with an orthonormal basis of $(span {u_i})^perp$). When $m < n$, for $i > m$, $A v_i = 0$, so the remaining $v_i$ with $i > m$ form an orthonormal basis of the nullspace of $A$. We get these remaining $v_i$ from our eigendecomposition of $A^* A$.
]

#procedure(title: [Computing the SVD])[
	Let $A$ be an $m times n$ matrix.
	1. *Right-singular vectors from $A^* A$.*
	  a. Compute $A^* A$.
		b. Eigendecompose $A^* A$ into $P D P^*$ such that the eigenvalues in $D$ are arranged in descending order.
		c. Choose $V := P$; i.e. the right-singular vectors are the columns of $P$.
	2. *Singular-value matrix.*
		a. Extract the eigenvalues $lambda_1, dots, lambda_n$ from $D$ (from step 1).
		b. Define $Sigma := diag(sqrt(lambda_1), dots, sqrt(lambda_n))$.
		c. Extend $Sigma$ with zeros so that its shape is the shape of $A$ (i.e. $m times n$).
	3. *Left-singular vectors as the normalized image of the right-singular vectors.*
		a. Compute each $u_i := (A v_i)/norm(A v_i) = 1/(sigma_i) A v_i.$
		b. Find an orthonormal basis of $(span{u_1, dots, u_r})^perp$, the left nullspace of $A$ ($Nul A^perp$), by finding a basis and using Gram-Schmidt to orthonormalize the basis.
		c. Append this orthonormal basis of $Nul A^perp$ to the end of ${u_i}$.
		c. Put these $u_i$ as the columns of matrix $U$.
]

#remark(title: [Numerical stability])[
	The above procedure is not very numerically stable, so it is unsuitable for use in many computational applications.

	The #defname[condition number] of a matrix $A$ is a measure of how sensitive the solution of $A x = b$ is to small perturbations in $A$ or $b$. It is usually defined as
	$ kappa(A) := norm(A)_2 dot norm(A^(-1))_2 = sigma_max / sigma_min, $

	where $norm(A)_2$ is the spectral norm (defined in the next section on low-rank approximation). Since $kappa(A^* A) = kappa(A)^2$, it is much more numerically unstable. 

	In order to avoid this, other algorithms (not covered in these notes) are used:
	- *Golub-Reinsch algorithm*: Reducing $A$ to bidiagonal form using Householder reflections and applying a QR algorithm to extract singular values.
	- *Jacobi SVD:* Applying sequences of plane rotations directly to $A$.
	- *Divide-and-conquer SVD:* faster for large matrices.
	- *Randomized SVD:* computes an approximate low-rank SVD efficiently for sparse matrices, common in machine learning.
]

#remark(title: [Reduced SVD])[
	It may sometimes be useful to use smaller matrices in order to have a diagonal $Sigma$ and other useful properties. They are constructed in essentially the same ways. Given here an $m times n$ mmatrix $M$ with rank $r$, we have:

	1. The #defname[full SVD].
	2. The #defname[thin SVD] or #defname[reduced SVD], removing columns of $U$ not corresponding to rows of $V^*$, giving a diagonal $Sigma$.
	3. The #defname[compact SVD], retaining only the nonzero singular values.
	4. The #defname[truncated SVD], retaining only the $t$ largest singular values.

	#image("/assets/image-8.png")
	_Image from Wikipedia #link("https://en.wikipedia.org/wiki/File:Reduced_Singular_Value_Decompositions.svg")["Reduced Singular Value Decompositions.svg"]._
]

#remark(title: [Eigendecomposition vs SVD])[
	- The SVD always exists for any matrix. Eigendecomposition is only defined for square matrices which have an eigenbasis.
	- The vectors in the eigendecomposition matrix $P$ are not necessarily orthogonal; i.e. the change of basis is not an isometry. However, $U$ and $V$ in SVD are isometries (rotations and reflections).
	- Both eigendecomposition and SVD are compositions of three linear mappings:
		- Change of basis in the domain
		- Independent scaling along each axis (in the new basis), and mapping from domain to codomain
		- Change of basis in the codomain
	- However, SVD allows the domain and codomain to be different dimensions.
	- In SVD, $U$ and $V$ are generally not inverses. In eigendecomposition, $P$ and $P^(-1)$ are inverses.
	- In SVD, the entries in $Sigma$ are all real and nonnegative. This is not necessarily true for eigendecomposition $D$.
	- SVD and eigendecomposition are closely related through their projections:
		- The left-singular vectors of $A$ are eigenvectors of $A A^*$
		- The right-singular vectors of $A$ are eigenvectors of $A^* A$
		- The nonzero singular values of $A$ are the square roots of the nonzero eigenvalues of both $A A^*$ and $A^* A$
	- By spectral theorem, for a self-adjoint matrix the eigendecomposition is equal to the SVD
]

#theorem[
	Let $A$ be an $m times n$ matrix with rank $r$. Let $A = U Sigma V^*$ be an SVD of $A$ with $U = [u_1 dots.c u_m]$ and $V = [v_1, dots.c v_n]$. Then,
	- $(u_1, dots, u_r)$ is a basis of $Col(A)$.
	- $(v_1, dots, v_r)$ is a basis of $Col(A^*)$.
	- $(u_(r + 1), dots, u_m)$ is a basis of $Nul(A^*)$.
	- $(v_(r + 1), dots, v_n)$ is a basis of $Nul(A)$.
]

#definition(title: [Singular value])[
	Let $T in linmaps(V, W)$. The #defname[singular values] of $T$ are the nonnegative square roots of the eigenvalues of $T^* T$, listed in decreasing order, each included as many times as the dimension of the corresponding eigenspace of $T^* T$.
]

#theorem(title: [Role of positive singular values])[
	Suppose that $T in linmaps(V, W)$. Then
	- $T$ is injective $<==>$ $0$ is not a singular value of $T$.
	- The number of positive singular values of $T$ equals $dim im T$.
	- $T$ is surjective $<==>$ the number of positive singular values of $T$ equals $dim W$.
]

== Spectral norm

#see[#link("https://mml-book.github.io/book/mml-book.pdf#section.4.6")[MML [4.6]]]

#definition(title: [Spectral norm])[
	The #defname[spectral norm] of a linear map $T in linmaps(V, W)$, denoted $norm(T)_2$ (or just $norm(T)$ when no other norms are being considered) is defined as the following equivalent numbers:
	$ norm(T)_2 :&= max{norm(T v) : v in V "and" norm(v) <= 1} \
	&= max{norm(T v)/norm(v) : v in V - {0}} \
	&= max{norm(T v) : v in V "and" norm(v) = 1} \
	&= sigma_max (T) = "the largest singular value of " T \
	&= min{c : norm(T v) <= c norm(v) "for all" v in V} $
]

#theorem(title: [Basic properties of spectral norm])[
	Let $S, T in linmaps(V, W)$. Then,
	- $norm(T) >= 0$.
	- $norm(T) = 0 <==> T = 0$.
	- $norm(lambda T) = abs(lambda) norm(T)$ for all $lambda in Field$.
	- *Triangle inequality:* $norm(S + T) <= norm(S) + norm(T)$.
	- *Reverse triangle inequality:* $abs(norm(S) - norm(T)) <= norm(S - T)$.
	- $norm(T^*) = norm(T)$.
	- $d(S, T) := norm(S - T)$ makes $d$ a metric (in the metric spaces sense) on $linmaps(V, W)$.
]

== Low-rank approximation via SVD

#see[#link("https://mml-book.github.io/book/mml-book.pdf#section.4.6")[MML [4.6]], #link("https://linear.axler.net/LADR4e.pdf#section.7.6")[Axler [7F]], #link("https://raw.githubusercontent.com/ethanc8/ekactl-references/trunk/linalg/math257/CompleteLectureNotes--Filled.pdf#Outline0.45")[MATH 257 [Module 45]]]

#definition(title: [Rank-$k$ approximation])[
	Let $A$ be an $m times n$ matrix of rank $r$. Then the #defname[rank-$k$ approximation] to $A$ is the matrix of rank $k$ (with $k <= r$) defined as:
	$ hat(A)(k) := sum_(i = 1)^k sigma_i u_i v_i^* = sigma_1 u_1 v_1^* + dots.c + sigma_k u_k v_k^*. $

	Note that each $sigma_i u_i v_i^*$ is a rank-1 matrix, and that the rank-$r$ approximation to $A$ is exactly $A$.
]

#theorem(title: [Eckart-Young Theorem])[
	Let $A$ be an $m times n$ matrix of rank $r$, and $hat(A)(k)$ be the rank-$k$ approximation to $A$. Then,
	$ norm(A - hat(A)(k))_2 = sigma_(k + 1). $

	Furthermore, the rank-$k$ approximation to $A$ defined above is the optimal approximation of rank at most $k$ to $A$ (i.e. has the lowest difference from $A$ under the spectral norm).

	That $norm(A - hat(A)(k))_2 = sigma_(k + 1)$ follows immediately from that 
	$ A - hat(A)(k) = sum_(i = k + 1)^r sigma_i u_i v_i^* $
	and that $sigma_(k + 1)$ is the largest singular value of that sum and is thus the spectral norm of that sum. Proving it is the optimal approximation is harder; see the proof in #link("https://mml-book.github.io/book/mml-book.pdf#section.4.6")[MML [4.6]] or #link("https://linear.axler.net/LADR4e.pdf#section.7.6")[Axler [7F]].
]

== Moore-Penrose pseudoinverse

#see[#link("https://mml-book.github.io/book/mml-book.pdf#section.4.6")[MML [4.6]], #link("https://raw.githubusercontent.com/ethanc8/ekactl-references/trunk/linalg/math257/CompleteLectureNotes--Filled.pdf#Outline0.46")[MATH 257 [Module 46]]]

#definition(title: [Moore-Penrose pseudoinverse])[
	The #defname[pseudoinverse] of $m times n$ matrix $A$ of rank $r$, denoted $A^+$, is the unique $n times m$ matrix satisfying the four Moore-Penrose conditions:
	- $A A^+ A = A$ -- $A A^+$ is the orthogonal projection onto $Col(A)$.
	- $A^+ A A^+ = A^+$
	- $A A^+$ is self-adjoint
	- $A^+ A$ is self-adjoint

	It can be found by the following means:
	- $A^+ = V_c Sigma_c^(-1) U_c^*$, where $A = U_c Sigma_c V_c^*$ is the compact SVD of $A$ (s.t. $Sigma_c$ is $r times r$).
	- $A^+ = (A^* A)^(-1) A^*$, if $A^* A$ is positive definite, which is the case if $A$ is full column rank ($r = n$).
	- $A^+ = A^* (A A^*)^(-1)$, if $A A^*$ is positive definite, which is the case if $A$ is full row rank ($r = m$).
]

#theorem[
	Let $v in Col(A^*)$ and $w in Col(A)$. Then, $A^+ A v = v$ and $A A^+ w = w$.
]

#lemma[
	If $A$ is $n times n$ and invertible, then $Col(A) = Reals^n$. Thus, $A^(-1) = A^+$.
]

#lemma[
	Let $v_r in Col(A^*)$ and $v_n in Nul(A)$. Then $A^+ A (v_r + v_n) = v_r$.
]

#theorem[
	Let $A$ be an $m times n$ matrix and $b in Reals^m$. Then $A^+ b$ is the least-squares solution of $A x = b$.
]

= Appendix: Graphs

== Graphs

#definition[
	A graph is a set of nodes (or: vertices) that are connected through edges.
]

#definition[
	Let $G$ be a graph with $n$ nodes. The adjacency matrix of $G$ is the $n times n$-matrix $A = (a_(i j))$ such that
	$ a_(i j) = cases(
		1 & "if there is an edge between node" i "and node" j,
		0 & "otherwise",
	) $
]

#definition[
	A walk of length $k$ on a graph is a sequence of $k+1$ vertices and $k$ edges between two nodes (including the start and end) that may repeat. A path is a walk in which all vertices are distinct.
]

#definition[
	A graph is connected if for every pair of nodes $i$ and $j$ there is a walk from node $i$ to node $j$. A graph is disconnected if it is not connected.
]

#theorem[
	Let $G$ be a graph and let $A$ be its adjacency matrix. Then the entry in the $i$-th row and $j$-th column of $A^ell$ is the number of walks of length $ell$ from node $j$ to node $i$ on $G$.
]

#definition[
	A directed graph is a set of vertices connected by edges, where the edges have a direction associated with them.
]

#definition[
	Let $G$ be a directed graph with $m$ edges and $n$ nodes. The adjacency matrix of $G$ is the $n times n$ matrix $A = (a_(i,j))_(i,j)$ with
	$ a_(i,j) = cases(
		1 & "if there is a directed edge from node" j "to node" i,
		0 & "otherwise",
	) $
]

#definition[
	Let $G$ be a directed graph with $m$ edges and $n$ nodes. The edge-node incidence matrix of $G$ is the $m times n$ matrix $A = (a_(i,j))_(i,j)$ with
	$ a_(i,j) = cases(
		-1 & "if edge" i "leaves node" j,
		+1 & "if edge" i "enters node" j,
		0 & "otherwise",
	) $
]

#definition[
	A connected component of an undirected graph is a part in which any two vertices are connected to each other by paths, and which is connected to no additional vertices in the rest of the graph. The connected components of a directed graph are those of its underlying undirected graph. A graph is connected if it has only one connected component.
]

#theorem[
	Let $G$ be a directed graph and let $A$ be its edge-node incidence matrix. Then $dim op("Nul")(A)$ is equal to the number of connected components of $G$.
]

#definition[
	A cycle in an undirected graph is a path in which all edges are distinct and the only repeated vertices are the first and last vertices. By cycles of a directed graph we mean those of its underlying undirected graph.
]

#definition[
	The span of all cycle vectors of a graph $G$ is called the cycle space.
]

#theorem[
	Let $G$ be a directed graph and let $A$ be its edge-node incidence matrix. Then the cycle space of $G$ is equal to $op("Nul")(A^T)$.
]

#remark(title: [Why the walk-counting theorem is true (case $ell = 2$)])[
	Write $A$'s rows as $R_1, dots, R_n$ and columns as $C_1, dots, C_n$. By the row-column rule,
	$ (A^2)_(i j) = R_i dot C_j = A_(i 1) A_(1 j) + A_(i 2) A_(2 j) + dots.c + A_(i n) A_(n j). $
	Each summand $A_(i k) A_(k j)$ equals $1$ exactly when there is an edge from $j$ to $k$ *and* an edge from $k$ to $i$ — i.e. exactly when it witnesses a walk of length $2$ from $j$ to $i$ passing through $k$. Since every walk of length $2$ passes through exactly one intermediate node, the sum counts all such walks. The same argument, with $A^(ell - 1)$ in place of $A$, extends this to any $ell$ by induction.
]

#lemma[
	The adjacency matrix of an undirected graph is symmetric: $A^transpose = A$. A nonzero diagonal entry $A_(i i)$ indicates a #defname[self-loop] at node $i$.
]

#remark[
	Since $(I)_(i j) = 1$ exactly when $i = j$, it is natural to regard $I$ as counting the (trivial) walk of length $0$ from a node to itself. Consequently $I + A$ counts walks of length $0$ or $1$ between each pair of nodes — and more generally, $I + A + A^2 + dots.c + A^k$ counts walks of length at most $k$.
]

#theorem(title: [Walks of length at most $k$])[
	Let $G$ be a graph with adjacency matrix $A$. Every node of $G$ is connected to every other node by a walk of length at most $k$ if and only if
	$ I + sum_(i=1)^k A^i $
	has no zero entries.
]

#remark[
	Two subtleties:
	- Using $sum_(i=1)^k A^i$ *without* the $I$ term counts only nontrivial walks between each pair; it can still have zero diagonal entries even for a connected graph, since a node need not have a walk back to itself of length $<= k$.
	- Using $A^k$ *alone* does not correctly count "reachable within $k$ steps": a node reached in fewer than $k$ steps is forced to leave again at the next step, unless $A$ already has a self-loop at every node (cf. $A + I$).
]

#corollary[
	A graph on $n$ nodes is connected if and only if $I + sum_(i=1)^(n-1) A^i$ has no zero entries — since any walk connecting two distinct nodes without revisiting a node uses at most $n - 1$ edges, taking $k = n - 1$ always suffices to test full connectivity.
]

#remark(title: [Potential interpretation of $op("Nul")(M)$])[
	Let $M$ be the edge-node incidence matrix of a directed graph $G$ with $n$ nodes, and think of $vn(x) in Reals^n$ as assigning a #defname[potential] $x_k$ to each node $k$. For the row of $M$ corresponding to an edge $e$ from node $j$ to node $i$,
	$ (M vn(x))_e = x_i - x_j, $
	so $M vn(x) = 0$ forces the potentials at the two endpoints of every edge to agree. Hence $vn(x) in op("Nul")(M)$ assigns equal potential to every pair of nodes joined by a path — i.e. constant potential on each connected component. This gives another route to $dim op("Nul")(M) = $ number of connected components: a basis is given by the indicator vector of each connected component.
]

#remark(title: [Flow interpretation of $op("Nul")(M^transpose)$])[
	Think of $vn(y) in Reals^m$ ($m$ = number of edges) as assigning a flow $y_e$ to each edge. For node $k$,
	$ (M^transpose vn(y))_k = ("total inflow at" k) - ("total outflow at" k), $
	so $vn(y) in op("Nul")(M^transpose)$ exactly when inflow equals outflow at every node — #defname[Kirchhoff's current law]. This is why the cycle space (flows that balance at every node) equals $op("Nul")(M^transpose)$.
]

#procedure(title: [Writing a cycle as a vector])[
	Given a cycle in $G$ and a chosen direction to traverse it, build $vn(c) in Reals^m$ by setting, for each edge $e$:
	- $c_e = +1$ if the cycle traverses $e$ in $e$'s own defined direction (tail to head),
	- $c_e = -1$ if traversed against it,
	- $c_e = 0$ if $e$ is not part of the cycle.

	Any such $vn(c)$ automatically satisfies $M^transpose vn(c) = 0$ (flow is conserved at every node along the cycle).
]

#remark[
	Cycle vectors built this way need not be independent — e.g. for three cycles that share edges, one may find $vn(c)_1 + vn(c)_2 = vn(c)_3$. As with any null space, a genuine *basis* for the cycle space is found by solving $M^transpose vn(y) = 0$ with the usual homogeneous-system procedure (see [Linear systems and matrices]), not by listing cycles directly.
]

= Appendix: Markov matrices

#see[MATH 257 [#link("https://raw.githubusercontent.com/ethanc8/ekactl-references/trunk/linalg/math257/CompleteLectureNotes--Filled.pdf#Outline0.33")[Module 33], CL7]]

== Markov chains

#definition(title: [Markov chain])[
	A #defname[Markov chain] is a finite set of states $S = {s_1, dots, s_n}$ together with transition probabilities $p_(i j) in [0, 1]$, where $p_(i j)$ is the probability of moving from state $s_j$ to state $s_i$ in one step.

	A Markov chain can be represented as a directed weighted graph with one node per state and a weighted edge from $s_j$ to $s_i$ of weight $p_(i j)$ whenever $p_(i j) > 0$. A Markov chain can also be represented as a matrix:
]

#definition(title: [Markov matrix, stochastic matrix])[
	A #defname[Markov matrix] or #defname[(column-)stochastic matrix] is an $n times n$ matrix $M$ whose entries are nonneg­ative and whose columns each sum to 1:
	$ M_(i j) >= 0 "for all" i, j, quad sum_i M_(i j) = 1 "for all" j. $

	This follows the column = source convention: $M_(i j)$ is the probability of transitioning *from* state $j$ *to* state $i$.
]

#definition(title: [State vector, probability vector])[
	A #defname[state vector] or #defname[probability vector] is a vector $vn(x) in Reals^n$ with nonneg­ative entries summing to 1:
	$ x_i >= 0 "for all" i, quad sum_i x_i = 1. $
	The entry $x_i$ is the probability that the system is currently in state $s_i$.
]

#theorem[
	If $M$ is a Markov matrix and $vn(x)$ is a state vector, then $M vn(x)$ is also a state vector.
]

#remark[
	This means a Markov matrix *maps* state vectors to state vectors. In particular, $sum_i (M vn(x))_i = sum_j x_j sum_i M_(i j) = sum_j x_j = 1$ by the column-sum property.
]

#definition(title: [Markov chain dynamics])[
	Let $vn(x)_k$ be the state vector at time step $k$. The state evolves by
	$ vn(x)_(k+1) = M vn(x)_k, $
	so $vn(x)_k = M^k vn(x)_0$.
]

== Steady states

#definition(title: [Stationary distribution, steady state])[
	A #defname[stationary distribution] or #defname[steady state] of a Markov matrix $M$ is a state vector $vn(x)^*$ satisfying
	$ M vn(x)^* = vn(x)^*. $
	That is, $vn(x)^*$ is an eigenvector of $M$ for the eigenvalue $lambda = 1$, normalized so its entries sum to 1.
]

#theorem[
	Every Markov matrix has $lambda = 1$ as an eigenvalue.
] <thm:markov-eigenvalue-1>

#proof[
	Let $vn(1) = (1, 1, dots, 1)^transpose$. Since each column of $M$ sums to 1,
	$ (M^transpose vn(1))_j = sum_i M_(i j) = 1, $
	so $M^transpose vn(1) = vn(1)$. Thus $1$ is an eigenvalue of $M^transpose$. Since $M$ and $M^transpose$ have the same characteristic polynomial ($det(lambda I - M^transpose) = det((lambda I - M)^transpose) = det(lambda I - M)$), they share the same eigenvalues. Hence $lambda = 1$ is an eigenvalue of $M$.
]

#theorem[
	Every eigenvalue $lambda$ of a Markov matrix satisfies $|lambda| <= 1$.
]

#theorem(title: [Convergence for positive Markov matrices])[
	Let $M$ be an $n times n$ Markov matrix with all entries strictly positive ($M_(i j) > 0$ for all $i, j$). Then:
	+ $lambda = 1$ is the unique eigenvalue of $M$ with $|lambda| = 1$.
	+ The eigenspace for $lambda = 1$ is one-dimensional; there is a unique steady state $vn(x)^*$.
	+ For any starting state vector $vn(x)_0$,
	$ lim_(k to infty) M^k vn(x)_0 = vn(x)^* $
	regardless of $vn(x)_0$.
] <thm:markov-convergence>

#remark[
	This is why Markov chains are useful for modeling long-run behavior: for a sufficiently "connected" system, the initial distribution is forgotten and the chain settles to $vn(x)^*$.
]

== Irreducibility

The strict-positivity condition of @thm:markov-convergence is sufficient but stronger than necessary. The right general condition is irreducibility.

#definition(title: [Irreducible Markov chain])[
	A Markov chain is #defname[irreducible] if for every pair of states $i, j$ there exists $k >= 1$ such that $(M^k)_(i j) > 0$ — i.e. every state is reachable from every state in some number of steps. Equivalently, the directed graph of the chain is strongly connected.

	A chain that is not irreducible is #defname[reducible].
]

#remark[
	A positive Markov matrix always gives an irreducible chain (every state is reachable in one step), so @thm:markov-convergence is a special case of the more general statement: an irreducible Markov chain has a unique steady state. However, irreducibility alone does not guarantee convergence to it — one also needs *aperiodicity* (no states that the chain can only return to in a fixed period $> 1$). For the applications in this course, positive entries imply both conditions simultaneously, so we state @thm:markov-convergence in the simpler form.
]

#example(title: [Gambler's ruin])[
	A gambler starts with $\$k$ and at each step wins $\$1$ (probability $1/2$) or loses $\$1$ (probability $1/2$), stopping at $\$0$ (loss) or $\$3$ (win). The states are $\$0, \$1, \$2, \$3$ and the Markov matrix is
	$ G = mat(1, 1/2, 0, 0; 0, 0, 1/2, 0; 0, 1/2, 0, 0; 0, 0, 1/2, 1). $

	States $\$0$ and $\$3$ are *absorbing* — once entered they are never left. The chain is reducible: starting from $\$1$, neither $\$2$ nor $\$3$ can reach $\$0$. The eigenvalue $lambda = 1$ has a 2-dimensional eigenspace (spanned by the indicator vectors of $\$0$ and $\$3$) and the long-run distribution depends on the starting state:
	- Starting at $\$1$: probability $2/3$ of losing, $1/3$ of winning.
	- Starting at $\$2$: probability $1/3$ of losing, $2/3$ of winning.

	The other two eigenvalues are $plus.minus 1/2$, so the transient part decays and a limit exists — but it is not unique across starting states.
]

== Power iteration

#algorithm(title: [Power iteration])[
	To approximate the dominant eigenvector of a matrix $M$ (the eigenvector for the eigenvalue of largest magnitude):

	+ Start with any vector $vn(x)_0$.
	+ Repeatedly compute $vn(x)_(k+1) = M vn(x)_k$.
	+ Optionally normalize after each step: $vn(x)_(k+1) <- vn(x)_(k+1) \/ norm(vn(x)_(k+1))$.

	The iterates converge to the dominant eigenvector as $k to infty$, provided the dominant eigenvalue is strictly larger in magnitude than all other eigenvalues.
] <alg:power-iteration>

#remark(title: [No normalization needed for Markov matrices])[
	For a Markov matrix applied to a state vector, normalization is automatic: $M$ preserves the sum of entries, so if $vn(x)_0$ sums to 1, so does every $M^k vn(x)_0$. Power iteration therefore converges to the steady-state distribution $vn(x)^*$ without an explicit normalization step.
]

#remark(title: [Rate of convergence])[
	Write $vn(x)_0 = c_1 vn(x)^* + c_2 vn(v)_2 + dots.c + c_n vn(v)_n$ in the eigenbasis, where $|lambda_2| <= dots <= |lambda_n| < lambda_1 = 1$. Then
	$ M^k vn(x)_0 = c_1 vn(x)^* + c_2 lambda_2^k vn(v)_2 + dots.c $
	The error is dominated by $|lambda_2|^k$. Each step shrinks it by a factor of $|lambda_2|$, so convergence is fast when $|lambda_2|$ is small.
]

== Application: PageRank

#example(title: [PageRank])[
	Model a web surfer clicking links uniformly at random. For a network of $n$ pages, let $A$ be the adjacency matrix (column = source convention: $A_(i j) = 1$ iff page $j$ links to page $i$). Normalize each column by its sum to get transition probabilities: if page $j$ has $d_j$ outgoing links,
	$ M_(i j) = cases(1/d_j &"if" A_(i j) = 1, 0 &"otherwise.") $

	The steady state $vn(x)^*$ of this Markov matrix is the #defname[PageRank] vector: $x^*_i$ is the long-run fraction of time spent on page $i$, interpreted as its relative importance.
]

#definition(title: [Dangling node])[
	A #defname[dangling node] is a page with no outgoing links ($d_j = 0$). Its column in $A$ is all zeros, so normalization is undefined.

	*Fix:* replace the zero column with $1/n vn(1)$, treating the surfer as jumping to any page uniformly. This restores the column-sum-to-1 property.
]

#remark[
	Even after fixing dangling nodes, the resulting matrix may not have all strictly positive entries (some pages may simply not be mutually reachable), so @thm:markov-convergence does not directly apply. The full PageRank algorithm adds a *damping factor* $d in (0,1)$ (typically $d approx 0.85$):
	$ M_"PageRank" = d M + (1-d) 1/n vn(1) vn(1)^transpose. $
	The second term is a positive matrix (every entry $= (1-d)/n > 0$), so $M_"PageRank"$ has all positive entries, guaranteeing a unique steady state by @thm:markov-convergence. The surfer's behavior is: with probability $d$ follow a random link as before; with probability $1-d$ jump to any page uniformly ("teleportation"). The lab implemented the dangling-node fix but not the full damping term.
]

#procedure(title: [Computing PageRank in practice])[
	+ Build the adjacency matrix $A$ (column = source convention).
	+ Fix dangling nodes: replace zero columns of $A$ with $1/n vn(1)$.
	+ Normalize each column by its sum to produce $M$.
	+ (Optional) Apply damping: $M <- d M + (1-d)/n vn(1)vn(1)^transpose$.
	+ Apply power iteration (@alg:power-iteration) until convergence.
	+ Rank pages by their entry in the resulting steady state $vn(x)^*$.
]

= Appendix: Linear differential equations

#see[MATH 257 [#link("https://raw.githubusercontent.com/ethanc8/ekactl-references/trunk/linalg/math257/CompleteLectureNotes--Filled.pdf#Outline0.37")[Module 37], CL8, CHW8]]

#definition(title: [Linear differential equation])[
	A linear (first order) differential equation is an equation of the form
	$ (dif u)/(dif t) = A u $
	where $u$ is a function from $Reals$ to $Reals^n$. A further condition $u(0) = v$, for some $v$ in $Reals^n$ is called an initial condition.
]

#lemma[
	Let $A$ be an $n times n$ matrix and $vn(v) in Reals^n$. The solution of the differential equation $(dif vn(u))/(dif t) = A u$ with initial condition $vn(u)(0) = vn(v)$ is $vn(u)(t) = e^(A t) vn(v)$.
]

#lemma[
	Let $A$ be an $n times n$-matrix, and let $vn(v) in Reals^n$ be an eigenvector of $A$ with eigenvalue $lambda$. Then $e^(A t) vn(v) = e^(lambda t) vn(v)$.
]

#theorem(title: [Solution of LDE])[
	Let $A$ be an $n times n$-matrix and $(vn(v)_1, dots, vn(v)_n)$ be an eigenbasis of $A$ with eigenvalues $lambda_1, dots, lambda_n$. If $vn(v) = c_1 vn(v)_1 + dots.c + c_n vn(v)_n$, then the unique solution to the differential equation $(dif u)/(dif t) = A u$ with initial condition $u(0) = vn(v)$ is

	$ e^(A t) vn(v) = c_1 e^(lambda_1 t) vn(v)_1 + dots.c + c_n e^(lambda_n t) vn(v)_n. $
]

#procedure(title: [Solving an LDE])[
	Consider the LDE $vn(x)'(t) = A vn(x)(t)$ with initial condition $vn(x)(0) = $ some constant.

	1. *Eigenanalysis:* Find the eigenvectors $(vn(v)_1, dots, vn(v)_n)$  with eigenvalues $lambda_1, dots, lambda_n$.
	2. *Find coefficients:* Plug in the initial condition $vn(x)(0)$ to find $c_1, ..., c_n$:
	$ vn(x)(0) &= c_1 vn(v)_1 + dots.c + c_n vn(v)_n \
	&= mat(vn(v)_1, dots.c, vn(v)_n) mat(c_1; dots.v; c_n). $
	3. *Plug in coefficients:* Using the $c_n$ found above, 
	$ x(t) &= c_1 vn(v)_1 e^(lambda_1 t) + dots.c + c_n vn(v)_n e^(lambda_n t)
	&= mat(vn(v)_1, dots.c, vn(v)_n) mat(c_1 e^(lambda_1 t); dots.v; c_n e^(lambda_n t)). $
]

= Resources

Resources marked with a star (#sym.star.filled) are resources I have personally read and liked.

Resources marked with (\$) are to my knowledge not available for free on the Internet.

== Main resources

- #sym.star.filled *Axler* -- #link("https://linear.axler.net/LADR4e.pdf")[_Linear Algebra Done Right_, 4th edition, by Sheldon Axler]
	- #link("https://lew98.github.io/Mathematics/LADR_Solutions/LADR_Solutions.pdf")[Solution manual by GitHub user `@lew98`]
	- A very abstract book
- *Treil-LADW* -- _Linear Algebra Done Wrong_ (#link("https://www.math.brown.edu/streil/papers/LADW/LADW_2026_08-31.pdf")[PDF] | #link("https://www.math.brown.edu/streil/papers/LADW/HTML_2026_08-31/LADW_2026_08-31.html")[HTML])
- (\$) Paul Halmos, _Finite-Dimensional Vector Spaces_ (1958) -- exhaustive textbook
- (\$) Kenneth Hoffman and Ray Kunze, _Linear Algebra_ -- an algebraist's approach

=== Quick overviews of abstract linear algebra

- #sym.star.filled *Grabovsky* -- David Grabovsky, #link("https://web.physics.ucsb.edu/~davidgrabovsky/files-notes/Linear%20Algebra.pdf")[_Linear Algebra: A Field Guide_] -- builds up to spectral theory
- #sym.star.filled *Zwiebach* -- Barton Zwiebach, #link("https://ocw.mit.edu/courses/8-05-quantum-physics-ii-fall-2013/04b0570b349e84d74129eef504498472_MIT8_05F13_Chap_03.pdf")[_Linear Algebra: Vector Spaces and Operators_] -- a more physical intuition approach and summary of the topics in Axler, from #link("https://ocw.mit.edu/courses/8-05-quantum-physics-ii-fall-2013/pages/syllabus/")[MIT 8.05 Quantum Physics]

=== Other abstract resources

- #sym.star.filled *Axler-DwD* -- #link("https://www.axler.net/DwD.pdf")[_Down with Determinants!_], an introduction to eigentheory without using determinants, and a definition of determinants from eigentheory

== Mix of abstract and applied curricula

- #sym.star.filled *Trimm* -- notes from "TrimmAlg", the linear algebra class taught by Dr. Anderson Trimm in S25
	- *Karthik* -- a student's solutions to worksheets from TrimmAlg
	- This class follows Axler, but presents some things from Strang in an Axler-style presentation

== American-style matrix-focused curricula

These focus on matrices, and are often first courses designed for engineers.

- *UCDavis* -- #link("https://www.math.ucdavis.edu/~linear/")[open-access textbook _Linear Algebra_, by Cherney, Denton, Thomas, and Waldron]
- #sym.star.filled *TU Delft* -- #link("https://interactivetextbooks.tudelft.nl/linear-algebra/index.html")[open-access textbook for a first course for engineers]
- (\$) *MATH 257* -- notes from MATH 257 "Linear Algebra with Computational Applications", taught in F26
	- *Chaung* -- notes from the 09:00 lecture given by Jer-Chin Chuang in F26
	- This is a more numerical/applied class
	- This class mostly follows Strang and MIT 18.06, but also introduces worked examples in NumPy code
	- The notes are not very good

=== Gilbert Strang's main curriculum
- (\$) *Strang-LAIA* -- _Linear Algebra and Its Applications_
	- Strang's oldest textbook
- (\$) *Strang-ILA* -- _Introduction to Linear Algebra_
	- The book in Strang's course MIT 18.06
	- #link("https://web.archive.org/web/20160124195254if_/http://math.mit.edu/~gs/linearalgebra/")[Website of Fourth Edition (2009)]
	- #link("https://math.mit.edu/~gs/linearalgebra/ila5/indexila5.html")[Website of Fifth Edition (2016)]
	- #link("https://math.mit.edu/~gs/linearalgebra/ila6/indexila6.html")[Website of Sixth Edition (2023)]
		- It has useful links and some full chapters
- (\$) *Strang-LALD* -- _Linear Algebra and Learning from Data_
	- #link("https://math.mit.edu/~gs/learningfromdata/")[Website of First Edition (2019)]
- *MIT 18.06*
	- #link("https://web.mit.edu/18.06/www/")[Main website]
	- #link("https://ocw.mit.edu/courses/18-06-linear-algebra-spring-2010/")[OpenCourseWare (Spring 2010)]
	- #link("https://ocw.mit.edu/courses/18-06sc-linear-algebra-fall-2011/")[*MIT 18.06SC* (OpenCourseWare)]
		- Designed for self-study
		- Has lecture notes on OCW, unlike 18.06
		- Has problem-solving help videos
	- #link("https://ocw.mit.edu/courses/18-06-linear-algebra-spring-2010/4d876a9159e32543eb0d73b4d4382f4c_MIT18_06S10ZoomNotes.pdf")[_ZoomNotes for Linear Algebra_]
	- #link("https://ocw.mit.edu/courses/18-06-linear-algebra-spring-2010/pages/related-resources/")[18.06 Related Resources]
- *MIT 18.065* "Matrix Methods in Data Analysis, Signal Processing, and Machine Learning"
	- #link("https://ocw.mit.edu/courses/18-065-matrix-methods-in-data-analysis-signal-processing-and-machine-learning-spring-2018/")[MIT 18.065, Spring 2018]
	- #link("https://github.com/mitmath/18065")[MIT 18.065, Spring 2023]

=== Gilbert Strang's new curriculum ($C R$-factorization)
- (\$) *Strang-LAFE* -- _Linear Algebra for Everyone_
	- #link("https://math.mit.edu/~gs/everyone/")[Website of First Edition (2020)]
	- #sym.star.filled #link("https://raw.githubusercontent.com/kenjihiranabe/The-Art-of-Linear-Algebra/main/The-Art-of-Linear-Algebra.pdf")[_The Art of Linear Algebra_] by Kenji Hiranabe -- graphical representations of stuff from LAFE
- #link("https://ocw.mit.edu/courses/res-18-010-a-2020-vision-of-linear-algebra-spring-2020/")[_A Vision of Linear Algebra_ videos (2020\~2024)]

== Applied linear algebra

- (\$) *Klein* -- _Coding the Matrix: Linear Algebra through Applications to Computer Science_, by Philip N. Klein
	- #link("https://cs.brown.edu/video/channels/coding-matrix-fall-2014/")[Philip Klein's lecture videos]
	- #link("https://www.youtube.com/playlist?list=PLEhMEyM9jSinRHXJgRCOLZUiu9847V2g0")[Eng Weam's lecture videos]
	- #link("https://archive.org/details/academictorrents_54cd86f3038dfd446b037891406ba4e0b1200d5a")[Coursera videos]
- *Boyd* - #link("https://web.stanford.edu/~boyd/vmls/")[_Introduction to Applied Linear Algebra – Vectors, Matrices, and Least Squares_] by Stephen Boyd and Lieven Vandenberghe
- *MML* -- #link("https://mml-book.github.io/book/mml-book.pdf")[_Mathematics for Machine Learning_], Marc Peter Deisenroth, A. Aldo Faisal, and Cheng Soon Ong
	- #link("https://mml-book.github.io/")[Book website]

== Visual intuition

- #sym.star.filled *3Blue1Brown* -- video series on linear algebra; see "Videos" below
- #sym.star.filled *Hiranabe* -- #link("https://raw.githubusercontent.com/kenjihiranabe/The-Art-of-Linear-Algebra/main/The-Art-of-Linear-Algebra.pdf")[_The Art of Linear Algebra_] by Kenji Hiranabe
	- Strang's paper #link("https://doi.org/10.1080/10511970.2024.2321349")["The Art of Linear Algebra"]

== Other resources

- *Alayont & Schlicker* -- #link("https://scholarworks.gvsu.edu/books/21/")[Linear Algebra and Applications: An Inquiry-Based Approach]
	- Inquiry-based approach, i.e. investigation of examples

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
3. #link("https://www.youtube.com/watch?v=kYB8IZa5AuE&list=PLZHQObOWTQDPD3MizzM2xVFitgF8hE_ab&index=3")[Linear transformations and matrices]
	- Linear maps (@sec:linmap:linmap)
	- Matrix of a linear map (@sec:matsys:matmap)
	- Matrix-vector multiplication (@sec:matsys:matvec)
4. #link("https://www.youtube.com/watch?v=XkY2DOUCWMU&list=PLZHQObOWTQDPD3MizzM2xVFitgF8hE_ab&index=4")[Matrix multiplication as composition]
	- Matrix multiplication (@sec:matsys:matmul)
5. #link("https://www.youtube.com/watch?v=rHLEWRxRGiM&list=PLZHQObOWTQDPD3MizzM2xVFitgF8hE_ab&index=5")[Three-dimensional linear transformations]
6. #link("https://www.youtube.com/watch?v=Ip3X9LOh2dk&list=PLZHQObOWTQDPD3MizzM2xVFitgF8hE_ab&index=7")[The determinant]
	- TODO
7. #link("https://www.youtube.com/watch?v=uQhTuRlWMxw&list=PLZHQObOWTQDPD3MizzM2xVFitgF8hE_ab&index=7")[Inverse matrices, column space and null space]
	- Linear systems (@sec:matsys:linsys)
	- Invertible matrices (@sec:matmap:invmat)
	- Column and null space (@sec:matmap:funmatspaces)
8. #link("https://www.youtube.com/watch?v=v8VSDg_WQlA&list=PLZHQObOWTQDPD3MizzM2xVFitgF8hE_ab&index=8")[Nonsquare matrices as transformations between dimensions]
9. #link("https://www.youtube.com/watch?v=LyGKycYT2v0&list=PLZHQObOWTQDPD3MizzM2xVFitgF8hE_ab&index=9")[Dot products and duality]
	- Inner product (@sec:innerprod:innerprod)
	- TODO: geometric meaning of the dot product, relationship between row vector as transformation and vector as a vector
