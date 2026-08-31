#import "@local/ethan-standard-style:0.1.0": *
#show: ekactl-style.with(
  section-number: 6,
  title: "Linear algebra (official MATH 257 notes)"
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

= Introduction to Linear Systems

#definition[
  A linear equation is a equation of the form
  $ a_1 x_1 + dots.c + a_n x_n = b $
  where $a_1, dots, a_n, b$ are numbers and $x_1, dots, x_n$ are variables.
]

#definition[
  A linear system is a collection of one or more linear equations involving the same set of variables, say, $x_1, x_2, dots, x_n$.

  A solution of a linear system is a list $(s_1, s_2, dots, s_n)$ of numbers that makes each equation in the system true when the values $s_1, s_2, dots, s_n$ are substituted for $x_1, x_2, dots, x_n$, respectively.
]

#theorem[
  A linear system has either one unique solution, no solution or infinitely many solutions.
]

#definition[
  The solution set of a linear system is the set of all solutions of the linear system. Two linear systems are equivalent if they have the same solution set.
]

= Matrices

#definition[
  An $m times n$ matrix is a rectangular array of numbers with $m$ rows and $n$ columns.
  $ A = mat(
    a_11, a_12, dots.h, a_(1n);
    a_21, a_22, dots.h, a_(2n);
    dots.v, dots.v, dots.down, dots.v;
    a_(m 1), a_(m 2), dots.h, a_(m n);
  ) $
  $a_(i j)$ is in the $i$th row and $j$th column of $A$
]

#definition[
  Given a linear system,
  $ a_11 x_1 + a_12 x_2 + dots.c + a_(1n) x_n = b_1 \
    a_21 x_1 + a_22 x_2 + dots.c + a_(2n) x_n = b_2 \
    dots.v \
    a_(m 1) x_1 + a_(m 2) x_2 + dots.c + a_(m n) x_n = b_m $
  we define its coefficient and augmented matrices to be
  $ mat(
    a_11, a_12, dots.h, a_(1n);
    a_21, a_22, dots.h, a_(2n);
    dots.v, dots.v, dots.down, dots.v;
    a_(m 1), a_(m 2), dots.h, a_(m n);
  ) quad "and" quad mat(
    augment: #4,
    a_11, a_12, dots.h, a_(1n), b_1;
    a_21, a_22, dots.h, a_(2n), b_2;
    dots.v, dots.v, dots.down, dots.v, dots.v;
    a_(m 1), a_(m 2), dots.h, a_(m n), b_m;
  ), $
  respectively
]

#definition[
  An elementary row operation is one of the following:
  - (Replacement) Add a multiple of one row to another row: $R_i to R_i + c R_j$, where $i != j$,
  - (Interchange) Interchange two rows: $R_i arrow.l.r R_j$,
  - (Scaling) Multiply all entries in a row by a nonzero constant: $R_i to c R_i$, where $c != 0$.
]

#remark[
  Every row operation is reversible.
]

#definition[
  Two matrices are said to be row equivalent, if one matrix can be transformed into the other matrix by a sequence of elementary row operations.
]

#theorem[
  If the augmented matrices of two linear systems are row equivalent, then the two systems have the same solution set.
]

= Echelon Forms of Matrices

#definition[
  A matrix is in echelon form (or row echelon form) if
  + all nonzero rows (rows with at least one nonzero element) are above any rows of all zeros, and
  + the leading entry (the first nonzero number from the left) of a nonzero row is always strictly to the right of the leading entry of the row above it.
]

#definition[
  A matrix is in row reduced echelon form (or: reduced echelon form, or RREF) if it is in echelon form and the following are satisfied:
  + the leading entry in each nonzero row is 1, and
  + each leading entry is the only nonzero entry in its column.
]

#theorem(title: [Uniqueness of RREF])[
  Each matrix is row-equivalent to one and only one matrix in reduced echelon form.
]

#definition[
  We say a matrix $B$ is the reduced echelon form (or: the RREF) of a matrix $A$ if $A$ and $B$ are row-equivalent and $B$ is in reduced echelon form.
]

#definition[
  A pivot position is the position of a leading entry in an echelon form of a matrix. A pivot column is a column that contains a pivot position.
]

#definition[
  A basic variable (or pivot variable) is a variable that corresponds to a pivot column in the coefficient matrix of a linear system. A free variable is a variable that is not a pivot variable.
]

= Gaussian Elimination

*Goal.* Solve linear systems for the pivot variables in terms of the free variables (if any) in the equation.

#algorithm(title: [Gaussian Elimination])[
  Given a linear system,
  + write down the augmented matrix,
  + find the reduced echelon form of the matrix,
  + write down the equations corresponding to the reduced echelon form, and
  + express pivot variables in terms of free variables.
]

#theorem[
  A linear system is consistent if and only if an echelon form of the augmented matrix has no row of the form $mat(0, dots.c, 0, b)$, where $b$ is nonzero. If a linear system is consistent, then the linear system has
  - a unique solution (when there are no free variables), or
  - infinitely many solutions (when there is at least one free variable).
]

= Linear Combinations

#definition[
  Consider $m times n$-matrices
  $ A = mat(
      a_11, a_12, dots.h, a_(1n);
      a_21, a_22, dots.h, a_(2n);
      dots.v, dots.v, dots.down, dots.v;
      a_(m 1), a_(m 2), dots.h, a_(m n);
    ), quad "and" quad B = mat(
      b_11, b_12, dots.h, b_(1n);
      b_21, b_22, dots.h, b_(2n);
      dots.v, dots.v, dots.down, dots.v;
      b_(m 1), b_(m 2), dots.h, b_(m n);
    ). $
  - We define their sum $A + B$ to be
    $ A + B := mat(
      a_11 + b_11, a_12 + b_12, dots.h, a_(1n) + b_(1n);
      a_21 + b_21, a_22 + b_22, dots.h, a_(2n) + b_(2n);
      dots.v, dots.v, dots.down, dots.v;
      a_(m 1) + b_(m 1), a_(m 2) + b_(m 2), dots.h, a_(m n) + b_(m n);
    ). $
  - If $c in Reals$ is a scalar, we define the scalar product $c A$ to be
    $ c A := mat(
      c a_11, c a_12, dots.h, c a_(1n);
      c a_21, c a_22, dots.h, c a_(2n);
      dots.v, dots.v, dots.down, dots.v;
      c a_(m 1), c a_(m 2), dots.h, c a_(m n);
    ). $
]

#remark[
  Addition is only defined if $A$ has the same number of columns and rows as $B$.
]

#definition[
  A column vector is an $m times 1$-matrix. A row vector is a $1 times n$-matrix.
]

#definition[
  If $A$ is $m times n$, the transpose of $A$ is the $n times m$ matrix, denoted by $A^T$, whose columns are formed from the corresponding rows of $A$. In terms of matrix elements: $(A^T)_(i j) = A_(j i)$.
]

