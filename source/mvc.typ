#import "@local/ethan-standard-style:0.1.0": *
#show: ekactl-style.with(
  section-number: 5,
  title: "Multivariable calculus"
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

= Vectors, matrices

== $Reals^n$

#definition(title: [Two-dimensional real-coordinate space ($Reals^2$)])[
  $ Reals^2 = { (x, y) : x, y in Reals } $
]

#definition(title: [Three-dimensional real-coordinate space ($Reals^3$)])[
  $ Reals^3 = { (x, y, z) : x, y, z in Reals } $

  $x, y, z$ should be presented such that the coordinate system is right-handed ($hat(k) = hat(i) cross hat(j)$ should have direction according to the right-hand rule).
]

#definition(title: [Open set])[
  An open set $U$ in $Reals^n$ satisfies the following equivalent conditions:
  - It is the (possibly infinite) union of open balls $B(x, epsilon)$
  - It is the (possibly infinite) union of open sets
  - Every $x in U$ has some $B(x, epsilon) subset.eq U$
  - Is its interior: $U ior = U$
  - Does not contain its boundary: $bound U parallel U$
  - It is the complement of a closed set
]

#definition(title: [Accumulation point])[
  $x$ is an #defname[accumulation point] of $A$ iff every neighborhood of $x$ (such as $B(x, epsilon)$) contains a point of $A$ other than $x$.
]

#definition(title: [Closed set])[
  A closed set $C$ in $Reals^n$ satisfies the following equivalent conditions:
  - It is the complement of an open set
  - It contains all of its accumulation points
  - If a sequence $x_k to x$ has all $x_k in C$, then its limit $x$ is also in $C$
  - It is its closure: $cl(C) = C$
  - It contains its boundary: $bound C subset.eq C$
]

== Vector space

#definition(title: [Vector space])[
  A vector space over a field $F$ is a set $V$ with the following operations:
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
  - (S4) Multiplicative identity: $1v = v$
]

#theorem[
  $Reals^n$ is a vector space over the field $Reals^n$, where we define
  $ vec(v_1, v_2, dots.v) + vec(w_1, w_2, dots.v) &= (v_1 + w_1, v_2 + w_2, dots.v) \
  alpha vec(v_1, v_2, dots.v) &= vec(alpha v_1, alpha v_2, dots.v) $
]

#definition(title: [Standard basis vectors])[
  The standard basis vectors of a space are the unit vectors that go along the axes of the space. All vectors in that space can be expressed as sums of scalar multiples of the standard basis vectors of that space.

  The standard basis vectors of $Reals^2$ are $hat(i)$ and $hat(j)$, also called $bold(e)_1$ and $bold(e)_2$.

  The standard basis vectors of $Reals^3$ are $hat(i)$, $hat(j)$, and $hat(k)$, also called $bold(e)_1$, $bold(e)_2$, and $bold(e)_3$.
]

#definition(title: [Vector length])[
  The #defname[length] or #defname[magnitude] of a vector $vec(v_1, v_2, dots.v)$ in $Reals^n$ is
  $ abs(vec(v_1, v_2, dots.v)) = norm(vec(v_1, v_2, dots.v)) := sqrt(v_1^2 + v_2^2 + dots.c) $
]

#definition(title: [Displacement vector])[
  The vector from the end of $vn(A)$ to the end of $vn(B)$ when their starts are in the same location.

  $ arrow(A B) = vn(B) - vn(A) $
]

== Dot product

#definition(title: [Dot product])[
  Where $vn(a), vn(b) in Reals^n$ and $theta$ is the angle between $vn(a)$ and $vn(b)$:
  $ vn(a) dot vn(b) = sum a_i b_i = abs(vn(a)) abs(vn(b)) cos theta $

  Also called #defname[scalar product] or #defname[inner product].
]

#corollary[
  Where $vn(a), vn(b) in Reals^n$ and $theta$ is the angle between $vn(a)$ and $vn(b)$:
  $ cos(theta) = (vn(a) dot vn(b))/(abs(vn(a)) abs(vn(b))) $
]

#theorem(title: [Properties of dot product])[
  For $vn(a), vn(b), vn(c) in Reals^n$ and $k in Reals$:
  - $vn(a) dot vn(a) = |vn(a)|^2$
  - $vn(a) dot vn(a) = 0$ iff $vn(a) = 0$
  - Commutativity: $vn(a) dot vn(b) = vn(b) dot vn(a)$
  - Distributivity: $vn(a) dot (vn(b) + vn(c)) = vn(a) dot vn(b) + vn(a) dot vn(c)$
  - Distributivity: $(k vn(a)) dot b = k(vn(a) dot vn(b)) = a dot (k vn(b))$
  - $vn(a) dot vn(b) = 0$ iff $vn(a) perp vn(b)$, $vn(a) = 0$, or $vn(b) = 0$.
]

#definition(title: [Direction angle])[
  The #defname[direction angles] of a nonzero vector $vn(a)$ are the angles $alpha, beta, gamma in [0, pi]$ that $vn(a)$ makes with the positive $x, y, z$ axes respectively.

  #image("image-17.png")
]

#theorem[
  The direction cosines of $vn(a)$ are the components of the unit vector in the direction of $vn(a)$:
  $ 1/(vn(a)) vn(a) = vec(cos alpha, cos beta, cos gamma). $
]

#definition(title: [Projection])[
  The #defname[scalar projection of $vn(b)$ onto $vn(a)$] or #defname[component of $vn(b)$ along $vn(a)$], is defined as (where $theta in [0, pi]$ is the angle between $vn(a)$ and $vn(b)$):

  $ "comp"_vn(a) vn(b) := (vn(a) dot vn(b))/(abs(vn(a))) = abs(vn(b)) cos(theta) $

  The #defname[vector projection of $vn(b)$ onto $vn(a)$], is defined as:

  $ "proj"_vn(a) vn(b) := "comp"_vn(a) vn(b) vn(a)/abs(vn(a)) = (vn(a) dot vn(b))/(abs(vn(a))^2) vn(a) $

  #image("image-18.png")
]

== Cross product

#see[Stewart 12.4, NMD Lecture 4]

#definition(title: [Cross product])[
  For $arrow(a), arrow(b) in Reals^3$, the unique vector $a cross b$ satisfying
  - $|a cross b|$ is the area of the parallelogram spanned by $a$ and $b$
  - $a cross b = 0$ iff $a parallel b$, $a = 0$, or $b = 0$.
  - $a cross b$ is orthogonal to $a$ and $b$.
  - $(a, b, a cross b)$ is right-handed (if the coordinate system is right-handed)
]

#theorem(title: [Properties of cross product])[
  For $a, b, c in Reals^3$ and $k in Reals$:
  - $a cross b = (-b) cross a$
  - $a cross (b + c) = a cross b + a cross c$
  - $(a + b) cross c = a cross c + b cross c$
  - $k(a cross b) = (k a) cross b = a cross (k b)$
  - $a dot (b cross c) = (a cross b) dot c$
  - $a cross (b cross c) = (a dot c) b - (a dot b) c$
]

#theorem(title: [Calculation of cross product])[
  Where $a, b in Reals^3$ and $theta$ is the angle between $a$ and $b$:
  $ a cross b &= vec(a_2 b_3 - a_3 b_2, a_3 b_1 - a_1 b_3, a_1 b_2 - a_2 b_1) = detmat(hat(i), hat(j), hat(k); a_1, a_2, a_3; b_1, b_2, b_3) \
    &= hat(i) detmat(a_2, a_3; b_2, b_3)
    - hat(j) detmat(a_1, a_3; b_1, b_3)
    + hat(k) detmat(a_1, a_2; b_1, b_2) $
  $ |a cross b| = |a| |b| sin theta $
]

=== Parallelograms and parallelepipeds

#theorem(title: [Parallelogram spanned by vectors in $Reals^2$])[
  The area of the parallelogram spanned by the vectors $vn(v), vn(w) in Reals^2$ is given by
  $ detmat(v_1, v_2; w_1, w_2) = v_1 w_2 - v_2 w_1. $

  The sign of the result is positive if $vn(w)$ is counterclockwise from $vn(v)$ and negative if clockwise.
]

#definition(title: [Triple product])[
  The #defname[triple product] of $vn(u), vn(v), vn(w) in Reals^3$ is defined as
  $ u dot (v cross w) &= (u cross v) dot w = detmat(u_1, u_2, u_3; v_1, v_2, v_3; w_1, w_2, w_3;) \
  &= w_1 detmat(u_2, u_3; v_2, v_3)
  - w_2 detmat(u_1, u_3; v_1, v_3)
  + w_3 detmat(u_1, u_2; v_1, v_2) $
]

#theorem(title: [Volume of parallelepiped])[
  #image("image-20.png")

  Consider the parallelepiped determined by $vn(a), vn(b), vn(c) in Reals^3$, shown above. The area of its base is $abs(b cross c)$. Let $theta$ be the angle between $a$ and $b cross c$; then, its height is $abs(a) abs(cos theta)$. Thus, the volume of the parallelepiped is

  $ V = A h = abs(b cross c) abs(a) abs(cos theta) = a dot (b cross c). $
]

