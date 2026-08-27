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

= Cross and dot product

$ vn(a) cross vn(b) = detmat(hat(i), hat(j), hat(k); a_1, a_2, a_3; b_1, b_2, b_3), quad abs(vn(a) cross vn(b)) = abs(vn(a)) abs(vn(b)) sin theta $
$vn(a) cross vn(b)$ is orthogonal to both; direction by right-hand rule; magnitude = area of parallelogram spanned by $vn(a)$ and $vn(b)$.

= Planes

*Vector equation* (normal $vn(n)$, point $vn(P)$): $vn(n) dot vn(r) = vn(n) dot vn(P)$

*Normal to level surface* $F(vn(x)) = k$ at $vn(a)$: $grad F(vn(a))$; tangent plane: $grad F(vn(a)) dot vn(r) = grad F(vn(a)) dot vn(a)$

*Plane through three points* $A, B, C$: normal $vn(n) = arrow(A B) times arrow(A C)$

= Differentiation

*Gradient*: $grad f(vn(x)) = angle.l (partial f)/(partial x_1), dots.c, (partial f)/(partial x_n) angle.r$; perpendicular to level sets; points toward steepest ascent with magnitude $abs(grad f) = max_(hat(v)) D_(hat(v)) f$.

*Jacobian* of $vn(f) : Reals^n to Reals^m$ at $vn(x)$ (outputs as rows, inputs as columns):
$ Jacobian vn(f)(vn(x)) = mat(
  (partial f_1)/(partial x_1), dots.c, (partial f_1)/(partial x_n);
  dots.v, dots.down, dots.v;
  (partial f_m)/(partial x_1), dots.c, (partial f_m)/(partial x_n)
) $
For scalar $f : Reals^n to Reals$: $Jacobian f = (grad f)^transpose$ (a row vector).

*Linear approximation* to $f: Reals^n to Reals$ at $vn(a)$ (tangent hyperplane to graph):
$ L = f + grad f dot Delta vn(x) \
L(vn(x)) = f(vn(a)) + grad f(vn(a)) dot (vn(x) - vn(a)) $

*Chain rule* (generic): if $vn(r): Reals^n to Reals^m$ and $vn(f): Reals^m to Reals^p$:
$ Jacobian (vn(f) compose vn(r)) = Jacobian vn(f) Jacobian vn(r) $

In $Reals^3$, $f compose vn(r) : T subset.eq Reals to Reals^3 to Reals$), with $(x, y, z) := (r_1, r_2, r_3)$:
$ (d (f compose vn(r)))/(d t) = (partial f)/(partial x) (d x)/(d t) + (partial f)/(partial y) (d y)/(d t) + (partial f)/(partial z) (d z)/(d t). $

*Directional derivative*: $D_(hat(v)) f(vn(a)) = grad f(vn(a)) dot hat(v)$ (rate of change in direction $hat(v)$).

*Clairaut*: $f_(x y) = f_(y x)$ when both mixed partials are continuous.

= Curves