#remark[
  The transpose of a column vector is a row vector and vice versa.
]

#definition[
  The linear combination of $m times n$-matrices $A_1, A_2, dots, A_p$ with coefficients $c_1, c_2, dots, c_p$ is defined as:
  $ c_1 A_1 + c_2 A_2 + dots.c + c_p A_p. $
]

#definition[
  Given $m times n$ matrices $A_1, dots, A_p$, we define their Span, $op("Span")(A_1, dots, A_p)$, to be the set of all linear combinations of $A_1, dots, A_p$. That is,
  $ op("Span")(A_1, dots, A_p) := { c_1 A_1 + c_2 A_2 + dots.c + c_p A_p : c_1, dots, c_p "scalars" }. $
]

#definition[
  We denote the set of all column vectors of length $m$ by $Reals^m$.
]

#remark[
  Solving linear systems is the same as finding linear combinations!
]

#theorem[
  Let $a_1, dots, a_n, b in Reals^m$. A vector equation
  $ x_1 a_1 + x_2 a_2 + dots.c + x_n a_n = b $
  has the same solution set as the linear system whose augmented matrix is
  $ mat(augment: #4, a_1, a_2, dots.h, a_n, b) $
  In particular, $b$ can be generated by a linear combination of $a_1, a_2, dots, a_n$ if and only if there is a solution to the linear system corresponding to the augmented matrix.
]

= Matrix-vector multiplication

#definition[
  Let $x$ be a vector in $Reals^n$ and $A = mat(a_1, dots.c, a_n)$ an $m times n$-matrix. We define the product $A x$ by
  $ A x = x_1 a_1 + x_2 a_2 + dots.c + x_n a_n. $
]

#remark[
  - $A x$ is a linear combination of the columns of $A$ using the entries in $x$ as coefficients.
  - $A x$ is only defined if the number of entries of $x$ is equal to the number of columns of $A$.
]

#theorem[
  Let $A = mat(a_1, dots.c, a_n)$ be an $m times n$-matrix and $b in Reals^m$. Then the following are equivalent:
  - $(x_1, x_2, dots, x_n)$ is a solution of the vector equation $x_1 a_1 + x_2 a_2 + dots.c + x_n a_n = b$
  - $vec(x_1, dots.v, x_n)$ is a solution to the matrix equation $A x = b$.
  - $(x_1, x_2, dots, x_n)$ is a solution of the system with augmented matrix $mat(augment: #1, A, b)$
]

#remark[
  We will write $A x = b$ for the system of equations with augmented matrix $mat(augment: #1, A, b)$.
]

= Matrix Multiplication

#definition[
  Let $A$ be an $m times n$-matrix and let $B = mat(b_1, dots.c, b_p)$ be an $n times p$-matrix. We define
  $ A B := mat(A b_1, A b_2, dots.h, A b_p) $
]

#theorem[
  Let $A$ be an $m times n$ matrix and $B$ be an $n times p$ matrix. Then for every $x in Reals^p$
  $ A(B x) = (A B) x. $
]

*Note.* Other ways to compute $A B$.

#remark(title: [Row-Column Rule])[
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

#remark(title: [Outer Product Rule])[
  Let $A$ be $m times n$ and $B$ be $n times p$ such that
  $ A = mat(C_1, dots.c, C_n), quad "and" quad B = mat(R_1; dots.v; R_n). $
  Then
  $ A B = C_1 R_1 + dots.c + C_n R_n $
]

= Properties of Matrix Multiplication

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
  + $A(B C) = (A B) C$ (associative law of multiplication)
  + $A(B + C) = A B + A C$, $(B + C) A = B A + C A$ (distributive laws)
  + $r(A B) = (r A) B = A(r B)$ for every scalar $r$,
  + $A(r B + s C) = r A B + s A C$ for every scalars $r, s$ (linearity of matrix multiplication)
  + $I_m A = A = A I_n$ (identity for matrix multiplication)
]

#remark[
  Properties above are analogous to properties of real numbers. But NOT ALL properties of real numbers also hold for matrices. In particular, $A B$ need not equal $B A$.
]

#theorem[
  The transpose of a product is the product of transposes in opposite order:
  $ (A B)^T = B^T A^T $
]

#definition[
  Let $A$ be a square matrix. We write $A^k$ for $A dots.c A$, $k$-times; that is $A^k$ is obtained by multiplying $A$ $k$-times with itself.
]

= Elementary Matrices

#definition[
  An elementary matrix is one that is obtained by performing a single elementary row operation on an identity matrix.

  A permutation matrix is one that is obtained by performing row exchanges on an identity matrix.
]

#theorem[
  If an elementary row operation is performed on an $m times n$-matrix $A$, the resulting matrix can be written as $E A$, where the $m times m$-matrix $E$ is created by performing the same row operation on $I_m$.
]

#theorem[
  Let $A, B$ be two $m times n$-matrices and row-equivalent. Then there is a sequence of $m times m$-elementary matrices $E_1, dots, E_ell$ such that
  $ E_ell dots.c E_1 A = B. $
]

= Inverse of a Matrix

#remark[
  The inverse of a real number $a$ is denoted by $a^(-1)$. For example, $7^(-1) = 1\/7$ and $7 dot 7^(-1) = 7^(-1) dot 7 = 1$. Note that not all real numbers have an inverse. Namely, $0^(-1)$ is not defined as there is no real number $b$ such that $0 dot b = 1$.
]

#definition[
  An $n times n$ matrix $A$ is said to be invertible if there is an $n times n$ matrix $C$ satisfying
  $ C A = A C = I_n $
  where $I_n$ is the $n times n$ identity matrix. We call $C$ the inverse of $A$.
]

#theorem[
  Let $A$ be an invertible matrix, then its inverse $C$ is unique.
]

#theorem[
  Suppose $A$ and $B$ are invertible. Then:
  + $A^(-1)$ is invertible and $(A^(-1))^(-1) = A$ (i.e. $A$ is the inverse of $A^(-1)$).
  + $A B$ is invertible and $(A B)^(-1) = B^(-1) A^(-1)$.
  + $A^T$ is invertible and $(A^T)^(-1) = (A^(-1))^T$.
]

#theorem[
  Let $A$ be an invertible $n times n$ matrix. Then for each $b$ in $Reals^n$, the equation $A x = b$ has the unique solution $x = A^(-1) b$.
]

= Computing the Inverse

#theorem[
  Let $A = mat(a, b; c, d)$. If $a d - b c != 0$, then $A$ is invertible and
  $ A^(-1) = 1/(a d - b c) mat(d, -b; -c, a). $
  If $a d - b c = 0$, then $A$ is not invertible.
]

#theorem[
  Let $A$ be an $n times n$-matrix. The following are equivalent:
  - $A$ is invertible.
  - the reduced echelon form of $A$ is $I_n$.
]

#theorem[
  Suppose $A$ is invertible. Then every sequence of elementary row operations that reduces $A$ to $I_n$ will also transform $I_n$ to $A^(-1)$.
]