== Matrices

#definition(title: [Matrix multiplication])[
  The matrix multiplication of the $m times n$ matrix $A$ and the $n times p$ matrix $B$ is made by dot-producting the rows of the first by the columns of the second:
  $ [A B_(i j)] = [A_(i *) dot B_(* j)] = [sum_(k=1)^n A_(i k) B_(k j)] $
]

#definition(title: [Positive definite])[
  Let $A$ be a matrix. Then $A$ is positive definite iff any of the following equivalent conditions are true:
  - For all $v in Reals^n setminus {0}$, $v^transpose A v > 0$
  - All leading principal minors of $A$ are positive
  - All eigenvalues of $A$ are positive
  - All pivots of $A$ are positive
]

#definition(title: [Negative definite])[
  Let $A$ be a matrix. Then $A$ is negative definite iff any of the following equivalent conditions are true:
  - For all $v in Reals^n setminus {0}$, $v^transpose A v < 0$
  - The $k$th-order leading principal minor is negative if $k$ is odd and positive if $k$ is even
  - All eigenvalues of $A$ are negative
  - All pivots of $A$ are negative
  - $-A$ is positive definite
]

*Positive semidefinite* and *negative semidefinite* are the same except that the determinant/eigenvalue/pivot/$v^transpose A v$ could also be 0.

#definition(title: [Principal minor])[
  The determinant of a submatrix of a matrix.
]

#definition(title: [Leading principal minor])[
  The $k$th-order leading principal minor is the determinant of the top left submatrix of a matrix, where the 1st-order leading principal minor is the determinant of the 1x1 matrix at its top left corner, the 2nd-order is the determinant of the 2x2 matrix at its top left corner, etc.
]

== Useful properties

#theorem(title: [Cauchy-Schwarz inequality])[
  For all $vn(x), vn(y) in Reals^n$,
  $ abs(vn(x) dot vn(y)) <= abs(vn(x)) abs(vn(y)). $
]

#theorem(title: [Triangle inequality])[
  For all $vn(x), vn(y) in Reals^n$,
  $ abs(vn(x) + vn(y)) <= abs(vn(x)) + abs(vn(y)). $
]

= Lines and planes

== Lines

#see[Stewart [12.5]]

The most useful notation for a line is in parametric form:

#definition(title: [Parametric form of a line])[
  Where $vn(r)_0 in Reals^3$ is a point on the line, and $t in Reals^3$:
  $ vn(r)(t) = vn(r)_0 + vn(v) t $

  $vn(v)$ is called the #defname[direction vector]. Then, every value of $t$ gives a point $vn(r)(t)$ on the line.
]

#theorem[
  Two lines are parallel iff their direction vectors are scalar multiples of each other.
]

#definition(title: [Skew lines])[
  Two lines are skew iff they do not intersect but are not parallel, i.e. they lie in different parallel planes.
]

#procedure(title: [Finding the intersection of two lines])[
  Given lines with parametric equations
  $ r_1(t) = a_1 + v_1 t quad r_2(t) = a_2 + v_2 t $
  solve the system of equations
  $ a_1 + v_1 t_1 = a_2 + v_2 t_2 $
  for $t_1$ or $t_2$, then plug it in to the appropriate equation.

  (Break up the equation into its $x$, $y$, and $z$ components, or whichever is appropriate for your coordinate space.)
]

== Planes

#see[Stewart [12.5]]

#definition(title: [Plane])[
  A plane $Pi$ is determined uniquely by a point $P$ in the plane and a normal vector $n$.

  A plane is the set of points $A$ in space such that $arrow(A P)$ is perpendicular to $n$.
]

#theorem(title: [Vector equation for a plane in $Reals^3$])[
  If $vn(n) in Reals^3$ is the *normal vector* to the plane (vector perpendicular to the plane), and $vn(P) in Reals^3$ is a point on the plane, then any other point $vn(r) in Reals^3$ satisfies:

  $ vn(n) dot (vn(r) - vn(P)) = 0 $

  or equivalently:

  $ vn(n) dot vn(r) = vn(n) dot vn(P) $

  We can also write it as a scalar equation:

  $ n_x (x - P_x) + n_y (y - P_y) + n_z (z - P_z) = 0 $
]

#theorem[
  Two planes are parallel iff their normal vectors are parallel.
]

#theorem(title: [Equation of plane containing three points])[
  If $A, B, C in Reals^3$ are points on our plane, then we can find the normal vector by performing $n = arrow(A B) times arrow(A C) = (B - A) times (C - A)$ (since $arrow(A B)$ and $arrow(A C)$ are vectors on the plane).
]

#theorem(title: [Parametric equation for a plane in $Reals^3$])[
  If $a, b in Reals^3$ are nonparallel nonzero vectors on the plane, and $P in Reals^3$ is a point on the plane, then the parametric equation for the plane is:
  $ vn(x)(s, t) = vn(P) + s vn(a) + t vn(b) $
]

== Distance

#see[Stewart [12.5]]

#procedure(title: [Distance between point and line])[
  Let $P$ be the point, and $A + L t$ be the line. Then the distance is
  $ |arrow(A P) - op("proj")_L arrow(A P)| = arrow(P) $
]

#procedure(title: [Distance between parallel planes])[
  Let $Pi_1$ and $Pi_2$ be the two planes.

  If $n$ is normal to both planes, and $P_1 in Pi_1$ and $P_2 in Pi_2$, then the answer is
  $ |op("proj")_n arrow(P_1 P_2)| $
]

= Functions and quadric surfaces

== Functions of two variables

#see[#link("file:///home/ethan/Projects/UIUC/ProficiencyExam/MATH241-MVC/Calculus%20Early%20Transcendentals%209th%20Edition%20by%20James%20Stewart,%20Daniel%20K.%20Clegg,%20Saleem%20Watson,%20Lothar%20Redlin.pdf#page=934")[Stewart [12.6]]]

#see[Colley [2.1], Trimm [3.1, 3.2], Brummet [MVCWUP:Feb4(35-41)]]

#definition(title: [Function])[
  All functions $f : X to Y$ are defined by:
  - A domain set $X$
  - A codomain set $Y$
  - A rule of assignment that associates a unique element $y in Y$ to each element $x in X$
]

#definition(title: [Graph])[
  The graph of $f : X subset.eq Reals^n to Reals$ is the set
  $ {(x_1, dots, x_n, f(x)) : x = (x_1, dots, x_n)} $
  Specifically, for $f : Reals^2 to Reals$ the graph is the set
  $ {(x, y, z) : (x, y) in X "and" z = f(x, y)} $
]

#definition(title: [Level set])[
  Let $f : X subset.eq Reals^n to Reals$. The *level set at height $c$ of $f$* is the set in $Reals^n$ defined by the equation $f(arrow(a)) = c$, where $c$ is a constant. This is equivalent to the set
  $ { arrow(x) in Reals^n : f(arrow(x)) = c } $

  In $Reals^2$, this is also called a *level curve*.
]

#definition(title: [Contour set])[
  Let $f : X subset.eq Reals^n to Reals$. The *contour set at height $c$ of $f$* is the set in $Reals^(n+1)$ defined by the two equations $z = f(arrow(a))$ and $z = c$, where $c$ is a constant. This is equivalent to the set
  $ { arrow(x) in Reals^(n+1) : z = f(arrow(x)) = c } $

  If $f : X subset.eq Reals^2 to Reals$, this is also called a *contour curve*. It is equivalent to the level curve, except it is located in $Reals^3$ rather than $Reals^2$.
]

== Quadric surfaces

#see[#link("https://nathandunfield.github.io/quadrics/index.html")]

#definition(title: [Elliptic paraboloid])[
  The graph of the equation
  $ z = A x^2 + B y^2 $
  where $A$ and $B$ have the same sign.

  The vertical cross-sections are parabolas, while the horizontal cross-sections are ellipses. Increasing $abs(A)$ makes it steeper in the $x$-direction, while increasing $abs(B)$ makes it steeper in the $y$-direction.

  #image("image-23.png")
]

#definition(title: [Hyperbolic paraboloid])[
  The graph of the equation
  $ z = A x^2 + B y^2 $
  where $A$ and $B$ have opposite sides.

  The vertical cross-sections are parabolas, while the horizontal are hyperbolas. Increasing $abs(A)$ makes it steeper in the $x$-direction, while increasing $abs(B)$ makes it steeper in the $y$-direction.

  #image("image-24.png")
]

#definition(title: [Ellipsoid])[
  The graph of the equation
  $ (x^2)/(A^2) + (y^2)/(B^2) + (z^2)/(C^2) = 1. $

  All of its cross-sections are ellipses.

  Increasing $abs(A)$ makes it wider in the $x$-direction, $abs(B)$ makes it wider in the $y$-direction, and $abs(C)$ makes it wider in the $z$-direction.

  #image("image-26.png")
]

