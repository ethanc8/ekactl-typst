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
#let bound = math.partial // boundary

#let Riemann = $cal(R)$

#let card = [card]

#let int = math.integral

#set math.vec(delim: "[")
#set math.mat(delim: "[")

#let infty = math.infinity

#let vn = math.arrow // vec name

#let cross = math.times

#let detmat(..rows) = math.mat(..rows, delim: "|")

#let grad = math.nabla

#let Jacobian = $"J"$

= Vectors

== $Reals^n$

#definition(title: [Two-dimensional real-coordinate space ($Reals^2$)])[
  $ Reals^2 = { (x, y) : x, y in Reals } $
]

#definition(title: [Three-dimensional real-coordinate space ($Reals^3$)])[
  $ Reals^3 = { (x, y, z) : x, y, z in Reals } $

  $x, y, z$ should be presented such that the coordinate system is right-handed ($hat(k) = hat(i) cross hat(j)$ should have direction according to the right-hand rule).
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

  $ V = A h = abs(b cross c) abs(a) abs(cos theta) = abs(a times (b cross c)). $
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

#definition(title: [Derivative of vector-valued function])[
  Let $f : T subset.eq Reals to Reals^m$. Then
  $ f'(t) = vec(f_1'(t), f_2'(t), dots.v, f_m'(t)) $
]

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
#definition(title: [Directional derivative])[
  Let $f : X subset.eq Reals^n to Reals$, where $X$ is an open subset of $Reals^n$, and let $vn(a) in X$. If $vn(v)$ is any unit vector in $X$, then the directional derivative of $f$ at $vn(a)$ in the direction of $vn(v)$ is
  $ D_(vn(v)) f(vn(a)) = lim_(h to 0) (f(vn(a) + h vn(v)) - f(vn(a)))/h $
]

#theorem[
  If $f$ is differentiable at $vn(a)$, then
  $ D_(vn(v)) f(vn(a)) = grad f(vn(a)) dot vn(v) $
]

#theorem[
  The gradient points in the direction of steepest ascent, and its magnitude is the derivative in that direction:
  $ abs(grad f(vn(a))) = D_(grad f(vn(a))) f(vn(a)) = max { D_(vn(v)) f(vn(a)) : vn(v) in Reals^n } $
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