#algorithm[
  - Place $A$ and $I$ side-by-side to form an augmented matrix $mat(augment: #1, A, I)$. This is an $n times 2n$ matrix (Big Augmented Matrix), instead of $n times (n+1)$.
  - Perform row operations on this matrix (which will produce identical operations on $A$ and $I$).
  - By Theorem: $mat(augment: #1, A, I)$ will row reduce to $mat(augment: #1, I, A^(-1))$ or $A$ is not invertible.
]

= LU Decomposition

#definition[
  An $n times n$ matrix $A$ is called
  - upper triangular if it is of the form
    $ mat(
      star, star, star, star, star;
      0, star, star, star, star;
      0, 0, star, star, star;
      0, 0, 0, dots.down, dots.v;
      0, 0, 0, 0, star;
    ), $
  - lower triangular if it is of the form
    $ mat(
      star, 0, 0, 0, 0;
      star, star, 0, 0, 0;
      star, star, star, 0, 0;
      star, star, star, dots.down, dots.v;
      star, star, star, star, star;
    ). $
]

#theorem[
  The product of two lower (upper) triangular matrices is lower (upper) triangular.
]

#remark[
  The inverse of a lower (upper) triangular matrix (if it exists) is again lower (upper) triangular.
]

#definition[
  A matrix $A$ has an LU decomposition if there is a lower triangular matrix $L$ and an upper triangular matrix $U$ such that $A = L U$.
]

#theorem[
  Let $A$ be an $n times n$-matrix. If $A$ can be brought to echelon form just using row operations of the form $R_i to R_i + c R_j$ where $j < i$, then $A$ has an LU-decomposition.
]

#remark[
  Not every matrix has an LU decomposition. The LU decomposition of a matrix is not unique.
]

= Solving Linear Systems using LU Decomposition

#theorem[
  Let $A$ be an $n times n$-matrix such that $A = L U$, where $L$ is a lower triangular matrix and $U$ is an upper triangular matrix, and let $b in Reals^n$. In order to find a solution of the linear system
  $ A x = b, $
  it is enough to find a solution of the linear system
  $ U x = c, $
  where $c$ satisfies $L c = b$.
]

#theorem[
  Let $A$ be an $n times n$ matrix. Then there is a permutation matrix $P$ such that $P A$ has an LU-decomposition.
]

== Spring-Mass Systems

See the notes for information about this application.

= Inner Product and Orthogonality

#definition[
  The inner product of $v, w in Reals^n$ is
  $ v dot w = v^T w. $
]

#theorem[
  Let $u, v$ and $w$ be vectors in $Reals^n$, and let $c$ be any scalar. Then
  + $u dot v = v dot u$
  + $(u + v) dot w = u dot w + v dot w$
  + $(c u) dot v = c(u dot v) = u dot (c v)$
  + $u dot u >= 0$, and $u dot u = 0$ if and only if $u = 0$.
]

#definition[
  Let $v, w in Reals^n$.
  - The norm (or length) of $v$ is
    $ norm(v) = sqrt(v dot v) = sqrt(v_1^2 + dots.c + v_n^2). $
  - The distance between $v$ and $w$ is
    $ op("dist")(v, w) = norm(v - w). $
]

#definition[
  Let $v, w in Reals^n$. We say $v$ and $w$ are orthogonal if $v dot w = 0$.
]

#theorem[
  Let $v, w in Reals^n$ be non-zero. Then $v$ and $w$ are orthogonal if and only if they are perpendicular (i.e. if they form a right angle).
]

#definition[
  A set of vectors in $Reals^n$ is pairwise orthogonal if each pairing of them is orthogonal. We call such a set an orthogonal set.
]

#definition[
  A unit vector in $Reals^n$ is a vector of length 1.
]

#definition[
  A set of vectors forms an orthonormal set if this set is an orthogonal set and all vectors in the set are unit vectors.
]

= Subspaces

#definition[
  A non-empty subset $H$ of $Reals^n$ is a subspace of $Reals^n$ if it satisfies the following two conditions:
  - if $u, v in H$, then the sum $u + v in H$. ($H$ is closed under vector addition), and
  - if $u in H$ and $c$ is a scalar, then $c u in H$. ($H$ is closed under scalar multiplication.)
]

#theorem[
  Let $v_1, v_2, dots, v_m in Reals^n$. Then $op("Span")(v_1, v_2, dots, v_m)$ is a subspace of $Reals^n$.
]

= Column Spaces and Null Spaces

#definition[
  The column space, written as $op("Col")(A)$, of an $m times n$ matrix $A$ is the set of all linear combinations of the columns of $A$. If $A = mat(a_1, a_2, dots.h, a_n)$, then $op("Col")(A) = op("Span")(a_1, a_2, dots, a_n)$.
]

#theorem[
  Let $A$ be an $m times n$ matrix. Then $op("Col")(A)$ is a subspace of $Reals^m$.
]

#theorem[
  Let $A$ be an $m times n$ matrix and $b in Reals^m$. Then $b$ is in $op("Col")(A)$ if and only if the linear system $A x = b$ has a solution.
]

#definition[
  The nullspace of an $m times n$ matrix $A$, written as $op("Nul")(A)$, is the set of all solutions to the homogeneous equation $A x = 0$; that is, $op("Nul")(A) = {v in Reals^n : A v = 0}$.
]

#theorem[
  The nullspace of an $m times n$ matrix $A$ is a subspace of $Reals^n$.
]

#theorem[
  Let $A$ be an $m times n$ matrix, let $b in Reals^m$, and let $w in Reals^n$ such that $A w = b$. Then ${v in Reals^n : A v = b} = w + op("Nul")(A)$.
]

= Abstract Vector Spaces

#definition[
  A vector space is a non-empty set $V$ of objects, called vectors, for which linear combinations make sense. More precisely, there are two operations on $V$, called addition and multiplication by scalars (real numbers), satisfying the following axioms for all $u, v, w in V$ and for all scalars $c, d in Reals$:
  - $u + v$ is in $V$. ($V$ is "closed under addition".)
  - $u + v = v + u$.
  - $(u + v) + w = u + (v + w)$.
  - There is a vector (called the zero vector) $0_V$ in $V$ such that $u + 0_V = u$.
  - For each $u$ in $V$, there is a vector $-u$ in $V$ satisfying $u + (-u) = 0_V$.
  - $c u$ is in $V$. ($V$ is "closed under scalar multiplication".)
  - $c(u + v) = c u + c v$.
  - $(c + d) u = c u + d u$.
  - $(c d) u = c(d u)$.
  - $1 u = u$.
]

#definition[
  Let $V$ be a vector space. A non-empty subset $W subset.eq V$ is a subspace of $V$ if
  - $u + v$ for all $u, v in U$ (closed under addition)
  - $c u$ for all $u in U$ and $c in Reals$ (closed under scalar multiplication)
]