#definition(title: [Double cone])[
  The graph of the equation
  $ z^2 = A x^2 + B y^2. $

  The vertical cross-sections are hyperbolas, and the horizontal cross-sections are ellipses. Some of its diagonal cross-sections ara parabolas. All of its cross-sections are called #defname[conic sections].

  Increasing $abs(A)$ makes it steeper in the $x$-direction, while increasing $abs(B)$ makes it steeper in the $y$-direction.

  #image("image-27.png")
]

#definition(title: [Hyperboloid of one sheet])[
  The graph of the equation
  $ (x^2)/(A^2) + (y^2)/(B^2) - (z^2)/(C^2) = 1. $

  The vertical cross-sections are hyperbolas, and the horizontal cross-sections are ellipses. Increasing $abs(A)$ makes it wider in the $x$-direction, while increasing $abs(B)$ makes it wider in the $y$-direction. Increasing $abs(C)$ makes it wider in both directions. $abs(A)$ and $abs(B)$ affect the "hole" in the middle while $abs(C)$ does not.

  #image("image-28.png")
]

#definition(title: [Hyperboloid of two sheets])[
  The graph of the equation
  $ - (x^2)/(A^2) - (y^2)/(B^2) + (z^2)/(C^2) = 1. $

  It can be distinguished from the hyperboloid of one sheet by the fact that it is missing some cross-sections; an easy way to check is to check the cross-sections at $x = 0$, $y = 0$, and $z = 0$.

  The vertical cross-sections are hyperbolas, and the horizontal cross-sections (where they exist) are ellipses. Increasing $abs(A)$ makes it wider in the $x$-direction, while increasing $abs(B)$ makes it wider in the $y$-direction. Increasing $abs(C)$ makes it wider in both directions. $abs(A)$ and $abs(B)$ do not affect the "gap" between the top and bottom "sheets", while $abs(C)$ does affect the gap.

  #image("image-29.png")
]

= Limits

#definition(title: [Limit])[
  If $f : X to Reals$, where $X subset.eq Reals^n$, then $lim_(x to a) f(vn(x)) = L$ iff for every $epsilon > 0$ there exists $delta > 0$ s.t. $vn(x) in X$ and $0 < abs(vn(x) - vn(a)) < delta$ implies $abs(f(vn(x)) - L) < epsilon$.
]

*Warning:* The limit might be different along different paths to $vn(a)$! If different paths result in different limits, then there is no limit.

#definition(title: [Continuity])[
  If $f : X to Reals$, where $X subset.eq Reals^n$, then $f$ is #defname[continuous] at $vn(a)$ iff
  $ lim_(vn(x) to vn(a)) f(vn(x)) = f(vn(a)). $

  $f$ is #defname[continuous] on $X$ iff $f$ is continuous at every $vn(a) in X$.
]

#theorem(title: [Limit laws])[
  $ lim_(vn(x) to vn(a)) f(vn(x)) + g(vn(x)) &= lim_(vn(x) to vn(a)) f(vn(x)) + lim_(vn(x) to vn(a)) g(vn(x)) \
  lim_(vn(x) to vn(a)) f(vn(x)) g(vn(x)) &= (lim_(vn(x) to vn(a)) f(vn(x)))(lim_(vn(x) to vn(a)) g(vn(x))) \
  lim_(vn(x) to vn(a)) f(vn(x))/g(vn(x)) &= (lim_(vn(x) to vn(a)) f(vn(x)))/(lim_(vn(x) to vn(a)) g(vn(x))) \ $
]

#theorem(title: [Squeeze theorem])[
  If
  - $g(vn(x)) <= f(vn(x)) <= h(vn(x))$ for all $vn(x)$ in an open ball containing $vn(a)$, except possibly at $vn(a)$ itself, and
  - $lim_(vn(x) to vn(a)) g(vn(x)) = lim_(vn(x) to vn(a)) h(vn(x)) = L$,
  then $lim_(vn(x) to vn(a)) f(vn(x)) = L$.
]


= Differentiation

== Partial derivatives

#see[Colley [2.3, 2.4], Trimm [3.4, DiffEq-1.0], Brummet [11, 12.5, MVCWUP:Feb12/22(48-54)]]

#see[NMD [8, 9], Stewart []]

#definition(title: [Partial derivative with respect to $x$])[
  The partial derivative of $f(x, y)$ with respect to $x$ is
  $ lim_(h to 0) (f(a + h, b) - f(a, b))/h $

  Let $z = f(x, y)$. Then the partial derivative is denoted by
  $ f_x (x, y) = f_x = (partial f)/(partial x) = partial/(partial x) f(x, y) = (partial z)/(partial x) = D_x f $
]

#definition(title: [Partial derivative])[
  The partial derivative of $f(arrow(x))$ with respect to the $i$th variable is
  $ (partial f(arrow(x)))/(partial x_i) = lim_(h to 0) (f(vec(x_0, dots.v, x_i + h, dots.v, x_n)) - f(arrow(x)))/h $

  This is equivalent to letting $F(x_i) = f(arrow(x))$ and finding $F'(x_i)$.
]

#definition(title: [Higher-order partial])[
  The result of taking the partial derivative of a partial derivative, which may be higher-order.

  A partial derivative that is not higher-order is called a *first-order partial*. A partial derivative of a first-order partial is a second-order partial, a partial derivative of a second-order partial is a third-order partial, etc.

  A higher-order partial which is the result of taking the partial with respect to $x_1$, then with respect to $x_2$, then with respect to $x_3, dots, x_n$, is denoted by
  $ f_(x_1 dots x_n) = partial/(partial x_n) dots partial/(partial x_1) f $

  $x_1 dots x_n$ do not have to be distinct. If $x_1 dots x_n$ are not all the same then the higher-order partial is called a *mixed partial derivative*.
]

#definition(title: [$C^k$ function])[
  Where $k$ is a nonnegative integer, a function $f : X in Reals^n to Reals$ is of order $C^k$ at point $arrow(x) in X$ iff its $k$-th order and lower partials exist and are continuous at $arrow(x)$.

  It is of order $C^infty$ at point $arrow(x)$ iff it is of order $C^k$ at $arrow(x)$ for all $k in Naturals$.

  It is of order $C^k$ iff it is of order $C^k$ at all $x in arrow(x)$.
]

#theorem(title: [Clairaut's theorem])[
  Let $f : X in Reals^n to Reals$ whose $k$-th order and lower partials exist and are continuous on $X$. Then its $k$-th order and lower partials may be evaluated in any order, i.e.
  $ f_(x_1 dots x_n) = f_(x_n dots x_1) = f_(x_1 x_3 x_27 dots x_4) = dots $
]

== Differentiability

#see[Colley [2.3], Trimm [3.5], Brummet [13.5]]

#see[Stewart [14.4], NMD [9]]

#definition(title: [Linear map])[
  $f : Reals^n to Reals$ is a #defname[linear map] iff $f(vn(x)) = A vn(x)$ for some $1 times n$ constant matrix $A$.
]

#definition(title: [Affine map])[
  $f : Reals^n to Reals$ is a #defname[affine map] iff $f(vn(x)) = A vn(x)+ b$ for some $1 times n$ constant matrix $A$ and constant scalar $b in Reals$.

  The #defname[differential] of an affine function is the associated linear function $d f(vn(x)) = A vn(x)$.

  An affine function $f : Reals to Reals$ is of the form $f(x) = a x + b$. Its differential is $d f(x) = a x$.

  An affine function $f : Reals^3 to Reals$ is of the form $f(x) = a x + b y + c z + d$. Its differential is $d f(x) = a x + b y + c z$.
]

#definition(title: [Differential])[
  The #defname[differential] of $f : Reals to Reals$ at $a$ is
  $ d f_a (x) := f'(a) x. $

  The differential of $f : Reals^n to Reals$ is
  $ grad f(arrow(a)) dot (arrow(x) - arrow(a)) = sum (partial f_i)/(partial x_i) (Delta x_i) = sum (partial f_i)/(partial x_i) (x_i - a_i). $
]

#definition[
  Let $f : Reals to Reals$ and $y = f(x)$. For small values of $Delta x$, $Delta y approx d f_a (Delta x) = f'(a) Delta x$:

  #image("image-31.png")

  For the sake of convenience, we define $d x := Delta x$ and 
  $ d y := d f_a (d x) = f'(a) d x = (d y)/(d x) d x. $

  The #defname[linear approximation] of $f$ at $a$ is
  $ f(a + Delta x) approx h(x) :&= f(a) + f'(a) Delta x \
  &= f(a) + f'(a) (x - a) \
  &= f(a) + d y. $
]

#definition(title: [Linear approximation ($Reals^n to Reals$)])[
  The *linear approximation* or *tangent plane ($Reals^3$) or hyperplane* to the graph of a function $f$ at the point $arrow(a)$ is expressed by
  $ L(arrow(x)) = f(arrow(a)) + grad f(arrow(a)) dot (arrow(x) - arrow(a)) $

  In $Reals^3$, this is equivalent to the plane
  $ z = L(x, y) &= f(a, b) + f_x (a, b) (x - a) + f_y (a, b) (y - b) \
  &= f(vn(a)) + f_x (vn(a)) Delta x + f_y (vn(a)) Delta y. $
]

