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