= Linear Independence

#definition[
  Vectors $v_1, dots, v_p$ are said to be linearly independent if the equation
  $ x_1 v_1 + x_2 v_2 + dots.c + x_p v_p = 0 $
  has only the trivial solution (namely, $x_1 = x_2 = dots.c = x_p = 0$). We say the vectors are linearly dependent if they are not linearly independent.
]

#theorem[
  Vectors $v_1, dots, v_p$ are linearly dependent if and only if there is $i in {1, dots, p}$ such that $v_i in op("Span")(v_1, dots, v_(i-1), v_(i+1), dots, v_p)$.
]

#theorem[
  Let $A$ be an $m times n$ matrix. The following are equivalent:
  - The columns of $A$ are linearly independent.
  - $A x = 0$ has only the solution $x = 0$.
  - $A$ has $n$ pivots.
  - there are no free variables for $A x = 0$.
]

= Bases and Dimension

#definition[
  Let $V$ be a vector space. A sequence of vectors $(v_1, dots, v_p)$ in $V$ is a basis of $V$ if
  - $V = op("Span")(v_1, dots, v_p)$, and
  - $(v_1, dots, v_p)$ are linearly independent.
]

#theorem[
  Every two bases in a vector space $V$ contain the same number of vectors.
]

#definition[
  The number of vectors in a basis of $V$ is the dimension of $V$.
]

#theorem[
  Suppose that $V$ has dimension $d$. Then
  - A sequence of $d$ vectors in $V$ is a basis if they span $V$.
  - A sequence of $d$ vectors in $V$ is a basis if they are linearly independent.
]

#theorem[
  A basis is a minimal spanning set of $V$; that is the elements of the basis span $V$ but you cannot delete any of these elements and still get all of $V$.
]

= The Four Fundamental Subspaces

#algorithm[
  To find a basis for $op("Nul")(A)$:
  - Find the parametric form of the solutions to $A x = 0$.
  - Express solutions $x$ as a linear combination of vectors with the free variables as coefficients.
  - Use these vectors as a basis of $op("Nul")(A)$.
]

#definition[
  The rank of a matrix is the number of pivots it has.
]

#theorem[
  Let $A$ be an $m times n$ matrix with rank $r$. Then $dim op("Nul")(A) = n - r$.
]

#theorem[
  Let $A$ be an $m times n$ matrix with rank $r$. The pivot columns of $A$ form a basis of $op("Col")(A)$. In particular, $dim op("Col")(A) = r$.
]

#theorem[
  Let $A, B$ be two row-equivalent matrices. Then $op("Col")(A^T) = op("Col")(B^T)$.
]

#theorem[
  Let $A$ be an $m times n$ matrix with rank $r$. Then the non-zero rows in an echelon form of $A$ form a basis of $op("Col")(A^T)$, and thus $dim(A^T) = r$.
]

#theorem[
  Let $A$ be an $m times n$ matrix with rank $r$. Then
  - $dim op("Col")(A) = dim op("Col")(A^T) = r$, and
  - $dim op("Nul")(A) = n - r$.
]

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

= Orthogonal Complements

#definition[
  Let $W$ be a subspace of $Reals^n$. The orthogonal complement of $W$ is the subspace $W^perp$ of all vectors that are orthogonal to $W$; that is
  $ W^perp := { v in Reals^n : v dot w = 0 "for all" w in W }. $
]

#remark[
  Observe that $(W^perp)^perp = W$.
]

#theorem[
  Let $A$ be an $m times n$ matrix. Then $op("Nul")(A)$ is the orthogonal complement of $op("Col")(A^T)$; that is $op("Nul")(A) = op("Col")(A^T)^perp$.
]

#remark[
  It follows that
  - $op("Nul")(A)^perp = op("Col")(A^T)$.
  - $op("Nul")(A^T) = op("Col")(A)^perp$.
]

#theorem[
  Let $V$ be a subspace of $Reals^n$. Then $dim V + dim V^perp = n$.
]

= Coordinates

#theorem[
  Let $(v_1, dots, v_p)$ be a basis of $V$. Then every vector $w$ in $V$ can be expressed uniquely as
  $ w = c_1 v_1 + dots.c + c_p v_p. $
]

#definition[
  Let $B = (v_1, v_2, dots, v_p)$ be an (ordered) basis of $V$, and let $w in V$. The coordinate vector $w_B$ of $w$ with respect to the basis $B$ is
  $ w_B = vec(c_1, c_2, c_3, dots.v, c_p), quad "if" w = c_1 v_1 + c_2 v_2 + dots.c + c_p v_p. $
]

#definition[
  In $Reals^n$ let $e_i$ denote the vector with a 1 in the $i$-th coordinate and 0's elsewhere. The standard basis of $Reals^n$ is the ordered basis $E_n := (e_1, dots, e_n)$.
]

#definition[
  Let $B$ and $C$ be two bases of $Reals^n$. The change of basis matrix $I_(C,B)$ is the matrix such that for all $v in Reals^n$
  $ I_(C,B) v_B = v_C $
]

#theorem[
  Let $B = (b_1, dots, b_n)$ be a basis of $Reals^n$. Then
  $ I_(E_n, B) = mat(b_1, dots.c, b_n) $
  That is, for all $v in Reals^n$,
  $ v = mat(b_1, dots.c, b_n) v_B. $
]

#remark[
  Let $B$ and $C$ be bases in $Reals^n$.
  - To compute $I_(B, E_n)$, notice that
    $ v = I_(E_n, B) v_B arrow.squiggly I_(E_n,B)^(-1) v = v_B arrow.squiggly I_(B, E_n) = I_(E_n,B)^(-1) $
  - To compute $I_(B,C)$, we can either use
    $ I_(B,E_n) I_(E_n,C) v_C = I_(B,E_n) v = v_B arrow.squiggly I_(B,C) = I_(B,E_n) I_(E_n,C) $
    or use
    $ I_(C,B) = mat((b_1)_C, dots.c, (b_n)_C) $
]

= Orthogonal and Orthonormal Bases

#theorem[
  Let $v_1, dots, v_m in Reals^n$ be non-zero and pairwise orthogonal. Then $v_1, dots, v_m$ are linearly independent.
]

#remark[
  The theorem implies that a set of $n$ orthonormal vectors in $Reals^n$ is a basis of $Reals^n$.
]

#definition[
  An orthogonal basis (an orthonormal basis) is an orthogonal set of vectors (an orthonormal set of vectors) that forms a basis.
]

#remark[
  When $B$ is orthonormal, then $b_i dot b_i = 1$ for $i = 1, dots, n$.
]

#theorem[
  Let $B := (b_1, b_2, dots, b_n)$ be an orthogonal basis of $Reals^n$, and let $v in Reals^n$. Then
  $ v = (v dot b_1)/(b_1 dot b_1) b_1 + dots.c + (v dot b_n)/(b_n dot b_n) b_n. $
]