#definition(title: [Linear approximation ($Reals^n to Reals^m$)])[
  The *linear approximation* to a vector-valued function $f$ at the point $arrow(a)$ is expressed by
  $ L(arrow(x)) = f(arrow(a)) + Jacobian f(arrow(a))(arrow(x) - arrow(a)) $
]

#definition(title: [Differentiability])[
  Let $f : X subset.eq Reals^n to Reals^m$, where $X$ is an open subset of $Reals^n$, and let $arrow(a) in X$. $f$ is differentiable at $a$ iff all of its partial derivatives exist and
  $ lim_(arrow(x) to arrow(a)) (f(arrow(x)) - L(arrow(x)))/(|arrow(x) - arrow(a)|) = 0 $
  where $L(arrow(x))$ is the linear approximation to $f$ at $arrow(a)$.

  If $f : Reals^3 to Reals$, then we can instead say $f$ is differentiable iff
  $ lim_(vn(x) to vn(a)) (Delta z - (f_x (vn(a)) Delta x + f_y (vn(a)) Delta y))/(vn(x) - vn(a)) = 0. $
]

#theorem[
  Differentiability implies continuity.
]

#theorem(title: [Differentiability shortcut])[
  Let $f : X subset.eq Reals^n to Reals^m$ be a vector-valued function. If all partial derivatives $(partial f_i)/(partial x_j)$ exist and are continuous in an open ball around $arrow(a)$ in $X$, then $F$ is differentiable at $arrow(a)$.
]

== Chain rule

#see[Colley [2.5], Trimm [3.8, 6.5, DiffEq-1.0], Brummet [12, MVCWUP:Feb24(58-61)]]

#see[NMD [10], Stewart [14.5]]

#theorem(title: [Multivariable chain rule])[
  Suppose $X subset.eq Reals^m$ and $T subset.eq Reals^n$ are open and $f : X subset.eq Reals^m to Reals^p$ and
  $r : T subset.eq Reals^n to Reals^m$ are defined so that $r(T) subset.eq X$. We wish to find the derivative of

  $ f compose r : T subset.eq Reals^n to Reals^m to Reals^p. $

  If $r$ is
  differentiable at $t_0 in T$ and $f$ is differentiable at $x_0 = r(t_0)$, then
  the composite $f compose r$ is differentiable at $t_0$, and we have
  $ Jacobian(f compose r)(t_0) = Jacobian f(x_0) Jacobian r(t_0). $

  When $p = 1$ and $n = 1$ (i.e. $f compose r : T subset.eq Reals to Reals^m to Reals$), this reduces to
  $ (f compose r)'(t_0) = grad f(x_0) dot r'(t_0). $

  When $p = 1$ (i.e. $f compose r : T subset.eq Reals^n to Reals^m to Reals$), define $u := f(x_1, dots, x_m)$ where
  $x_j := r_j (t_1, dots, t_n)$. Then for each $i = 1, 2, dots, n$,
  $ frac(diff u, diff t_i)
      = frac(diff u, diff x_1) frac(diff x_1, diff t_i)
      + frac(diff u, diff x_2) frac(diff x_2, diff t_i)
      + dots.c
      + frac(diff u, diff x_m) frac(diff x_m, diff t_i). $

  In $Reals^3$, if $n = 1$, $p = 1$, and $m = 3$ (i.e. $f compose r : T subset.eq Reals to Reals^3 to Reals$), define $(x, y, z) := (x_1, x_2, x_3)$. Then,
  $ (d (f compose r))/(d t) = (partial f)/(partial x) (d x)/(d t) + (partial f)/(partial y) (d y)/(d t) + (partial f)/(partial z) (d z)/(d t). $
]

== Gradient and Jacobian

#definition(title: [Gradient])[
  $ grad f(arrow(x)) = vec((partial f(x))/(partial x_1), dots.v, (partial f(x))/(partial x_n)) $
]

#theorem[
  $grad f(vn(a))$ is orthogonal to the level set of $f$ at $vn(a)$.
]

#definition(title: [Jacobian])[
  If $f : X subset.eq Reals^n to Reals^m$ is a vector-valued function, then the Jacobian is
  $ Jacobian f (vec(x_1, x_2, dots.v, x_n)) &= vec(grad f_1, grad f_2, dots.v, grad f_m) = mat((partial f)/(partial x_1), (partial f)/(partial x_2), dots.c, (partial f)/(partial x_n)) \
  &= mat(
    (partial f_1)/(partial x_1), (partial f_1)/(partial x_2), dots.h, (partial f_1)/x_n;
    (partial f_2)/(partial x_1), (partial f_2)/(partial x_2), dots.h, (partial f_2)/x_n;
    dots.v, dots.v, dots.down, dots.v;
    (partial f_m)/(partial x_1), (partial f_m)/(partial x_2), dots.h, (partial f_m)/(partial x_n);
  ). $

  The Jacobian $Jacobian f$ is also called $D f$ or $nabla f$.
]

== Directional derivative

#see[Colley [2.6], Trimm [3.7], Brummet [14]]

#see[NMD [11]]

#see[#link("https://youtu.be/7JEWlfFoJJQ")]

#definition(title: [Directional derivative])[
  Let $f : X subset.eq Reals^n to Reals$, where $X$ is an open subset of $Reals^n$, and let $vn(a) in X$. If $vn(v)$ is any unit vector in $X$, then the directional derivative of $f$ at $vn(a)$ in the direction of $vn(v)$ is
  $ D_(vn(v)) f(vn(a)) = lim_(h to 0) (f(vn(a) + h vn(v)) - f(vn(a)))/h $

  We may wish to normalize the directional derivative:
  $ D_(hat(v)) f(vn(a)) = lim_(h to 0) (f(vn(a) + h vn(v)) - f(vn(a)))/(h abs(v)) $  
]

#theorem[
  If $f$ is differentiable at $vn(a)$, then
  $ D_(vn(v)) f(vn(a)) = grad f(vn(a)) dot vn(v) $

  We may wish to normalize the directional derivative:
  $ D_(hat(v)) f(vn(a)) = grad f(vn(a)) dot vn(v)/abs(v) $
]

#theorem[
  The gradient points in the direction of steepest ascent, and its magnitude is the derivative in that direction:
  $ abs(grad f(vn(a))) = D_hat(grad f(vn(a))) f(vn(a)) = max { D_(hat(v)) f(vn(a)) : vn(v) in Reals^n } $
  where $f : X subset.eq Reals^n to Reals$.
]

#theorem[
  Let $f : X subset.eq Reals^n to Reals$, and let $(vn(a), k) in Reals^(n + 1)$. Then $grad f(vn(a))$ is orthogonal to the level curve at height $k$.

  Thus, the tangent plane to the surface described by $f(vn(x)) = k$ at point $vn(a)$ is the plane with normal vector $grad f(vn(a))$.
]

#example[
  The electric potential $V$'s negative gradient is called $vn(E)$:
  $ vn(E) = - grad V. $

  This is because in electrostatics, opposites attract, so positive charges want to follow the steepest descent to an area with low electric potential. $grad V$ points to the steepest ascent, so $-grad V$ points to the steepest descent.
]

#non-tested-content[#theorem[
  The second directional derivative of $f$ in the direction of $vn(v)$ is given by
  $ v^transpose (Hessian f) v. $
]]

= Extrema

#see[Colley [4.1], Brummet [15, MVCWUP:69-80(Mar 4-6)]]

#see[NMD [12, 13], Stewart [14.7]]

#see[#link("https://youtu.be/7JEWlfFoJJQ")]

== Local extrema

#definition(title: [Critical point of $f$])[
  A point $vn(c)$ in the domain of $f$ where all of the partial derivatives of $f$ at $vn(c)$ equal 0 or do not exist, or equivalently $grad f(vn(c)) = 0$ or does not exist.
]

#definition(title: [Saddle point])[
  A critical point that is not a max or min.
]

#theorem(title: [by Fermat's Theorem])[
  If $f : X subset.eq Reals^n to Reals$ has a local maximum or minimum at $vn(a)$ and the first order partial derivatives exist, then $vn(a)$ is a critical point.
]

#definition(title: [Hessian matrix])[
  The Hessian matrix $Hessian f$ of a function $f : X subset.eq Reals^n to Reals$ is the matrix of second-order partials
  $ [Hessian f_(i j)] = [(partial^2 f)/(partial x_i partial x_j)] $

  If $X subset.eq Reals^2$, then
  $ Hessian f = mat(f_(x x), f_(x y); f_(y x), f_(y y)) $

  The Hessian is the transpose of the Jacobian of the gradient:
  $ Hessian f = (Jacobian grad f)^transpose. $
]

