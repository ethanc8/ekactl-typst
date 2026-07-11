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

#let infty = math.infinity

#let vn = math.arrow // vec name

#let cross = math.times

#let detmat(..rows) = math.mat(..rows, delim: "|")

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
  If $vec(n) in Reals^3$ is the *normal vector* to the plane (vector perpendicular to the plane), and $vec(P) in Reals^3$ is a point on the plane, then any other point $vec(r) in Reals^3$ satisfies:

  $ vec(n) dot (vec(r) - vec(P)) = 0 $

  or equivalently:

  $ vec(n) dot vec(r) = vec(n) dot vec(P) $

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
  $ vec(x)(s, t) = vec(P) + s vec(a) + t vec(b) $
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