#theorem[
  Let $U = (u_1, dots, u_n)$ be an orthonormal basis of $Reals^n$. Then
  $ I_(U, E_n) = mat(u_1, dots.c, u_n)^T. $
]

#definition[
  An $n times n$-matrix $Q$ is orthogonal if $Q^(-1) = Q^T$.
]

= Linear Transformations

#definition[
  Let $V$ and $W$ be vector spaces. A map $T : V to W$ is a linear transformation if
  $ T(a v + b w) = a T(v) + b T(w) $
  for all $v, w in V$ and all $a, b in Reals$.
]

#remark[
  $T(0_V) = T(0 dot 0_V) = 0 dot T(0_V) = 0_W arrow.squiggly T(0_V) = 0_W$
]

#theorem[
  Let $V, W$ be two vector spaces, let $T : V to W$ be a linear transformation and let $(v_1, dots, v_n)$ be a basis of $V$. Then $T$ is completely determined by the values $T(v_1), dots, T(v_n)$.
]

#theorem[
  Let $T : Reals^n to Reals^m$ be a linear transformation. Then there is an $m times n$ matrix $A$ such that
  - $T(v) = A v$, for all $v in Reals^n$.
  - $A = mat(T(e_1), T(e_2), dots.h, T(e_n))$, where $(e_1, e_2, dots, e_n)$ is the standard basis of $Reals^n$.
]

#remark[
  We call this $A$ the coordinate matrix of $T$ with respect to the standard bases -- we write $T_(E_m, E_n)$.
]

= Coordinate Matrices of Linear Transformations

#theorem[
  Let $V, W$ be two vector spaces, let $B = (b_1, dots, b_n)$ be a basis of $V$ and $C = (c_1, dots, c_m)$ be a basis of $W$, and let $T : V to W$ be a linear transformation. Then there is an $m times n$ matrix $T_(C,B)$ such that
  - $T(v)_C = T_(C,B) v_B$, for all $v in V$.
  - $T_(C,B) = mat(T(b_1)_C, T(b_2)_C, dots.h, T(b_n)_C)$.
]

#theorem[
  Let $T : Reals^m to Reals^n$ be a linear transformation and $A$ and $B$ be two bases of $Reals^m$ and $C, D$ be two bases of $Reals^n$. Then
  $ T_(C,A) = I_(C,D) T_(D,B) I_(B,A). $
]

= Determinants

*Goal.* Define a determinant function that takes an $n times n$ matrix $A$ to a real number $det(A)$, such that $det(A) != 0$ if and only if $A$ is invertible. We start with small matrices:

#definition[
  The determinant of
  - a $1 times 1$ matrix is $det([a]) = a$.
  - a $2 times 2$ matrix is $det mat(a,b;c,d) = a d - b c$.
]

#remark[
  We will write both $det mat(a,b;c,d)$ and $mat(delim: "|", a,b;c,d)$ for the determinant.
]

#definition[
  The determinant is the function that assigns to each $n times n$-matrix a number and satisfies the following conditions:
  - (Normalization) $det I_n = 1$,
  - It is affected by elementary row operations as follows:
    - (Replacement) Adding a multiple of one row to another row does not change the determinant.
    - (Interchange) Interchanging two different rows reverses the sign of the determinant.
    - (Scaling) Multiplying all entries in a row by $s$, multiplies the determinant by $s$.
]

#theorem[
  The determinant of a triangular matrix is the product of the diagonal entries.
]

#theorem[
  Let $A$ be an $n times n$-matrix, then $det(A) = 0$ if and only if $A$ is not invertible.
]

#theorem[
  Let $A, B$ be two $n times n$-matrices. Then $det(A B) = det(A) det(B)$.
]

#theorem[
  Let $A$ be an $n times n$-matrix. Then $det(A^T) = det(A)$.
]

= Cofactor expansion

#remark[
  Let $A$ be an $n times n$-matrix. We denote by $A_(i j)$ the matrix obtained from matrix $A$ by deleting the $i$-th row and $j$-th column of $A$.
]

#definition[
  Let $A$ be an $n times n$-matrix. The $(i,j)$-cofactor of $A$ is the scalar $C_(i j)$ defined by
  $ C_(i j) = (-1)^(i+j) det A_(i j). $
]

#theorem[
  Let $A$ be an $n times n$-matrix. Then for every $i, j in {1, dots, n}$
  $ det A = a_(i 1) C_(i 1) + a_(i 2) C_(i 2) + dots.c + a_(i n) C_(i n) quad "(expansion across row" i ")" \
    = a_(1 j) C_(1 j) + a_(2 j) C_(2 j) + dots.c + a_(n j) C_(n j) quad "(expansion down column" j ")" $
]

= Eigenvectors

#definition[
  Let $A$ be an $n times n$ matrix. An eigenvector of $A$ is a nonzero $v in Reals^n$ such that $A v = lambda v$, where $lambda$ is a scalar, known as the eigenvalue associated with $v$.
]

#definition[
  Let $lambda$ be an eigenvalue of $A$. The eigenspace of $A$ associated with $lambda$ is the set
  $ op("Eig")_lambda (A) := {v : A v = lambda v}. $
  It consists of all the eigenvectors of $A$ with eigenvalue $lambda$ and the zero vector.
]

= Computing Eigenvalues and Eigenvectors

#theorem[
  Let $A$ be an $n times n$ matrix and $lambda$ be a scalar. Then $lambda$ is an eigenvalue of $A$ if and only if $det(A - lambda I) = 0$.
]

#theorem[
  Let $A$ be an $n times n$ matrix. Then $p_A (t) := det(A - t I)$ is a polynomial of degree $n$. Thus $A$ has at most $n$ eigenvalues.
]

#definition[
  We call $p_A (t)$ the characteristic polynomial of $A$.
]

#theorem[
  Let $A$ be an $n times n$ matrix and let $lambda$ be an eigenvalue of $A$. Then
  $ op("Eig")_lambda (A) = op("Nul")(A - lambda I). $
]

= Properties of Eigenvectors and Eigenvalues

#definition[
  Let $A$ be an $n times n$ matrix and let $lambda$ be an eigenvalue of $A$.
  - The algebraic multiplicity of $lambda$ is its multiplicity as a root of the characteristic polynomial, that is, the largest integer $k$ such that $(t - lambda)^k$ divides $p_A (t)$.
  - The geometric multiplicity of $lambda$ is the dimension of the eigenspace $op("Eig")_lambda (A)$ of $lambda$.
]

#theorem[
  Let $A$ be an $n times n$ matrix and let $v_1, dots, v_m$ be eigenvectors of $A$ corresponding to different eigenvalues. Then $v_1, dots, v_m$ are linearly independent.
]

#definition[
  Let
  $ A = mat(
    a_11, a_12, dots.h, a_(1n);
    a_21, a_22, dots.h, a_(2n);
    dots.v, dots.v, dots.down, dots.v;
    a_(n 1), a_(n 2), dots.h, a_(n n);
  ) $
  The trace of $A$ is the sum of the diagonal entries of $A$; that is
  $ tr(A) = a_11 + a_22 + dots.c + a_(n n). $
]