#theorem(title: [Second partial derivative test])[
  Let $X$ be an open subset of $Reals^n$ and $f : X to Reals$ whose 2nd-order and lower partials exist and are continuous on $X$ (f is of class $C^2$). Let $vn(a) in X$ be a critical point of $f$. Then
  - If the Hessian $Hessian f(vn(a))$ is positive definite, then $f$ has a local minimum at $vn(a)$.
    - Easiest way to check is that the leading principal minors (determinant of the top left submatrices) are positive.
    - This is equivalent to the second derivative $v^transpose (Hessian f) v$ being positive.
  - If the Hessian $Hessian f(vn(a))$ is negative definite, then $f$ has a local maximum at $vn(a)$.
    - Easiest way to check is that the 1st leading principal minor is negative, 2nd is positive, 3rd is negative, etc.
    - This is equivalent to the second derivative $v^transpose (Hessian f) v$ being positive.
  - If $det Hessian f(vn(a)) != 0$ but $Hessian f(vn(a))$ is neither positive nor negative definite, then $f$ has a saddle point at $vn(a)$.
  - If the Hessian has both positive and negative eigenvalues, then $f$ has a saddle point at $vn(a)$.
  - Otherwise, the Hessian must be positive semidefinite or negative semidefinite, and the test is inconclusive.

  If $X subset.eq Reals^2$, let
  $ D := f_(x x)(vn(a)) f_(y y)(vn(a)) - (f_(x y)(vn(a)))^2 = det Hessian f(vn(a)) $
  Then
  - If $D > 0$ and $f_(x x)(vn(a)) > 0$, then $f$ has a local minimum at $vn(a)$.
  - If $D > 0$ and $f_(x x)(vn(a)) < 0$, then $f$ has a local maximum at $vn(a)$.
  - If $D < 0$, then $f$ has a saddle point at $vn(a)$.
  - If $D = 0$ the test is inconclusive.

  (Note that if $f_(x x)(vn(a)) = 0$ then $D <= 0$.)
]

== Taylor polynomials

#see[#link("https://youtu.be/V4iscOnH6W8")]

The #defname[first-order Taylor polynomial] is just the linear approximation

$ T_1(vn(x)) = f(vn(a)) + grad f(vn(a)) dot (vn(x) - vn(a)) $

#definition(title: [Second-order Taylor polynomial])[
  The #defname[second-order Taylor polynomial] for a function $f in Reals^n to Reals$ at point $vn(a)$ evaluated at point $vn(x)$, where $vn(h) := vn(x) - vn(a)$, is:
  $ T_2(vn(x)) &= f(vn(a)) + sum_(i=1)^n f_(x_i)(vn(a)) h_i + 1/2 sum_(i,j=1)^n f_(x_i x_j)(vn(a)) h_i h_j \
    &= f(vn(a)) + grad f(vn(a)) dot vn(h) + 1/2 vn(h)^transpose (Hessian f(vn(a))) vn(h) $
]

Higher-order Taylor polynomials are not very useful.

== Absolute extrema

#theorem(title: [Extreme Value Theorem])[
  Let $X$ be a closed and bounded subset of $Reals^n$ and suppose $f : X to Reals^n$ is continuous. Then $f$ attains an absolute maximum and an absolute minimum somewhere on $X$.
]

#theorem(title: [Method to find absolute minima and maxima with a constraint])[
  Let $A$ be a closed bounded subset of $Reals^n$, and $C$ be the set of all critical points of $f$ contained within $A$. Let $S := C union bound A$, the union of $C$ and the boundary of $A$. Then, the absolute maximum is $max {f(vn(c)) : vn(c) in S}$ and the absolute minimum is $min {f(vn(c)) : vn(c) in S}$.
]

== Lagrange multiplier

#see[#link("https://www.youtube.com/watch?v=8mjcnxGMwFo")]

#theorem[
  If $f(vn(x)_0) = c$ is an extreme value (absolute max or min) of $f$ on the set ${ vn(x) : g(vn(x)) = k }$ and $grad g(vn(x)_0) != 0$, then the following equivalent things are true:
  - at $vn(x)_0$, the level set ${ vn(x) : f(vn(x)) = c }$ is tangent to $g(vn(x)) = k$.
  - $grad f(vn(x)_0) = lambda grad g(vn(x)_0)$, where $lambda in Reals$ is called the *Lagrange multiplier*.
]

#procedure[
  To find the extreme values of $f$ on the set ${ vn(x) : g(vn(x)) = k }$, solve the system of equations
  $ grad f(vn(x)) &= lambda grad g(vn(x)) \
  g(vn(x)) &= k. $
]

= Vector functions

#see[#link("https://youtu.be/40r56pX4mqA"), #link("https://youtu.be/80J5s0pic8M")]

#see[Brummet [MVCWUP:Feb24(55-56)]]

#see[NMD [15], Stewart [13.1-13.4]]

#definition(title: [Path])[
  A #defname[path] or #defname[curve] in $Reals^n$ is the image of a function $f : I subset.eq Reals to Reals^n$, i.e. it is the set $f(I)$. If $I = [a, b]$, then the endpoints of the path are $f(a)$ and $f(b)$.
]

#definition(title: [Derivative of vector-valued function])[
  Let $vn(f) : T subset.eq Reals to Reals^m$. Then
  $ vn(f)'(t) := vec(f_1'(t), f_2'(t), dots.v, f_m'(t)) $
]

#theorem(title: [Differentiation rules])[
  Let $vn(u), vn(v) : Reals to Reals^n$, $f : Reals to Reals$, $c in Reals$. Then,
  $ d/(d t) vn(u)(t) + vn(v)(t) &= vn(u)'(t) + vn(v)'(t) \
  d/(d t) c vn(u)(t) &= c vn(u)'(t) \
  d/(d t) f(t) vn(u)(t) &= f'(t) vn(u)(t) + f(t) vn(u)'(t) \
  d/(d t) vn(u)(t) dot vn(v)(t) &= vn(u)'(t) dot vn(v)(t) + vn(u)(t) dot vn(v)'(t) \
  d/(d t) vn(u)(t) cross vn(v)(t) &= vn(u)'(t) cross vn(v)(t) + vn(u)(t) cross vn(v)'(t) \
  d/(d t) vn(u)(f(t)) &= f'(t) vn(u)'(f(t)) $
]

#definition(title: [Tangent vector])[
  Given a path $vn(r)(I)$ given by $vn(r) : I subset.eq Reals to Reals^3$, the tangent vector to said path at some point $P$ is given by $vn(r)'(t)$, provided that $vn(r)'(t) != 0$.
]

#definition(title: [Limit of vector-valued function])[
  Let $vn(f) : X subset.eq Reals^n to Reals^m$. Then
  $ lim vn(f)(t) := vec(lim f_1 (t), lim f_2 (t), dots.v, lim f_m (t)) $
]

#theorem[
  $vn(f) : X subset.eq Reals^n to Reals^m$ is continuous at $vn(a)$ iff the components are continuous.
]

== Arc length

#theorem(title: [Arc length])[
  The length of a path $vn(r)([a, b])$ given by $vn(r) : [a, b] subset.eq Reals to Reals^3$ is

  $ L = int_a^b abs(vn(r)'(t)) d t $
]

#definition(title: [Arc length function])[
  Let $vn(r)(I)$ be a path given by $vn(r) : I subset.eq Reals to Reals^3$. Then the #defname[arc length function] from $a$, which takes in $t$ and returns the arc length traversed since $f(a)$, is
  $ s(t) := int_a^t abs(vn(r)'(u)) d u $
]

#procedure(title: [Reparameterizing in terms of arc length])[
  Let $vn(r)(I)$ be a path given by $vn(r) : I subset.eq Reals to Reals^3$. Let $s(t)$ be the arc length function of $vn(r)$ from $a$. Then, the reparameterization of $vn(r)$ in terms of arc length from $a$ is $vn(r) compose s^(-1)$.
]

== Curvature and torsion

#definition(title: [Smooth])[
  A parameterization $vn(r) : I subset.eq Reals to Reals^3$ is #defname[smooth] iff $vn(r)'$ is continuous and $vn(r)'(t) != 0$ for all $t in I$.

  A path is smooth iff it has a smooth parameterization.
]

#definition(title: [Unit tangent vector])[
  Let $vn(r)(I)$ be a path given by $vn(r) : I subset.eq Reals to Reals^3$. Then, its #defname[unit tangent vector] at $vn(r)(t)$ is
  $ vn(T)(t) := (vn(r)'(t))/abs(vn(r)'(t)). $
]

#definition(title: [Curvature])[
  Let $vn(r)(I)$ be a path given by $vn(r) : I subset.eq Reals to Reals^3$. The #defname[curvature] of $vn(r)$ at $t$ is the change in unit tangent vector per unit arc length:
  $ kappa(t) := abs((d vn(T))/(d s)) = abs(vn(T)'(t))/(vn(r)'(t)) = abs(vn(r)'(t) cross vn(r)''(t))/abs(vn(r)'(t))^3. $
]

#definition(title: [Principal unit normal vector])[
  Let $vn(r)(I)$ be a path given by $vn(r) : I subset.eq Reals to Reals^3$. Let $t$ be a point s.t. $kappa(t) != 0$. The #defname[principal unit normal vector] (also called #defname[unit normal]) of $vn(r)$ at $t$ is
  $ vn(N)(t) := (vn(T)'(t))/abs(vn(T)'(t)). $

  It is always perpendicular to $vn(T)(t)$, and indicates the direction in which the curve is turning at each point.
]