*Arc length*: $L = int_a^b abs((dif vn(r))/(dif t)) dif t$; arc length function $s(t) = int_a^t abs(vn(r)'(u)) dif u$

*Unit tangent*: $vn(T) = hat(r') = vn(r)' \/ abs(vn(r)')$

*Curvature* (rate of direction change per unit arc length):
$ kappa = abs((dif vn(T))/(dif s)) = abs(vn(T)') / abs(vn(r)') = abs(vn(r)' cross vn(r)'') / abs(vn(r)')^3 $

*Principal unit normal*: $vn(N) = hat(T') = vn(T)' \/ abs(vn(T)')$; perpendicular to $vn(T)$, points toward center of curvature.

*Binormal*: $vn(B) = vn(T) cross vn(N)$; perpendicular to osculating plane; all three $(vn(T), vn(N), vn(B))$ are unit vectors forming a right-handed frame.

*Torsion* (rate of twisting out of the osculating plane; positive = twists toward $vn(B)$):
$ tau = -(dif vn(B))/(dif s) dot vn(N) = ((vn(r)' cross vn(r)'') dot vn(r)''') / abs(vn(r)' cross vn(r)'')^2 $

= Extrema

*Second derivative test* ($f: Reals^2 to Reals$): at a critical point, let $D = f_(x x) f_(y y) - f_(x y)^2 = det Hessian f$:

#table(
  columns: 4,
  stroke: 0.5pt,
  align: center,
  [$D>0$, $f_(x x)>0$], [$D>0$, $f_(x x)<0$], [$D<0$], [$D=0$],
  [local min], [local max], [saddle], [inconclusive],
)

*Lagrange multipliers*: at a constrained extremum of $f$ on ${ vn(x) : g(vn(x)) = k }$, the level sets of $f$ and $g$ are tangent, so their gradients are parallel. Solve:
$ grad f(vn(x)) = lambda grad g(vn(x)), quad g(vn(x)) = k $

= Vector calculus operators

*Divergence*: $div vn(F) = grad dot vn(F) = sum_i (partial F_i)/(partial x_i)$. Measures source density at each point: positive = net outflow, negative = net inflow, zero = incompressible/solenoidal.

*Curl* (3D): $curl vn(F) = grad cross vn(F) = detmat(hat(i), hat(j), hat(k); partial_x, partial_y, partial_z; F_1, F_2, F_3)$. Measures local rotation; direction = axis (right-hand rule), magnitude = angular speed.

*Lemma:* $div (curl vn(F)) = 0$ for all $vn(F)$.

*2D curl*: $(partial Q)/(partial x) - (partial P)/(partial y)$ (the $z$-component of $grad cross vn(F)$).

*Conservative field test*: on a simply connected domain, the following are equivalent:
- $vn(F)$ is conservative
- $(partial F_i)/(partial x_j) = (partial F_j)/(partial x_i)$ for all $i != j$
- $curl vn(F) = 0$ in 3D (irrotational)

The following are always equivalent:
- $vn(F)$ is conservative
- $vn(F) = grad f$ for some potential $f$
- $oint_C vn(F) dot dif vn(r) = 0$ for all closed $C$.

*Finding a potential function*: integrate $F_1$ w.r.t. $x_1$ to get $f + g(x_2, dots, x_n)$; differentiate w.r.t. remaining variables and match against $F_2, F_3, dots$ to determine $g$.

= Line integrals

*Scalar line integral* (integrate $f$ over arc length):
$ int_C f dif s = int_a^b f med abs((dif vn(r))/(dif t)) dif t $

*Vector line integral* (work done by $vn(F)$ along $C$):
$ int_C vn(F) dot dif vn(r) = int_a^b vn(F) dot (dif vn(r))/(dif t) dif t $

*FTLI*: if $vn(F) = grad f$, then $int_C vn(F) dot dif vn(r) = f(vn(r)(b)) - f(vn(r)(a))$ — work depends only on endpoints, not the path.

= Multiple integrals and coordinate systems

*Polar* (2D): $x = r cos theta$, $y = r sin theta$, $r^2 = x^2+y^2$

$iint_D f dif A = iint f med r dif r dif theta$

*Cylindrical*: same as polar + $z=z$; volume element $r dif z dif r dif theta$

$iiint f dif V = iiint f med r dif z dif r dif theta$

*Spherical* ($phi$ = angle from $z$-axis, $0 <= phi <= pi$; $theta$ = azimuthal):
$ x = rho sin phi cos theta quad y = rho sin phi sin theta quad z = rho cos phi \
rho^2 = x^2+y^2+z^2 $

$iiint f dif V = iiint f med rho^2 sin phi dif rho dif theta dif phi$

*Change of variables* (transformation $T_(U X): U to X$, i.e. $vn(x) = T_(U X)(vn(u))$):
$ int dots.c int_X f dif x_1 dots dif x_n \
= int dots.c int_U f med abs(det Jacobian T_(U X)) dif u_1 dots dif u_n $
$abs(det Jacobian T_(U X))$ is the local area/volume stretching factor. For polar, cylindrical, spherical the standard Jacobian determinants give the $r$ and $rho^2 sin phi$ factors above.

= Surfaces

*Normal to parametric surface* $vn(X)(u,v)$: $vn(N) = vn(X)_u cross vn(X)_v$ (orientation from right-hand rule)

*For graph* $z=g(x,y)$: $vn(X)_x cross vn(X)_y = angle.l -g_x, -g_y, 1 angle.r$, so $abs(vn(X)_x cross vn(X)_y) = sqrt(g_x^2+g_y^2+1)$

*Scalar surface integral* (integrate $f$ over surface area):
$ iint_S f dif S = iint_D f abs(vn(X)_u cross vn(X)_v) dif A $

*Flux* (net flow of $vn(F)$ through oriented surface — sign depends on normal orientation):
$ iint_S vn(F) dot dif vn(S) = iint_D vn(F) dot (vn(X)_u cross vn(X)_v) dif A $

= Parameterizations of common surfaces

*Graph of $z = f(x, y)$:*
$ vn(X)(x, y) = vec(x, y, f(x, y)) quad vn(X)_x cross vn(X)_y = vec(- f_x, - f_y, 1) $

*Cylinder of radius $R$:*
$ vn(X)(theta, z) = vec(R cos theta, R sin theta, z) $

*Sphere of radius $R$:* 
$ vn(X)(phi, theta) = vec(R sin phi cos theta, R sin phi sin theta, R cos phi) quad abs(vn(X)_phi cross vn(X)_theta) = R^2 sin phi $

For an *ellipsoid* with equation $ (x^2)/(a^2) + (y^2)/(b^2) + (z^2)/(c^2)$, scale the outputs of sphere $vn(X)$ by $a$, $b$, $c$.

*Cone $z = c r$:* 
$ vn(X)(r, theta) = vec(r cos theta, r sin theta, c r) $

*Surface of revolution of $f(x)$ around the $x$-axis:*
$ vn(X)(u, v) = vec(u, f(u) cos v, f(u) sin v) $

*Variable bounded by function:* If $z$ (in the output coordinate space) is bounded by $z in [0, h(u)]$, define
$z := v h(u)$ with $v in [0, 1]$ to make the $u v$-domain a rectangle. 

= The big three theorems

Green's, Stokes', and the Divergence Theorem each relate an integral over a region to an integral over its boundary, reducing dimension by one.

*Green's* ($C = bound D$, counterclockwise; $D$ a planar region): circulation around the boundary = total 2D curl (rotation density) in the interior:
$ oint_(bound D) P dif x + Q dif y = iint_D ((partial Q)/(partial x) - (partial P)/(partial y)) dif A $

*Stokes'* ($C = bound S$, consistently oriented; $S$ a surface): circulation around the boundary = total 3D curl through any spanning surface:
$ oint_(bound S) vn(F) dot dif vn(r) = iint_S (grad cross vn(F)) dot dif vn(S) $
$S$ can be replaced by any other surface sharing boundary $C$ — pick whichever is easier to integrate over.

Green's is equivalent to Stokes' with the surface being in the $x y$-plane and the normal vector in the $+ z$-direction.

For Green's, regions with holes can be done by orienting the outer boundary counterclockwise and the inner boundary clockwise; for Stokes' make sure they are oriented according to right-hand rule with thumb as the normal vector.

#block(breakable: false)[
  *Divergence* ($S = bound E$, outward normals; $E$ a solid region): net outward flux through a closed surface = total divergence (source density) in the enclosed region:
  $ oiint_(bound E) vn(F) dot dif vn(S) = iiint_E grad dot vn(F) dif V $
  Sign check: positive net outward flux $arrow.l.r$ net positive sources inside.
]

#block(breakable: false)[
  = Electromagnetism

  *$vn(E)$-field:* It points outwards from positive charge, inward towards negative charge, with magnitude

  $ abs(vn(E)) = (k q)/(r^2) = q/(4 pi epsilon_0) 1/(r^2). $

  *Gauss's law:* With outward-pointing (positively-oriented) $d vn(S)$:

  $ grad dot vn(E) = rho/(epsilon_0) quad oiint_S vn(E) dot d vn(S) = (q_"enc")/(epsilon_0) $
]


#block(breakable: false)[
  = Random trig


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