#theorem[
  Let $A$ be an $n times n$ matrix with eigenvalues $lambda_1, dots, lambda_n$. Then
  - $tr(A) = lambda_1 + lambda_2 + dots.c + lambda_n$.
  - $det(A) = lambda_1 dot lambda_2 dot.c dots.c dot lambda_n$.
]

#theorem[
  Let $A$ be a $2 times 2$-matrix. Then the characteristic polynomial of $A$ is
  $ p(lambda) = lambda^2 - tr(A) lambda + det(A). $
]

= Markov matrices

#definition[
  An $n times n$ matrix $A$ is a Markov matrix (or: stochastic matrix) if it has only non-negative entries, and the entries in each column add up to 1.

  A vector in $Reals^n$ is a probability vector (or: stochastic vector) if it has only non-negative entries, and the entries add up to 1.
]

#theorem[
  Let $A$ be a Markov matrix. Then
  - 1 is an eigenvalue of $A$ and every other eigenvalue $lambda$ of $A$ satisfies $|lambda| <= 1$.
  - If $A$ has only positive entries, then any other eigenvalue satisfies $|lambda| < 1$.
]

#definition[
  A stationary probability vector of a Markov matrix is a probability vector $v$ that is an eigenvector of $A$ corresponding to the eigenvalue 1.
]

#theorem[
  Let $A$ be an $n times n$-Markov matrix with only positive entries and let $z in Reals^n$ be a probability vector. Then
  $ z_infty := lim_(k to infty) A^k z "exists," $
  and $z_infty$ is a stationary probability vector of $A$ (i.e. $A z_infty = z_infty$).
]

= Diagonalization

#definition[
  A square matrix $A$ is said to be diagonalizable if there is an invertible matrix $P$ and a diagonal matrix $D$ such that $A = P D P^(-1)$.
]

#theorem[
  Let $A$ be an $n times n$ matrix that has $n$ linearly independent eigenvectors $v_1, v_2, dots, v_n$ with associated eigenvalues $lambda_1, dots, lambda_n$. Then $A$ is diagonalizable as $P D P^(-1)$, where
  $ P = mat(v_1, dots.c, v_n) quad "and" quad D = mat(
    lambda_1, 0, dots.h, 0;
    0, lambda_2, dots.h, 0;
    dots.v, dots.v, dots.down, dots.v;
    0, 0, dots.h, lambda_n;
  ) $
]

#definition[
  Vectors $v_1, dots, v_n$ form an eigenbasis of an $n times n$ matrix $A$ if $v_1, dots, v_n$ form a basis of $Reals^n$ and $v_1, dots, v_n$ are all eigenvectors of $A$.
]

#theorem[
  The following are equivalent for an $n times n$ matrix $A$:
  - $A$ has an eigenbasis.
  - $A$ is diagonalizable.
  - The geometric multiplicities of all eigenvalues of $A$ sum up to $n$.
]

#theorem[
  Let $A$ be an $n times n$ matrix and let $B = (v_1, dots, v_n)$ be an eigenbasis of $A$. Then there is a diagonal matrix $D$ such that
  $ A = I_(E_n, B) D I_(B, E_n). $
]

= Powers of Matrices

*Key idea.* If a matrix $A$ has an eigenbasis, then it is easy to compute $A^k$, even for large $k$.

#theorem[
  If $A = P D P^(-1)$, where $D$ is a diagonal matrix, then for any $m$,
  $ A^m = P D^m P^(-1). $
]

= Matrix Exponential

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

== Linear Differential Equations

#definition[
  A linear (first order) differential equation is an equation of the form
  $ (d u)/(d t) = A u $
  where $u$ is a function from $Reals$ to $Reals^n$. A further condition $u(0) = v$, for some $v$ in $Reals^n$ is called an initial condition.
]

#theorem[
  Let $A$ be an $n times n$ matrix and $v in Reals^n$. The solution of the differential equation $(d u)/(d t) = A u$ with initial condition $u(0) = v$ is $u(t) = e^(A t) v$.
]

#theorem[
  Let $A$ be an $n times n$-matrix, and let $v in Reals^n$ be an eigenvector of $A$ with eigenvalue $lambda$, then $e^(A t) v = e^(lambda t) v$.
]

#theorem[
  Let $A$ be an $n times n$-matrix and $(v_1, dots, v_n)$ be an eigenbasis of $A$ with eigenvalues $lambda_1, dots, lambda_n$. If $v = c_1 v_1 + dots.c + c_n v_n$, then the unique solution to the differential equation $(d u)/(d t) = A u$ with initial condition $u(0) = v$ is
  $ e^(A t) v = c_1 e^(lambda_1 t) v_1 + dots.c + c_n e^(lambda_n t) v_n. $
]

= Orthogonal Projections Onto a Line

#definition[
  Let $v, w in Reals^n$. The orthogonal projection of $v$ onto the line spanned by $w$ is
  $ op("proj")_w v := (w dot v)/(w dot w) w. $
]

#theorem[
  Let $v, w in Reals^n$. Then $op("proj")_w v$ is the point in $op("Span")(w)$ closest to $v$; that is
  $ op("dist")(v, op("proj")_w v) = min_(u in op("Span")(w)) op("dist")(v, u). $
]

#remark[
  Note that $v - op("proj")_w v$ (called the error term) is in $op("Span")(w)^perp$.
  $ v = underbrace(op("proj")_w v, in op("Span")(w)) + underbrace(v - op("proj")_w v, in op("Span")(w)^perp) $
]

#theorem[
  Let $w in Reals^n$, then for all $v in Reals^n$
  $ op("proj")_w v = (1/(w dot w) w w^T) v. $
]

#remark[
  Note that $(1/(w dot w) w w^T)$ is an $n times n$ matrix; we call it the orthogonal projection matrix onto $op("Span")(w)$.
]

= Orthogonal Projection Onto a Subspace

#theorem[
  Let $W$ be a subspace of $Reals^n$ and $v in Reals^n$. Then $v$ can be written uniquely as
  $ v = underbrace(hat(v), "in" W) + underbrace(v^perp, "in" W^perp) $
]

#definition[
  We say $hat(v)$ is the orthogonal projection of $v$ onto $W$ -- written $op("proj")_W v$.
]

#remark[
  If $(w_1, dots, w_m)$ is an orthogonal basis of $W$, then
  $ op("proj")_W v = ((v dot w_1)/(w_1 dot w_1)) w_1 + dots.c + ((v dot w_m)/(w_m dot w_m)) w_m. $
]

#theorem[
  The projection map $op("proj")_W : Reals^n to Reals^n$ that sends $v$ to $op("proj")_W v$ is linear.
]