#definition(title: [Binormal vector])[
  Let $vn(r)(I)$ be a path given by $vn(r) : I subset.eq Reals to Reals^3$. Let $t$ be a point s.t. $kappa(t) != 0$. The #defname[binormal vector] of $vn(r)$ at $t$ is
  $ vn(B)(t) = vn(T)(t) cross vn(N)(t). $

  The binormal vector is perpendicular to both $vn(T)(t)$ and $vn(N)(t)$, and is also a unit vector.
]

#definition(title: [Normal and osculating planes])[
  The #defname[normal plane] is the plane determined by $vn(N)$ and $vn(B)$, and contains all lines orthogonal to $vn(T)$.

  The #defname[osculating plane] is the plane determined by $vn(T)$ and $vn(N)$, and is the plane closest to containing the part of the curve near $vn(P) := vn(r)(t)$.

  #image("image-33.png")
]

#definition(title: [Osculating circle])[
  The #defname[circle of curvature] or #defname[osculating circle] of $C := vn(r)(I)$ at $vn(P) := vn(r)(t)$ is the circle in the osculating plane that passes through $vn(P)$ with radius $1/kappa$ and center a distance $1/kappa$ from $vn(P)$ along the vector $vn(N)$.

  The center of said circle is called the #defname[center of curvature].

  The circle of curvature shares the same tangent, normal, and curvature with the curve $C$ at $P$.

  #image("image-34.png")
]

#definition(title: [Torsion])[
  The #defname[torsion] of a curve is
  $ tau(t) := - (d vn(B))/(d s) dot vn(N) = - (vn(B)'(t) dot vn(N)(t))/(vn(r)'(t)) = ((vn(r)'(t) cross vn(r)''(t)) dot vn(r)'''(t))/abs(vn(r)'(t) cross vn(r)''(t))^2. $

  The torsion measures how much the curve "twists"; if $tau$ is positive, the curve twists out of the osculating plane at $P$ in the direction of the binormal, and if it's negative, it twists in the direction opposite the binormal.
]

== Kinematics

#definition[
  Let $vn(r)(t)$ be the position of a particle at time $t$.

  Its #defname[velocity] at time $t$ is $vn(v)(t) := vn(r)'(t)$. Its #defname[acceleration] at time $t$ is $vn(a)(t) := vn(r)''(t)$.

  Its #defname[speed] at time $t$ is $v(t) := abs(vn(r)'(t))$.
]

#theorem(title: [Tangential and normal components of acceleration])[
  $ vn(v) = v vn(T). $
  $ vn(a) = v' vn(T) + kappa v^2 vn(N). $
]

= Vector fields + line integrals

#see[NMD [17-20], Stewart [16.1-16.3]]

== Vector fields

#definition(title: [Vector field])[
  A vector field in $Reals^n$ is a mapping $F : X subset.eq Reals^n to Reals^n$.
]

#definition(title: [Flow line])[
  A flow line of a vector field $F : X subset.eq Reals^n to Reals^n$ is a differentiable path $vn(x) : I to Reals^n$ (where $I$ is an interval on $Reals$) such that
  $ vn(x)'(t) = F(vn(x)(t)) $
  That is, the velocity vector of $vn(x)$ at time $t$ is given by the value of the vector field $F$ at the point on $x$ at time $t$.
]

#procedure(title: [Approximating flow line])[
  Begin at a vector along the flow line. Then the next vector on the vector field in the direction pointed to by this vector is approximately along the flow line. So you can draw a curve through the vectors following the arrows.
]

#definition(title: [Conservative vector field])[
  A vector field $vn(F)$ is conservative iff there exists $f : Reals^n to Reals$ such that $vn(F) = grad f$ at all points in $Reals^n$. Then $f$ is called the *potential function* for $F$.
]

#theorem(title: [Converse of Poincaré's lemma])[
  If $vn(F) : D subset.eq Reals^n to Reals^n$ is a continuously differentiable ($C^1$) conservative vector field, then
  $ (partial F_i)/(partial x_j) = (partial F_j)/(partial x_i) quad "for all" i != j. $

  Equivalently, throughout $D$, $Jacobian vn(F) = (Jacobian vn(F))^transpose$ (the Jacobian is symmetric).
]

#theorem(title: [Poincaré's lemma])[
  If $vn(F) : D subset.eq Reals^n to Reals^n$ is a continuously differentiable ($C^1$) vector field. If $D$ is simply connected and 
  $ (partial F_i)/(partial x_j) = (partial F_j)/(partial x_i) quad "for all" i != j, $
  or equivalently $Jacobian vn(F) = (Jacobian vn(F))^transpose$ (the Jacobian is symmetric), then $vn(F)$ is conservative.
]

*Note:* In $Reals^3$, $Jacobian vn(F) = (Jacobian vn(F))^transpose$ is equivalent to $vn(F)$ being irrotational ($grad cross vn(F) = 0$).

== Line integrals

#see[#link("https://youtu.be/WA5_a3C2iqY?si=a99FLFGMVS5xyEUM")]

#definition(title: [Scalar line integral])[
  If $C$ is a smooth curve defined by $vn(r) = vn(r)(t), a <= t <= b$, where $vn(r) in Reals^n$, then
  $ integral_C f(vn(r)) dif s = integral_a^b f(vn(r)(t)) abs(vn(r)'(t)) dif t. $
]

#definition(title: [Line integral of a vector field along a smooth curve])[
  If $F$ is any continuous vector field defined on a smooth curve $C$ defined by $vn(r)(t), a <= t <= b$, then
  $ integral_C vn(F) dot dif vn(r) = integral_C vn(F) dot hat(T) dif s = integral_a^b vn(F)(vn(r)(t)) dot vn(r)'(t) dif t $

  It represents the work done by moving a particle along the curve $C$, if $F$ is a force field.
]

#definition(title: [Path independence])[
  A vector field $vn(F)$ is path-independent iff for any two paths $C_1$ and $C_2$ which have the same start and end points,
  $ integral_(C_1) vn(F) dot dif vn(r) = integral_(C_2) vn(F) dot dif vn(r) $
]

#theorem(title: [Fundamental Theorem of Line Integrals])[
  Let $C$ be a smooth curve given by the function $vn(r)(t)$ defined on the interval $t in [a, b]$. Let $f$ be a differentiable function whose gradient $grad f$ is continuous on $C$. Then
  $ integral_C grad f dot dif vn(r) = f(vn(r)(b)) - f(vn(r)(a)) $

  In other words, the line integral of a conservative field along a curve is equal to the potential difference between its endpoints.

  This implies that the following statements are equivalent:
  - The vector field $vn(F)$ is conservative
  - The vector field $vn(F)$ is path-independent
  - $integral.cont_C vn(F) dot dif vn(r) = 0$ for every closed path $C$.
]

#example[
  The electric field caused by a single point charge $q$ is
  $ vn(E)(x) = (epsilon_0 q)/(abs(vn(x))^3) vn(x). $

  It's a conservative field, since $-V$ is its potential function:
  $ vn(E) = - grad V. $

  $int_C vn(E) dot dif s$ is the work per unit charge moving along the path $C$, and is equal to the voltage difference (by the Fundamental Theorem of Line Integrals):
  $ int_C vn(E) dot dif s = V(vn(B)) - V(vn(A)), $
  where $vn(A)$ and $vn(B)$ are the endpoints of $C$.
]

= Multiple integrals

== Coordinate system

#definition(title: [Polar coordinates])[
  $ x = r cos theta wide y = r sin theta \
  r^2 = x^2 + y^2 wide tan theta = y/x $
]

#definition(title: [Cylindrical coordinates])[
  $ x = r cos theta wide y = r sin theta wide z = z \
  r^2 = x^2 + y^2 wide tan theta = y/x wide z = z $

  #image("image-38.png")
]

#definition(title: [Spherical coordinates])[
  Let $vn(x)$ be a point, and call the line from $vn(0)$ to $vn(x)$ the "radius". It has three coordinates:
  - $rho$ (or $r$), the #defname[radial distance] --- length of the radius 
  - $theta$, the #defname[azimuthal angle] of the radius around the polar axis $z$, within the $x y$-plane
  - $phi$, the #defname[polar angle] or #defname[inclination angle] between the radius and the polar axis $z$

  Physicists use $phi$ for the azimuthal angle and $theta$ for the polar angle.

  $ x = rho sin phi cos theta wide y = rho sin phi sin theta wide z = rho cos phi \
  rho^2 = x^2 + y^2 + z^2 wide phi = cos^(-1) (z/rho) \
  theta = cos^(-1) (x/(rho sin phi)) $

  #image("image-39.png")
]

#block(breakable: false)[
  The following may be useful:

  #align(center)[
    #table(
      columns: 5,
      align: center,
      stroke: none,
      table.vline(x: 2),
      [$degree$], [$"rad"$], [$sin$], [$cos$], [$tan$],
      table.hline(),
      [$0 degree$], [$0$], [$0$], [$1$], [$0$],
      [$30 degree$], [$pi/6$], [$1/2$], [$sqrt(3)/2$], [$1/sqrt(3)$],
      [$45 degree$], [$pi/4$], [$sqrt(2)/2$], [$sqrt(2)/2$], [$1$],
      [$60 degree$], [$pi/3$], [$sqrt(3)/2$], [$1/2$], [$sqrt(3)$],
      [$90 degree$], [$pi/2$], [$1$], [$0$], [$"undef"$],
    )
  ]

  $ cos^2 x + sin^2 x = 1. $
]

