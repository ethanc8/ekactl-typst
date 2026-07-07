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

= Vectors, lines, planes

== $Reals^n$

#definition(title: [Two-dimensional real-coordinate space ($Reals^2$)])[
  $ Reals^2 = { (x, y) : x, y in Reals } $
]

#definition(title: [Three-dimensional real-coordinate space ($Reals^3$)])[
  $ Reals^3 = { (x, y, z) : x, y, z in Reals } $

  $x, y, z$ should be presented such that the coordinate system is right-handed ($hat(k) = hat(i) times hat(j)$ should have direction according to the right-hand rule).
]

#definition(title: [Standard basis vectors])[
  The standard basis vectors of a space are the unit vectors that go along the axes of the space. All vectors in that space can be expressed as sums of scalar multiples of the standard basis vectors of that space.

  The standard basis vectors of $Reals^2$ are $hat(i)$ and $hat(j)$, also called $bold(e)_1$ and $bold(e)_2$.

  The standard basis vectors of $Reals^3$ are $hat(i)$, $hat(j)$, and $hat(k)$, also called $bold(e)_1$, $bold(e)_2$, and $bold(e)_3$.
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

#definition(title: [Vector length])[
  The #defname[length] or #defname[magnitude] of a vector $vec(v_1, v_2, dots.v)$ in $Reals^n$ is
  $ abs(vec(v_1, v_2, dots.v)) = norm(vec(v_1, v_2, dots.v)) := sqrt(v_1^2 + v_2^2 + dots.c) $
]

== Dot product

#definition(title: [Dot product])[
  Where $vn(a), vn(b) in Reals^n$ and $theta$ is the angle between $vn(a)$ and $vn(b)$:
  $ vn(a) dot vn(b) = sum a_i b_i = abs(vn(a)) abs(vn(b)) cos theta $
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
  The #defname[scalar projection of $vn(b)$ onto $vn(a)$] or #defname[component of $vn(b)$ along $vn(a)$], is defined as:

  $ "comp"_vn(a) vn(b) := (vn(a) dot vn(b))/(abs(vn(a))) $

  The #defname[vector projection of $vn(b)$ onto $vn(a)$], is defined as:

  $ "proj"_vn(a) vn(b) := "comp"_vn(a) vn(b) vn(a)/abs(vn(a)) = (vn(a) dot vn(b))/(abs(vn(a))^2) vn(a) $

  #image("image-18.png")
]