#definition[
  Let matrix $P_W$ be the matrix $(op("proj")_W)_(E_n, E_n)$ that represents $op("proj")_W$ with respect to the standard basis; we call $P_W$ the orthogonal projection matrix onto $W$.
]

= Least Squares Solutions

*Goal.* Suppose $A x = b$ is inconsistent. Can we still find something like a best solution?

#definition[
  Let $A$ be an $m times n$ matrix and $b in Reals^m$. A least squares solution (short: LSQ solution) of the system $A x = b$ is a vector $hat(x) in Reals^n$ such that
  $ op("dist")(A hat(x), b) = min_(x in Reals^n) op("dist")(A x, b). $
]

#theorem[
  Let $A$ be an $m times n$ matrix and $b in Reals^m$. Then $hat(x)$ is an LSQ solution to $A x = b$ if and only if $A hat(x) = op("proj")_(op("Col")(A)) b$.
]

#theorem[
  Let $A$ be an $m times n$ matrix and $b in Reals^m$. Then $hat(x)$ is an LSQ solution to $A x = b$ if and only if $A^T A hat(x) = A^T b$.
]

#theorem[
  Let $A$ be an $m times n$ matrix with linearly independent columns and $b in Reals^m$. Then
  $ op("proj")_(op("Col")(A)) b = A(A^T A)^(-1) A^T b. $
]

= Linear Regression

There are no definitions or theorems in this module, see the lecture notes for examples.

= Gram-Schmidt Method

#theorem[
  Every subspace of $Reals^n$ has an orthonormal basis.
]

#algorithm(title: [Gram-Schmidt orthonormalization])[
  Given a basis $a_1, dots, a_m$, we produce an orthogonal basis $b_1, dots, b_m$ and an orthonormal basis $q_1, dots, q_m$.
  $ b_1 = a_1, quad q_1 = b_1/norm(b_1) $
  $ b_2 = a_2 - underbrace(op("proj")_(op("Span")(q_1)) a_2, = (a_2 dot q_1) q_1), quad q_2 = b_2/norm(b_2) $
  $ b_3 = a_3 - underbrace(op("proj")_(op("Span")(q_1, q_2)) a_3, (a_3 dot q_1) q_1 + (a_3 dot q_2) q_2) quad q_3 = b_3/norm(b_3) $
  $ dots.c $
]

#remark[
  Notice that:
  - $op("Span")(q_1, dots, q_i) = op("Span")(a_1, dots, a_i)$ for $i = 1, dots, m$, and
  - $q_j in.not op("Span")(a_1, dots, a_i)$ for all $j > i$.
]

#theorem(title: [QR decomposition])[
  Let $A$ be an $m times n$ matrix of rank $n$. There is an $m times n$-matrix $Q$ with orthonormal columns and an upper triangular $n times n$ invertible matrix $R$ such that $A = Q R$.
]

= The Spectral Theorem

#theorem[
  Let $A$ be a symmetric $n times n$ matrix, then $A$ has an orthonormal basis of eigenvectors.
]

#theorem[
  Let $A$ be a symmetric $n times n$ matrix. Then there is a diagonal matrix $D$ and a matrix $Q$ with orthonormal columns such that $A = Q D Q^T$.
]

= Singular Value Decomposition

#definition[
  Let $A$ be an $m times n$ matrix. A singular value decomposition of $A$ is a decomposition $A = U Sigma V^T$ where
  - $U$ is an $m times m$ matrix with orthonormal columns,
  - $Sigma$ is an $m times n$ rectangular diagonal matrix with non-negative numbers on the diagonal,
  - $V$ is an $n times n$ matrix with orthonormal columns.
]

#remark[
  The diagonal entries $sigma_i = Sigma_(i i)$ which are positive are called the singular values of $A$. We usually arrange them in decreasing order, that is
  $ sigma_1 >= sigma_2 >= dots.c $
]

#remark[
  Let $A$ be an $m times n$ matrix with rank $r$. Recall that
  - $op("Nul")(A^T A) = op("Nul")(A)$ and $op("Nul")(A A^T) = op("Nul")(A^T)$.
  - $A^T A$ is symmetric and has rank $r$.
]

#algorithm[
  Let $A$ be an $m times n$ matrix with rank $r$.
  - Find orthonormal eigenbasis $(v_1, dots, v_n)$ of $A^T A$ with eigenvalues $lambda_1 >= dots.c >= lambda_r > lambda_(r+1) = 0 = dots.c = lambda_n$.
  - Set $sigma_i = sqrt(lambda_i)$ for $i = 1, dots, n$.
  - Set $u_1 = 1/sigma_1 A v_1, dots, u_r = 1/sigma_r A v_r$. (Magic: orthonormal!)
  - Find $u_(r+1), dots, u_m in Reals^m$ such that $(u_1, dots, u_m)$ is an orthonormal basis of $Reals^m$.
  - Set
    $ U = mat(u_1, dots.c, u_m), quad Sigma = mat(
      sigma_1, dots.h, 0;
      dots.v, dots.down, dots.v;
      0, dots.h, sigma_(min{m,n});
    ), quad V = mat(v_1, dots.c, v_n) $
  Notice that $v_(r+1), dots, v_n in op("Nul")(A^T A)$, and hence $v_(r+1), dots, v_n in op("Nul")(A)$.
  $ arrow.squiggly A V = A mat(v_1, dots.c, v_n) = mat(A v_1, dots.c, A v_n) = mat(sigma_1 u_1, dots.c, sigma_r u_r, 0, dots.c, 0) = U Sigma arrow.squiggly A = U Sigma V^T. $
]

#theorem[
  Let $A$ be an $m times n$ matrix with rank $r$, and suppose $U = mat(u_1, dots.c, u_m)$, $V = mat(v_1, dots.c, v_n)$, and $Sigma$ are such that $A = U Sigma V^T$ is an SVD of $A$. Then
  - $(u_1, dots, u_r)$ is a basis of $op("Col")(A)$.
  - $(u_(r+1), dots, u_m)$ is a basis of $op("Nul")(A^T)$.
  - $(v_1, dots, v_r)$ is a basis of $op("Col")(A^T)$.
  - $(v_(r+1), dots, v_n)$ is a basis of $op("Nul")(A)$.
]

= Low Rank Approximation

#theorem[
  Let $A$ be an $m times n$ matrix with rank $r$, and let $U = mat(u_1, dots.c, u_m)$, $V = mat(v_1, dots.c, v_n)$ be matrices with orthonormal columns and $Sigma$ be a rectangular diagonal $m times n$ matrix such that $A = U Sigma V^T$ is an SVD of $A$. Then
  $ A = sigma_1 u_1 v_1^T + sigma_2 u_2 v_2^T + dots.c + sigma_r u_r v_r^T
    = mat(u_1, dots.c, u_r) mat(
      sigma_1, dots.h, 0;
      dots.v, dots.down, dots.v;
      0, dots.h, sigma_r;
    ) mat(v_1, dots.c, v_r)^T. $
]