== Double integral

#see[Colley [5.1, 5.2], Paul's Notes [15.1, 15.2, 15.3], Brummet [08, MVCWUP:Feb3(29-33)]]

// Some of these equations were copied from Paul's Notes.

#definition(title: [Double integral])[
  The double integral of $f : X subset.eq Reals^2 to Reals$ over the rectangle $R$ is
  $ integral.double_R f(x, y) dif A = lim_(n, m to infty) sum_(i=1)^n sum_(j=1)^m f(x_i^*, y_j^*) Delta A $

  Generally, the double integral of $f$ over the region $R$ is
  $ integral.double_R f(x, y) dif A = lim_(n to infty) sum_((x_i^*, y_j^*) in R) f(x_i^*, y_j^*) Delta A $
  (choose $n$ points $(x_i^*, y_j^*)$ in $R$, then sum each $f(x_i^*, y_j^*) Delta A$)
]

#theorem(title: [Fubini's Theorem])[
  If $f : X subset.eq Reals^2 to Reals$ is continuous on $[a, b] times [c, d]$, then
  $ integral.double_R f(x, y) dif A &= integral_a^b integral_c^d f(x, y) dif y dif x \
  &= integral_c^d integral_a^b f(x, y) dif x dif y $
]

#theorem[
  If $f(x, y) = g(x) h(y)$ and $R = [a, b] times [c, d]$, then
  $ integral.double_R f(x, y) dif A &= integral.double_R g(x) h(y) dif A \
  &= (integral_a^b g(x) dif x)(integral_c^d h(y) dif y) $
]

#theorem[
  If $f : X subset.eq Reals^2 to Reals$ is continuous on the region $D subset.eq X$, then define
  $ F(x, y) := cases(
    f(x, y) & "if" (x, y) in D \
    0 & "if" (x, y) in.not D.
  ) $

  Let $R$ be a rectangle containing $D$. Then,
  $ iint_D f(x, y) dif A = iint_R F(x, y) dif A. $
]

#definition(title: [Type I region])[
  A #defname[type I region] is a region that lies between the graphs of two continuous functions of $x$:
  $ D := { (x, y) : a <= x <= b, g_1(x) <= y <= g_2(x) }. $

  #image("image-36.png")
]

#theorem(title: [Type I integrals])[
  If $f : X subset.eq Reals^2 to Reals$ is defined on $D = { (x, y) : a <= x <= b, g_1(x) <= y <= g_2(x) }$, then
  $ integral.double_D f(x, y) dif A = integral_a^b integral_(g_1(x))^(g_2(x)) f(x, y) dif y dif x $
]

#definition(title: [Type II region])[
  A #defname[type I region] is a region that lies between the graphs of two continuous functions of $y$:
  $ D := { (x, y) : h_1(y) <= x <= h_2(x), c <= y <= d }. $

  #image("image-37.png")
]

#theorem(title: [Type II integrals])[
  If $f : X subset.eq Reals^2 to Reals$ is defined on $D = { (x, y) : h_1(y) <= x <= h_2(x), c <= y <= d }$, then
  $ integral.double_D f(x, y) dif A = integral_c^d integral_(h_1(y))^(h_2(y)) f(x, y) dif x dif y $
]

#theorem(title: [Reversing the order of integration])[
  Sketch the bounds of the region of integration, then just redo the bounds from scratch.
]

#theorem(title: [Converting double integrals to polar])[
  $ integral_a^b integral_c^d f(x, y) dif x dif y = integral_alpha^beta integral_gamma^delta f(x, y) thick r dif r dif theta \
  =integral_alpha^beta integral_gamma^delta f(r cos theta, r sin theta) thick r dif r dif theta \ $

  $a, b, c, d, alpha, beta, gamma, delta$ may be constants or may depend on the variables. To find the new bounds sketch the bounds and redo the bounds.

  *Warning:* Don't forget the $r$ in $iint f med r dif r dif theta$!
]

== Triple integral

#see[Stewart [15.6-15.8], Trimm [5.6, 5.7], ]

#definition(title: [Triple integral])[
  The triple integral of $f$ over the region $R$ is
  $ integral.triple_R f dif A = lim_(n to infty) sum_((x_i^*, y_j^*, z_k^*) in R) f(x_i^*, y_j^*, z_k^*) Delta A $
  (choose $n$ points $(x_i^*, y_j^*, z_k^*)$ in $R$, then sum each $f(x_i^*, y_j^*, z_k^*) Delta A$)
]

#theorem(title: [Fubini's Theorem])[
  If $f : X subset.eq Reals^3 to Reals$ is continuous on $[a, b] times [c, d] times [r, s]$, then
  $ iiint_R f(x, y) dif A &= int_r^s int_c^d int_a^b f(x, y) dif x dif y dif z $
]

We have type I, II, and III regions in 3-space just like in the plane, and we integrate just like with double integrals.

#theorem(title: [Triple integrals in cylindrical coordinates])[
  Let $f : Reals^3 to Reals$ be continuous and
  $ D :&= {(r, theta) : alpha <= theta <= beta, quad h_1(theta) <= r <= h_2(theta)} \
  E :&= {(x, y, z) : (x, y) in D, quad u_1(x, y) <= z <= u_2(x, y)}. $
  Then,
  $ iiint_E f(x, y, z) dif V = \
  int_alpha^beta int_(h_1 (theta))^(h_2 (theta)) int_(u_1 (r cos theta, r sin theta))^(u_2 (r cos theta, r sin theta)) f(r cos theta, r sin theta, z) med r dif z dif r dif theta $

  In short,
  $ iiint f dif V = iiint f med r dif z dif r dif theta. $
]

#theorem(title: [Triple integrals in spherical coordinates])[
  In short,
  $ iiint f dif V = iiint f med rho^2 sin phi dif rho dif theta dif phi $
]

=== General change of variables

#theorem(title: [General change of variables])[
  Given a function $f : Reals^n to Reals^m$ which takes in an argument in the coordinate system $X$, and $T_(X U) : Reals^n to Reals^n$ is a transformation from coordinates in $X$ to coordinates in $U$,
  $ integral dots.c integral_R f(vn(x)) dif x_1 dots dif x_n \
  = integral dots.c integral_R f(T_(X U) (vn(u))) abs(det Jacobian T_(X U)^(-1)) dif u_1 dots dif u_n $

  where $abs(det Jacobian T_(X U)^(-1))$ is the absolute determinant of the Jacobian of $T_(X U)^(-1)$ (the transformation from coordinates in $U$ to coordinates in $X$), which is also denoted by
  $ abs(det Jacobian T_(X U)^(-1)) = abs(det Jacobian T_(U X)) = abs((partial(x_1, dots, x_n))/(partial(u_1, dots, u_n))) $

  It can also be computed more easily by taking the inverse of $Jacobian T_(X U)$:
  $ abs(det Jacobian T_(X U)^(-1)) = abs(1/(det Jacobian T_(X U))) $
]

#example(title: [Example: Cartesian to spherical])[
  Converting from Cartesian coordinates to spherical coordinates in $Reals^3$:
  $ vec(x, y, z) = T_(X italic(Rho))^(-1) (vec(rho, theta, phi)) = vec(rho sin phi cos theta, rho sin phi sin theta, rho cos phi) $
  so then the absolute Jacobian determinant is
  $ abs(det Jacobian T_(X italic(Rho))^(-1)) = rho^2 sin phi $
]

= Div, curl, Green's theorem


== Divergence and curl

#see[#link("https://youtu.be/rB83DpBJQsE")[3Blue1Brown video]]

#definition(title: [Del operator])[
  In $Reals^3$, del is defined by
  $ grad := vec((partial)/(partial x), (partial)/(partial y), (partial)/(partial z)) $

  In $Reals^n$, del is defined by
  $ grad := vec((partial)/(partial x_1), dots.v, (partial)/(partial x_n)) $

  Del is an operator; it takes in a function and outputs a function.
]

#definition(title: [Divergence])[
  Let $vn(F) : X subset.eq Reals^n to Reals^n$ be a differentiable vector field. Then the divergence of $vn(F)$ is the scalar field
  $ div vn(F) = grad dot vn(F) = (partial F_1)/(partial x_1) + dots.c + (partial F_n)/(partial x_n) $
]

#lemma[
  If $vn(F)$ represents the flow rate of a fluid, then $div vn(F)$ represents the net mass flow through each point in the domain of $vn(F)$:
  - If $div vn(F) > 0$, then more fluid is flowing out than in.
  - If $div vn(F) < 0$, then more fluid is flowing in than out.
  - If $div vn(F) = 0$, then the same amount of fluid flows in as flows out. In this case, $vn(F)$ is considered *incompressible* and *solenoidal*.

  The divergence of a vector field represents how "outgoing" the field is at each point, and how source-like (if positive) or sink-like (if negative) each point is.

  #image("image-40.png")

  The divergence is the average of $ "Step" dot "Difference"$ over all directions, with an infinitesimally small step.
]