#definition[
  For $k <= r$, define
  $ A_k = sigma_1 u_1 v_1^T + sigma_2 u_2 v_2^T + dots.c + sigma_k u_k v_k^T. $
]

*Idea.* If $sigma_1 gt.double sigma_2 gt.double dots.c$, then $A_k$ is a good approximation of $A$.

#definition[
  Let $A$ be an $m times n$ matrix with rank $r$. A compact singular value decomposition of $A$ is a decomposition $A = U_c Sigma_c V_c^T$ where
  - $U_c = mat(u_1, dots.c, u_r)$ is an $m times r$ matrix with orthonormal columns,
  - $Sigma_c$ is an $r times r$ diagonal matrix with positive diagonal elements,
  - $V_c = mat(v_1, dots.c, v_r)$ is an $n times r$ matrix with orthonormal columns.
]

= Pseudoinverses

#definition[
  Let $A$ be an $m times n$ matrix with rank $r$. Given the compact singular value decomposition $A = U_c Sigma_c V_c^T$, where
  - $U_c = mat(u_1, dots.c, u_r)$ is an $m times r$ matrix with orthonormal columns,
  - $Sigma_c$ is an $r times r$ diagonal matrix with positive diagonal elements,
  - $V_c = mat(v_1, dots.c, v_r)$ is an $n times r$ matrix with orthonormal columns,
  we define the pseudoinverse $A^+$ of $A$ as $V_c Sigma_c^(-1) U_c^T$.
]

#theorem[
  Let $v in op("Col")(A^T)$ and $w in op("Col")(A)$. Then $A^+ A v = v$ and $A A^+ w = w$.
]

#remark[
  If $A$ is $n times n$ and invertible, then $op("Col")(A) = Reals^n$. Thus $A^(-1) = A^+$.
]

#theorem[
  Let $A$ be an $m times n$ matrix and let $b in Reals^m$. Then $A^+ b$ is the LSQ solution of $A x = b$ (with minimum length).
]

#remark[
  This is particularly useful, when solving many different LSQ problems of the form $A x = b$, where $A$ stays the same, but $b$ varies.
]

= Principal Component Analysis

*Setup.*
- Given $m$ objects, we measure the same $n$ variables.
- Thus $m$ samples of $n$-dimensional data $arrow.squiggly$ $m times n$ matrix (each row is a sample)
- Analyse this matrix to understand what drives the variance in the data.

#definition[
  Let $X = mat(a_1, dots.c, a_m)^T$ be an $m times n$ matrix. We define the column average $mu(X)$ of $X$ as
  $ mu(X) := 1/m (a_1 + dots.c + a_m). $
  We say $X$ is centered if $mu(X) = 0$, and for $X$ centered, we define the covariance matrix $op("cov")(X)$ of $X$ as $1/(m-1) X^T X$.
]

*Principal component analysis (PCA):*
- Input: centered $m times n$-matrix $X$.
- Compute $op("cov")(X)$.
- Since $op("cov")(X)$ is symmetric, we can find an orthonormal eigenbasis $v_1, v_2, dots, v_n$ of $op("cov")(X)$ with eigenvalues $lambda_1 >= dots.c >= lambda_n >= 0$.
- Write $op("cov")(X)$ as a sum of rank 1 matrices:
  $ op("cov")(X) = lambda_1 v_1 v_1^T + dots.c + lambda_n v_n v_n^T. $
- Each principal component $v_i$ explains part of the variance of the data. The larger $lambda_i$, the more of the variance is explained by $v_i$.

#remark(title: [PCA using SVD])[
  - Let $X$ be a centered data matrix. Observe that $X^T X = (m-1) op("cov")(X)$.
  - To find an orthonormal eigenbasis of $op("cov")(X)$, it is enough to find an orthonormal eigenbasis of $X^T X$.
  - Compute the SVD of $X$ $arrow.squiggly X = U Sigma V^T$.
  - The columns of $V = mat(v_1, dots.c, v_n)$ are the desired orthonormal eigenbasis.
  - If $sigma_i$ is the singular value for $v_i$, then
    $ lambda_i = sigma_i^2/(m-1) $
]

= Review of Complex Numbers

#definition[
  $Complex = {x + i y | x, y in Reals}$ where $i = sqrt(-1)$, or $i^2 = -1$.
  - The real part of $z$, denoted $Re(z)$ is defined by $Re(z) = x$.
  - The imaginary part of $z$, denoted $Im(z)$ is defined by $Im(z) = y$.
  - The complex conjugate of $z$, denoted $overline(z)$, is defined by $overline(z) = x - i y$.
  - The absolute value, or magnitude of $z$, denoted $|z|$ or $norm(z)$, is given by
    $ |z| = sqrt(x^2 + y^2). $
]

#remark[
  Any point in $Reals^2$ can be viewed as a complex number: $vec(x, y) arrow.l.r x + i y$.
]

#definition[
  Given $z = x + i y$, $w = u + i v$, we define $z + w = (x+u) + i(y+v)$, and
  $ z w &= (x + i y)(u + i v) \
        &= x u + x(i v) + (i y) u + (i y)(i v) \
        &= (x u - y v) + i(x v + y u) $
]

#theorem[
  Let $z in Complex$.
  - $overline(overline(z)) = z$
  - $|z|^2 = z overline(z)$
  - $|overline(z)| = |z|$
]

= Complex Linear Algebra

*Goal.* Use complex numbers (instead of real numbers) as scalars.

#definition[
  The (complex) vector space $Complex^n$ is the set of all complex column vectors $z = vec(z_1, z_2, dots.v, z_n)$, where $z_1, z_2, dots, z_n$ are complex numbers.
]

#remark[
  - Now multiplication by a complex scalar makes sense.
  - We can define subspaces, Span, independence, basis, dimension for $Complex^n$ in the usual way.
  - We can multiply complex vectors by complex matrices. Column space and Null space still make sense.
  - The only difference is the dot product, you need to use the complex conjugate to get a good notion of length:
    $ vec(z_1, dots.v, z_n) dot vec(w_1, dots.v, w_n) = z_1 overline(w_1) + z_2 overline(w_2) + dots.c + z_n overline(w_n). $
]

#definition[
  Let $A$ be an $m times n$-matrix. The conjugate matrix $overline(A)$ of $A$ is obtained from $A$ by taking the complex conjugate of each entry of $A$.
]

#theorem[
  Let $A$ be a matrix with real entries and $lambda$ is an eigenvalue of $A$. Then $overline(lambda)$ is also an eigenvalue. Furthermore, if $v$ is an eigenvector with eigenvalue $lambda$, then $overline(v)$ is an eigenvector with eigenvalue $overline(lambda)$.
]

#definition[
  Let $A$ be an $m times n$-matrix. The conjugate transpose $A^H$ of $A$ is defined as $overline(A)^T$. We say the matrix $A$ is Hermitian if $A = A^H$.
]