#definition(title: [Curl ($Reals^3$)])[
  Let $vn(F) : X subset.eq Reals^3 to Reals^3$ be a differentiable vector field on $Reals^3$. Then the curl of $vn(F)$ is the vector field
  $ curl vn(F) = grad times vn(F) $
]

#definition(title: [Curl ($Reals^2$)])[
  Let $vn(F) : X subset.eq Reals^2 to Reals^2$ be a differentiable vector field on $Reals^2$. Then the curl of $vn(F)$ is the scalar field
  $ curl vn(F) = (partial F_2)/(partial x) - (partial F_1)/(partial y) $

  This is equivalent to the magnitude of $grad times vn(F)$, where counterclockwise is positive and clockwise is negative (by right-hand rule).
]

#definition(title: [Irrotational])[
  If $grad times vn(F) = 0$ everywhere on the vector field $vn(F) : X subset.eq Reals^n to Reals^n$, then $vn(F)$ is considered *irrotational*.
]

#lemma[
  Let there exist an infinitesimally small sphere at the point $vn(x) in X$. Let $vn(F) : X subset.eq Reals^3 to Reals^3$ be a vector field that represents the velocity of a fluid at each point in $X$. Then $curl vn(F)$ is the unique vector such that
  - The direction of $curl vn(F)$ is along the axis of rotation of the sphere, following the right-hand rule.
  - The magnitude of $curl vn(F)$ is the speed of the rotation of the sphere.

  #image("image-40.png")

  The curl is the average of $ "Step" cross "Difference"$ over all directions, with an infinitesimally small step.
]

== Green's theorem

#see[#link("https://youtu.be/8SwKD5_VL5o")[Video]]

#see[NMD [30, 31], Stewart [16.4]]

#theorem(title: [Green's Theorem])[
  Let $bound D$ be a positively oriented (counterclockwise, i.e. $D$ is to the left as you follow $bound D$), piecewise smooth, simple closed curve in the $x y$-plane, and $D$ be the region bounded by $bound D$. If $P$ and $Q$ have continuous partial derivatives on an open region containing $D$, then
  $ integral.cont_(bound D) P dif x + Q dif y = integral.double_D ((partial Q)/(partial x) - (partial P)/(partial y)) dif A $
  Equivalently, if $vn(F) = x, y mapsto vec(P(x, y), Q(x, y))$, then
  $ integral.cont_(bound D) vn(F) dot dif vn(r) = integral.double_D abs(grad cross vn(F)) dif A $

  In other words, the circulation of a vector field along a curve is the same as the sum of the curls within the region bounded by the curve.
]

#definition(title: [Circulation])[
  The circulation of the vector field $vn(F)$ around the curve $C$ is
  $ integral.cont_C vn(F) dot dif vn(r) $

  It measures how much $F$ aligns with the curve $C$.
]

#procedure(title: [Motivation of Green's Theorem])[
  Let $D$ be a connected region bounded by $bound D = C$, and $D_1$ and $D_2$ be two disjoint connected halves of that region with $bound D_1$ and $bound D_2$. Then
  $ oint_C f dif s = oint_C_1 f dif s + oint_C_2 f dif s. $

  #image("image-41.png")

  Now consider the circulation $oint_C vn(F) dot dif vn(r)$, and partition $D$ into infinitely many infinitesimally small areas $dif A$:

  #image("image-42.png")

  The circulation around an infinitesimally small area is the same as the curl on that area, so
  $ integral.cont_(bound D) vn(F) dot dif vn(r) = integral.double_D abs(grad cross vn(F)) dif A. $
]

= Surfaces

== Parametric surfaces

#see[NMD [28], Stewart [16.6]]

#definition(title: [Parametric/parameterized surface])[
  Let $vn(X) : D subset.eq Reals^2 to Reals^3$ be a one-to-one function (except possibly at the boundary of $D$). Then the image of $X$ is called a parameterized surface.
]

#definition(title: [Normal vector to a parameterized surface])[
  Let $vn(X) = vec(u, v) mapsto vec(x(u,v), y(u,v), z(u,v))$ be a parameterization of a surface, and let $vn(u)$ be a vector in the domain of $vn(X)$. Then the tangent vector along the $u$-axis is $vn(X)_u (vn(u))$, where
  $ vn(X)_u = vec((partial x)/(partial u), (partial y)/(partial u), (partial z)/(partial u)) $
  and similarly the tangent vector along the $v$-axis is $vn(X)_v (vn(u))$.

  Then the normal vector to the parameterized surface at the point $vn(u)$ is
  $ vn(N) = vn(X)_u (vn(u)) times vn(X)_v (vn(v)) $
]

#definition(title: [Smooth])[
  A paramaterization $vn(X)$ of a surface is smooth at a point if its normal vector is not equal to 0 at that point.

  A surface is smooth at a point if there exists a paramaterization for that surface which is smooth at that point.

  Note that a smooth surface can have non-smooth paramaterizations.
]

== Surface integrals

#see[#link("https://nmd.web.illinois.edu/classes/2024/241/notes/Lecture29.pdf")[NMD [29]], Stewart [16.7]]

#definition(title: [Scalar surface integral])[
  The surface integral of $f$ over the surface $S$ which is paramaterized by $vn(X) : D subset.eq Reals^2 to Reals^3 = (u, v) to (x, y, z)$ and where $D$ is the domain of $vn(X)$ is
  $ integral.double_S f dif S = integral.double_D f(vn(X)(u,v)) abs(vn(X)_u times vn(X)_v) dif A $
  ($dif S$ is a part of the surface area, $dif A$ is a part of the domain)
]

#definition(title: [Scalar surface integral in $Reals^3$ for function of two variables])[
  (This is optional; the definition above can be used to derive this.)

  The surface integral of $f$ over the surface $S$ defined by $z = g(x, y)$, whose domain is $D$, is
  $ integral.double_S f dif S = integral.double_D f(x, y, g(x,y)) sqrt(((partial g)/(partial x))^2 + ((partial g)/(partial y))^2 + 1) dif A $
]

#definition(title: [Orientable surface])[
  A smooth, connected surface $S$ is orientable iff it is possible to define a single normal vector at each point of $S$ such that the collection of these normal vectors varies continuously over $S$.
]

#definition(title: [Closed surface])[
  A surface is closed iff it is the boundary of some solid region $E$.
]

#definition(title: [Oriented surface])[
  A smooth, orientable surface together with a choice of its orientation.

  If the surface is closed and encloses the region $E$, then it has a *positive orientation* when we choose the set of its normal vectors to point away from $E$ and a *negative orientation* when we choose the set of its normal vectors to point towards $E$.
]

#definition(title: [Vector surface integral, flux])[
  The surface integral or flux of the vector field $vn(F)$ over the surface $S$ which is paramaterized by $vn(X) : D subset.eq Reals^2 to Reals^3 = (u, v) to (x, y, z)$ and where $D$ is the domain of $vn(X)$ is
  $ integral.double_S vn(F) dot dif vn(S) = integral.double_D F(vn(X)(u,v)) dot (vn(X)_u times vn(X)_v) dif u dif v $
]

== Stokes' Theorem

#definition(title: [Positive oriented boundary])[
  Given a surface $S$ whose boundary is the curve $C$, the positive orientation of the curve is such that if one were to walk along the curve in that direction, with the vector upwards from the top of their head parallel to the normal vectors of $S$, the surface would be to that person's left. Equivalently, you could choose a normal vector and use the right-hand rule (thumb is the normal vector and the positive orientation is given by the curl of the fingers).

  // #figure(
  //   image("content/mvc/images/positive-oriented-boundary.png", width: 50mm),
  // )
]

#theorem(title: [Stokes' Theorem])[
  Let $S$ be an oriented smooth surface, bounded by a curve $partial S$, composed of finitely many simple closed smooth differentiable ($C^1$) curves with positive orientation. Let $vn(F)$ be a differentiable ($C^1$) vector field whose domain includes $S$. Then
  $ integral.cont_(partial S) vn(F) dot dif vn(r) = integral.double_S (grad cross vn(F)) dot dif vn(S) $

  In other words, the circulation of a vector field along a curve is the same as the sum of the curls within the surface bounded by the curve.
]

== Divergence theorem

#theorem(title: [Gauss's Theorem / Divergence theorem])[
  Let $D$ be a solid region in $Reals^3$, bounded by a surface $partial D$, composed of finitely many smooth closed surfaces with positive orientation. Let $vn(F)$ be a differentiable ($C^1$) vector field whose domain includes $D$. Then
  $ integral.surf_(partial D) vn(F) dot dif vn(S) = integral.triple_D grad dot F dif V $

  In other words, the flux of a vector field through a closed surface is the same as the sum of the divergences of the vector field through the region bounded by the surface.

  This follows from that
  - The ratio of flux to volume approaches the divergence as the volume becomes smaller.
  - If the region is partitioned into smaller regions, the flux of the region is equal to the sum of the flux of the smaller regions (since the flux of the boundary of the two regions cancels out).
]

