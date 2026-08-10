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

#let vn = math.vn // vn name

#let cross = math.times

#let detmat(..rows) = math.mat(..rows, delim: "|")

#let grad = math.nabla

= Multivariable Calculus

*Colley (2012)* refers to _Vector Calculus, Fourth Edition_ by Susan Jane Colley.

== Vectors, lines, planes

=== $Reals^n$

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

=== Vectors

See the properties of fields in the LinAlg notes for definitions of addition and scalar multiplication.

#definition(title: [Displacement vector])[
  The vector from the end of $vn(A)$ to the end of $vn(B)$ when their starts are in the same location.

  $ vn(A B) = vn(B) - vn(A) $
]

=== Dot and cross products

#definition(title: [Dot product])[
  Where $a, b in Reals^n$ and $theta$ is the angle between $a$ and $b$:
  $ a dot b = sum a_i b_i = |a| |b| cos theta $
]

#theorem(title: [Properties of dot product])[
  For $vn(a), vn(b), vn(c) in Reals^n$ and $k in Reals$:
  - $vn(a) dot vn(a) = |vn(a)|^2$
  - $vn(a) dot vn(a) = 0$ iff $vn(a) = 0$
  - Commutativity: $vn(a) dot vn(b) = vn(b) dot vn(a)$
  - Distributivity: $vn(a) dot (vn(b) + vn(c)) = vn(a) dot vn(b) + vn(a) dot vn(c)$
  - Distributivity: $(k vn(a)) dot b = k(vn(a) dot vn(b)) = a dot (k vn(b))$
  - $vn(a) dot vn(b) = 0$ iff $a perp b$, $a = 0$, or $b = 0$.
]

#definition(title: [Cross product])[
  For $vn(a), vn(b) in Reals^3$, the unique vector $a times b$ satisfying
  - $|a times b|$ is the area of the parallelogram spanned by $a$ and $b$
  - $a times b = 0$ iff $a parallel b$, $a = 0$, or $b = 0$.
  - $a times b$ is orthogonal to $a$ and $b$.
  - $(a, b, a times b)$ is right-handed (if the coordinate system is right-handed)
]

#theorem(title: [Properties of cross product])[
  For $a, b, c in Reals^3$ and $k in Reals$:
  - $a times b = (-b) times a$
  - $a times (b + c) = a times b + a times c$
  - $(a + b) times c = a times c + b times c$
  - $k(a times b) = (k a) times b = a times (k b)$
]

#theorem(title: [Calculation of cross product])[
  Where $a, b in Reals^n$ and $theta$ is the angle between $a$ and $b$:
  $ a times b &= vn(a_2 b_3 - a_3 b_2, a_3 b_1 - a_1 b_3, a_1 b_2 - a_2 b_1) = mat(delim: "|", hat(i), hat(j), hat(k); a_1, a_2, a_3; b_1, b_2, b_3) \
    &= hat(i) mat(delim: "|", a_2, a_3; b_2, b_3)
    + hat(j) mat(delim: "|", a_1, a_3; b_1, b_3)
    + hat(k) mat(delim: "|", a_1, a_2; b_1, b_2) $
  $ |a times b| = |a| |b| sin theta $
]

=== Lines

The most useful notation for a line is in parametric form:

#definition(title: [Parametric form of a line])[
  Where $r_0 in Reals^3$ is a point on the line, and $t in Reals^3$:
  $ r(t) = r_0 + v t $

  $t$ is called the *direction vector*.
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

=== Planes

#see[Colley [1.5]]

#definition(title: [Plane])[
  A plane $Pi$ is determined uniquely by a point $P$ in the plane and a normal vector $n$.

  A plane is the set of points $A$ in space such that $vn(A P)$ is perpendicular to $n$.
]

#theorem(title: [Scalar equation for a plane in $Reals^3$])[
  If $n in Reals^3$ is the *normal vector* to the plane (vector perpendicular to the plane), and $P in Reals^3$ is a point on the plane:

  $ n_x (x - P_x) + n_y (x - P_y) + n_z (z - P_z) = 0 $

  or equivalently:

  $ n_x x + n_y y + n_z z = n_x P_x + n_y P_y + n_z P_z $
]

#procedure(title: [Equation of plane containing three points])[
  If $A, B, C in Reals^3$ are points on our plane, then we can find the normal vector by performing $n = vn(A B) times vn(A C) = (B - A) times (C - A)$ (since $vn(A B)$ and $vn(A C)$ are vectors on the plane).
]

#theorem(title: [Parametric equation for a plane in $Reals^3$])[
  If $a, b in Reals^3$ are nonparallel nonzero vectors on the plane, and $P in Reals^3$ is a point on the plane, then the parametric equation for the plane is:
  $ x(s, t) = P + s a + t b $
]

=== Distance

#see[Colley [1.5]]

#procedure(title: [Distance between point and line])[
  Let $P$ be the point, and $A + L t$ be the line. Then the distance is
  $ |vn(A P) - op("proj")_L vn(A P)| = vn(P) $
]

#procedure(title: [Distance between parallel planes])[
  Let $Pi_1$ and $Pi_2$ be the two planes.

  If $n$ is normal to both planes, and $P_1 in Pi_1$ and $P_2 in Pi_2$, then the answer is
  $ |op("proj")_n vn(P_1 P_2)| $
]

=== Cylindrical and spherical coordinates

#see[Colley [1.7], Trimm [5.6, 5.7], Brummet [08, MVCWUP:Feb3(29-33)]]

#definition(title: [Cylindrical coordinate])[
  An ordered pair $(r, theta, z)$ where $r$ is the distance between the point and the $z$-axis, $theta$ is the angle counterclockwise from the positive $x$-axis along the $x y$-plane, and $z$ is the position on the $z$-axis.
]

#definition(title: [Spherical coordinate])[
  An ordered pair $(rho, phi, theta)$, where $rho$ is the distance between the point and the origin, $phi$ is the angle clockwise from the positive $z$-axis going downwards towards the $x y$-plane, and $theta$ is the angle counterclockwise from the positive $x$-axis along the $x y$-plane.

  Typically we use the following restrictions:
  $ rho > 0 quad 0 <= theta <= 2pi quad 0 <= phi <= pi $
]

#theorem(title: [Useful formulas])[
  $ r = rho sin phi quad z = rho cos phi $
  $ x = rho sin phi cos theta quad y = rho sin phi sin theta $
  $ r^2 = x^2 + y^2 quad x = r cos theta quad y = r sin theta $
]

== Functions, limits, differentiation

=== Multivariable functions

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
  Let $f : X subset.eq Reals^n to Reals$. The *level set at height $c$ of $f$* is the set in $Reals^n$ defined by the equation $f(vn(a)) = c$, where $c$ is a constant. This is equivalent to the set
  $ { vn(x) in Reals^n : f(vn(x)) = c } $

  In $Reals^2$, this is also called a *level curve*.
]

#definition(title: [Contour set])[
  Let $f : X subset.eq Reals^n to Reals$. The *contour set at height $c$ of $f$* is the set in $Reals^(n+1)$ defined by the two equations $z = f(vn(a))$ and $z = c$, where $c$ is a constant. This is equivalent to the set
  $ { vn(x) in Reals^(n+1) : z = f(vn(x)) = c } $

  If $f : X subset.eq Reals^2 to Reals$, this is also called a *contour curve*. It is equivalent to the level curve, except it is located in $Reals^3$ rather than $Reals^2$.
]

// TODO: finish this

=== Limits

#see[Trimm [3.3, DiffEq-1.0], Brummet [09, MVCWUP:Feb11(42-46)], Colley [2.2]]

#definition(title: [Limit])[
  $lim_(vn(x) to vn(a)) f(vn(x)) = vn(L)$ if for all $epsilon > 0$, there exists $delta > 0$ s.t. if $0 < |vn(x) - vn(a)| < delta$ then $|f(vn(a)) - vn(L)| < epsilon$.
]

#definition(title: [Continuity])[
  Let $f : X subset.eq Reals^n to Reals^m$ and let $vn(a) in X$. Then $f$ is continuous at point $vn(a)$ iff
  $ lim_(vn(x) to vn(a)) f(vn(x)) = f(vn(a)) $
  If $f$ is continuous at all $vn(a) in X$, then we say that $f$ is continuous.
]

=== Differentiation

#see[Colley [2.3, 2.4], Trimm [3.4, DiffEq-1.0], Brummet [11, 12.5, MVCWUP:Feb12/22(48-54)]]

#definition(title: [Partial derivative with respect to $x$])[
  The partial derivative of $f(x, y)$ with respect to $x$ is
  $ lim_(h to 0) (f(a + h, b) - f(a, b))/h $

  Let $z = f(x, y)$. Then the partial derivative is denoted by
  $ f_x (x, y) = f_x = (partial f)/(partial x) = partial/(partial x) f(x, y) = (partial z)/(partial x) = D_x f $
]

#definition(title: [Partial derivative])[
  The partial derivative of $f(vn(x))$ with respect to the $i$th variable is
  $ (partial f(vn(x)))/(partial x_i) = lim_(h to 0) (f(vn(x_0, dots.v, x_i + h, dots.v, x_n)) - f(vn(x)))/h $

  This is equivalent to letting $F(x_i) = f(vn(x))$ and finding $F'(x_i)$.
]

#definition(title: [Higher-order partial])[
  The result of taking the partial derivative of a partial derivative, which may be higher-order.

  A partial derivative that is not higher-order is called a *first-order partial*. A partial derivative of a first-order partial is a second-order partial, a partial derivative of a second-order partial is a third-order partial, etc.

  A higher-order partial which is the result of taking the partial with respect to $x_1$, then with respect to $x_2$, then with respect to $x_3, dots, x_n$, is denoted by
  $ f_(x_1 dots x_n) = partial/(partial x_n) dots partial/(partial x_1) f $

  $x_1 dots x_n$ do not have to be distinct. If $x_1 dots x_n$ are not all the same then the higher-order partial is called a *mixed partial derivative*.
]

#definition(title: [$C^k$ function])[
  Where $k$ is a nonnegative integer, a function $f : X in Reals^n to Reals$ is of order $C^k$ at point $vn(x) in X$ iff its $k$-th order and lower partials exist and are continuous at $vn(x)$.

  It is of order $C^infty$ at point $vn(x)$ iff it is of order $C^k$ at $vn(x)$ for all $k in Naturals$.

  It is of order $C^k$ iff it is of order $C^k$ at all $x in vn(x)$.
]

#theorem[
  Let $f : X in Reals^n to Reals$ whose $k$-th order and lower partials exist and are continuous on $X$. Then its $k$-th order and lower partials may be evaluated in any order, i.e.
  $ f_(x_1 dots x_n) = f_(x_n dots x_1) = f_(x_1 x_3 x_27 dots x_4) = dots $
]

#definition(title: [Gradient])[
  $ grad f(vn(x)) = vn((partial f(x))/(partial x_1), dots.v, (partial f(x))/(partial x_n)) $
]

=== Implicit surfaces

#see[Brummet [12]]

#definition(title: [Implicit surface])[
  A surface in $Reals^3$ defined by an equation which is not solved for $x$, $y$, nor $z$.

  We often express it as
  $ F(x, y, z) = 0, $
  in which case the surface is the set of points which satisfy $F(x, y, z) = 0$.
]

#theorem[
  The gradient $grad F(vn(x))$ is the normal vector to the tangent plane to the implicit surface defined by $F(vn(x)) = k$, where $k$ is a constant.

  Equivalently, if $x_0$ is a point on the level set $S = { x in X : F(x) = k }$ where $F : X subset.eq Reals^n to Reals$, then the vector $grad F(x_0)$ is perpendicular to $S$.
]

=== Chain rule

#see[Colley [2.5], Trimm [3.8, 6.5, DiffEq-1.0], Brummet [12, MVCWUP:Feb24(58-61)]]

#definition(title: [Jacobian])[
  If $f : X subset.eq Reals^n to Reals^m$ is a vector-valued function, then the Jacobian is
  $ D f(vn(x_1, x_2, dots.v, x_n)) = vn(grad f_1, grad f_2, dots.v, grad f_m) = mat(
    (partial f_1)/(partial x_1), (partial f_1)/(partial x_2), dots.h, (partial f_1)/x_n;
    (partial f_2)/(partial x_1), (partial f_2)/(partial x_2), dots.h, (partial f_2)/x_n;
    dots.v, dots.v, dots.down, dots.v;
    (partial f_m)/(partial x_1), (partial f_m)/(partial x_2), dots.h, (partial f_m)/x_n;
  ) $
]

#theorem(title: [Multivariable chain rule])[
  Suppose $X subset.eq Reals^m$ and $T subset.eq Reals^n$ are open and $f : X to Reals^p$ and
  $r : T to Reals^m$ are defined so that $T subset.eq X$. If $x$ is
  differentiable at $t_0 in T$ and f is differentiable at $x_0 = r(t_0)$, then
  the composite $f compose r$ is differentiable at $t_0$, and we have
  $ (f compose r)'(t) = grad f(x_0) dot r'(t_0) $
  Equivalently,
  $ D(f compose r)(t_0) = D f(x_0) D r(t_0) $

  In $Reals^3$,
  $ (d F)/(d t) = (partial F)/(partial x) (d x)/(d t) + (partial F)/(partial y) (d y)/(d t) + (partial F)/(partial z) (d z)/(d t) $
]

=== Paths

#see[Brummet [MVCWUP:Feb24(55-56)]]

#definition(title: [Path])[
  A path in $Reals^n$ is a function $x : I to Reals^n$, where $I$ is a set of scalars. If $I = [a, b]$, then the endpoints of the path are $f(a)$ and $f(b)$.
]

#definition(title: [Tangent vector])[
  Given a path $r : Reals to Reals^3$, the tangent vector to said path at some point $P$ is given by $r'(t)$, provided that $r'(t) != 0$. In $Reals^3$,
  $ r'(t) = lim_(h to 0) (r(t + h) - r(t))/h = vn((d x)/(d t), (d y)/(d t), (d z)/(d t)) $
]

#definition(title: [Derivative of vector-valued function])[
  Let $f : T subset.eq Reals to Reals^m$. Then
  $ f'(t) = vn(f_1'(t), f_2'(t), dots.v, f_m'(t)) $
]

=== Differentiability

#see[Colley [2.3], Trimm [3.5], Brummet [13.5]]

#definition(title: [Linear approximation ($Reals^n to Reals$)])[
  The *linear approximation* or *tangent plane ($Reals^3$) or hyperplane* to the graph of a function $f$ at the point $vn(a)$ is expressed by
  $ L(vn(x)) = f(vn(a)) + grad f(vn(a)) dot (vn(x) - vn(a)) $

  In $Reals^3$, this is equivalent to the plane
  $ z = L(x, y) = f(a, b) + f_x (a, b) (x - a) + f_y (a, b) (y - b) $
]

#definition(title: [Linear approximation ($Reals^n to Reals^m$)])[
  The *linear approximation* to a vector-valued function $f$ at the point $vn(a)$ is expressed by
  $ L(vn(x)) = f(vn(a)) + D f(vn(a))(vn(x) - vn(a)) $
]

#definition(title: [Differentiability])[
  Let $f : X subset.eq Reals^n to Reals^m$, where $X$ is an open subset of $Reals^n$, and let $vn(a) in X$. $f$ is differentiable at $a$ iff all of its partial derivatives exist and
  $ lim_(vn(x) to vn(a)) (f(vn(x)) - L(vn(x)))/(|vn(x) - vn(a)|) = 0 $
  where $L(vn(x))$ is the linear approximation to $f$ at $vn(a)$.
]

#theorem(title: [Differentiability shortcut])[
  Let $f : X subset.eq Reals^n to Reals^m$ be a vector-valued function. If all partial derivatives $(partial f_i)/(partial x_j)$ exist and are continuous in a neighborhood of $vn(a)$ in $X$, then $F$ is differentiable at $vn(a)$.
]

=== Directional derivative

#see[Colley [2.6], Trimm [3.7], Brummet [14]]

#definition(title: [Directional derivative])[
  Let $f : X subset.eq Reals^n to Reals$, where $X$ is an open subset of $Reals^n$, and let $vn(a) in X$. If $vn(v)$ is any unit vector in $X$, then the directional derivative of $f$ at $a$ in the direction of $v$ is
  $ D_(vn(v)) f(vn(a)) = lim_(h to 0) (f(vn(a) + h vn(v)) - f(vn(a)))/h $
]

#theorem[
  If $f$ is differentiable at $a$, then
  $ D_(vn(v)) f(vn(a)) = grad f(vn(a)) dot vn(v) $
]

#theorem[
  The gradient is the path of steepest ascent, i.e.
  $ D_(indmap(grad f(vn(a)))) f(vn(a)) = max { D_(vn(v)) f(vn(a)) : vn(v) in Reals^n } $
  where $f : X subset.eq Reals^n to Reals$.
]

#theorem[
  Let $f : X subset.eq Reals^2 to Reals$, and let $(a, b, c) in Reals^3$. Then $grad f(a, b)$ is orthogonal to the level curve at height $c$.
]

== Extrema

=== Absolute extrema

#see[Colley [4.1], Brummet [15, MVCWUP:69-74(Mar 4-6)]]

#theorem(title: [Quasi-First Derivative Test])[
  If $f : X subset.eq Reals^n to Reals$ has a local maximum or minimum at $vn(a)$ and the first order partial derivatives exist, then $grad f dot vn(a) = 0$, or equivalently all the partials are equal to 0.
]

#theorem(title: [Extreme Value Theorem])[
  Let $X$ be a closed and bounded subset of $Reals^n$ and suppose $f : X to Reals^n$ is continuous. Then $f$ attains an absolute maximum and an absolute minimum somewhere on $X$.
]

#definition(title: [Critical point of $f$])[
  A point $vn(c)$ in the domain of $f$ where all of the partial derivatives of $f$ at $vn(c)$ equal 0.
]

#definition(title: [Saddle point])[
  A critical point that is not a max or min.
]

#theorem(title: [Method to find absolute minima and maxima])[
  Let $C$ be the set of all critical points of $f$. Then, the absolute maximum is $max {f(vn(c)) : vn(c) in C}$ and the absolute minimum is $min {f(vn(c)) : vn(c) in C}$.
]

#theorem(title: [Method to find absolute minima and maxima with a constraint])[
  Let $C$ be the set of all critical points of $f$. Let $S$ be the union of $C$ and the boundary of the constraint (the constraint constrains the domain on which we are finding absolute minima and maxima). Then, the absolute maximum is $max {f(vn(c)) : vn(c) in C}$ and the absolute minimum is $min {f(vn(c)) : vn(c) in C}$.
]

=== Some linalg stuff

#definition(title: [Matrix multiplication])[
  The matrix multiplication of the $m times n$ matrix $A$ and the $n times p$ matrix $B$ is made by dot-producting the rows of the first by the columns of the second:
  $ [A B_(i j)] = [A_(i *) dot B_(* j)] = [sum_(k=1)^n A_(i k) B_(k j)] $
]

#definition(title: [Positive definite])[
  Let $A$ be a matrix. Then $A$ is positive definite iff for all $v in Reals^n setminus {0}$, $v^T A v > 0$.
]

#definition(title: [Negative definite])[
  Let $A$ be a matrix. Then $A$ is negative definite iff for all $v in Reals^n setminus {0}$, $v^T A v < 0$.
]

*Positive semidefinite* and *negative semidefinite* are the same except that the determinant/eigenvalue/pivot/$v^T A v$ could also be 0.

#definition(title: [Principal minor])[
  The determinant of a submatrix of a matrix.
]

#definition(title: [Leading principal minor])[
  The $k$th-order leading principal minor is the determinant of the top left submatrix of a matrix, where the 1st-order leading principal minor is the determinant of the 1x1 matrix at its top left corner, the 2nd-order is the determinant of the 2x2 matrix at its top left corner, etc.
]

#theorem(title: [Equivalent conditions for positive definiteness])[
  Let $A$ be a matrix. Then $A$ is positive definite iff
  - All leading principal minors of $A$ are positive
  - All eigenvalues of $A$ are positive
  - All pivots of $A$ are positive
]

#theorem(title: [Equivalent conditions for negative definiteness])[
  Let $A$ be a matrix. Then $A$ is negative definite iff
  - The $k$th-order leading principal minor is negative if $k$ is odd and positive if $k$ is even
  - All eigenvalues of $A$ are negative
  - All pivots of $A$ are negative
  - $-A$ is positive definite
]

=== Local extrema, Second Derivative Test and Taylor series

#see[Colley [4.1], Brummet [16, 17, MVCWUP:75-80(Mar 13-14)]]

#definition(title: [Hessian matrix])[
  The Hessian matrix $H f$ of a function $f : X subset.eq Reals^n to Reals$ is the matrix of second-order partials
  $ [H f_(i j)] = [(partial^2 f)/(partial x_i partial x_j)] $

  If $X subset.eq Reals^2$, then
  $ H f = mat(f_(x x), f_(x y); f_(y x), f_(y y)) $
]

The *first-order Taylor polynomial* is just the linear approximation

$ T_1(vn(x)) = f(vn(a)) + grad f(vn(a)) dot (vn(x) - vn(a)) $

#definition(title: [Second-order Taylor polynomial])[
  The second degree Taylor polynomial for a function $f in Reals^n to Reals$ at point $vn(a)$ evaluated at point $vn(x)$, where $vn(h) := vn(x) - vn(a)$, is:
  $ T_2(vn(x)) &= f(vn(a)) + sum_(i=1)^n f_(x_i)(vn(a)) h_i + 1/2 sum_(i,j=1)^n f_(x_i x_j)(vn(a)) h_i h_j \
    &= f(vn(a)) + grad f(vn(a)) dot vn(h) + 1/2 vn(h)^T H f(vn(a)) vn(h) $
]

Higher-order Taylor polynomials are not very useful.

#theorem(title: [Second Derivative Test])[
  Let $X$ be an open subset of $Reals^n$ and $f : X to Reals$ whose 2nd-order and lower partials exist and are continuous on $X$ (f is of class $C^2$). Let $vn(a) in X$ be a critical point of $f$. Then
  - If the Hessian $H f(vn(a))$ is positive definite, then $f$ has a local minimum at $vn(a)$.
  - If the Hessian $H f(vn(a))$ is negative definite, then $f$ has a local maximum at $vn(a)$.
  - If $det H f(vn(a)) != 0$ but $H f(vn(a))$ is neither positive nor negative definite, then $f$ has a saddle point at $vn(a)$.

  Equivalently if $X subset.eq Reals^2$, let
  $ D := f_(x x)(vn(a)) f_(y y)(vn(a)) - (f_(x y)(vn(a)))^2 = det H f(vn(a)) $
  Then
  - If $D > 0$ and $f_(x x)(vn(a)) > 0$, then $f$ has a local minimum at $vn(a)$.
  - If $D > 0$ and $f_(x x)(vn(a)) < 0$, then $f$ has a local maximum at $vn(a)$.
  - If $D < 0$, then $f$ has a saddle point at $vn(a)$.
  - If $D = 0$ the test is inconclusive.

  (Note that if $f_(x x)(vn(a)) = 0$ then $D <= 0$.)
]

=== Lagrange multiplier

#theorem[
  If $f(vn(x)_0) = c$ is an extreme value (absolute max or min) of $f$ on $g$ (the constraint is ${ vn(x) : g(vn(x)) = k }$) and $grad g(vn(x)_0) != 0$, then at $vn(x)_0$, the level set ${ vn(x) : f(vn(x)) = c }$ is tangent to $g(vn(x)) = k$.

  Equivalently, if $f(vn(x)_0) = c$ is an extreme value (absolute max or min) of $f$ on $g$ and $grad g(vn(x)_0) != 0$, then $grad f(vn(x)_0) = lambda grad g(vn(x)_0)$, where $lambda in Reals$ is called the *Lagrange multiplier*.
]

== Integration

=== Double integrals

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
  $ integral.double_R f(x, y) dif A = integral_a^b integral_c^d f(x, y) dif y dif x = integral_c^d integral_a^b f(x, y) dif x dif y $
]

#theorem[
  If $f(x, y) = g(x) h(y)$ and $R = [a, b] times [c, d]$, then
  $ integral.double_R f(x, y) dif A = integral.double_R g(x) h(y) dif A = (integral_a^b g(x) dif x)(integral_c^d h(y) dif y) $
]

#theorem(title: [Type I integrals])[
  If $f : X subset.eq Reals^2 to Reals$ is defined on $D = { (x, y) : a <= x <= b, g_1(x) <= y <= g_2(x) }$, then
  $ integral.double_D f(x, y) dif A = integral_a^b integral_(g_1(x))^(g_2(x)) f(x, y) dif y dif x $
]

#theorem(title: [Type II integrals])[
  If $f : X subset.eq Reals^2 to Reals$ is defined on $D = { (x, y) : h_1(y) <= x <= h_2(x), c <= y <= d }$, then
  $ integral.double_D f(x, y) dif A = integral_c^d integral_(h_1(y))^(h_2(y)) f(x, y) dif x dif y $
]

#theorem(title: [Reversing the order of integration])[
  Sketch the bounds of the region of integration, then just redo the bounds from scratch.
]

#theorem(title: [Converting double integrals to polar])[
  $ integral_a^b integral_c^d f dif x dif y = integral_alpha^beta integral_gamma^delta f dot r dif r dif theta $

  $a, b, c, d, alpha, beta, gamma, delta$ may be constants or may depend on the variables. To find the new bounds sketch the bounds and redo the bounds.
]

#definition(title: [Triple integral])[
  The triple integral of $f$ over the region $R$ is
  $ integral.triple_R f dif A = lim_(n to infty) sum_((x_i^*, y_j^*, z_k^*) in R) f(x_i^*, y_j^*, z_k^*) Delta A $
  (choose $n$ points $(x_i^*, y_j^*, z_k^*)$ in $R$, then sum each $f(x_i^*, y_j^*, z_k^*) Delta A$)
]

=== General change of variables

#theorem(title: [General change of variables])[
  Given a function $f : Reals^n to Reals^m$ which takes in an argument in the coordinate system $X$, and $T_(X U) : Reals^n to Reals^n$ is a transformation from coordinates in $X$ to coordinates in $U$,
  $ integral dots.c integral_R f(vn(x)) dif x_1 dots dif x_n = integral dots.c integral_R f(T_(X U) (vn(u))) abs(det D T_(X U)^(-1)) dif u_1 dots dif u_n $

  where $abs(det D T_(X U)^(-1))$ is the absolute determinant of the Jacobian of $T_(X U)^(-1)$ (the transformation from coordinates in $U$ to coordinates in $X$), which is also denoted by
  $ abs((partial(x_1, dots, x_n))/(partial(u_1, dots, u_n))) $

  It can also be computed more easily by taking the inverse of $D T_(X U)$:
  $ abs(det D T_(X U)^(-1)) = abs(1/(det D T_(X U))) $
]

#example(title: [Cartesian to spherical])[
  Converting from Cartesian coordinates to spherical coordinates in $Reals^3$:
  $ vn(x, y, z) = T_(X P)^(-1) (vn(rho, phi, theta)) = vn(rho sin phi cos theta, rho sin phi sin theta, rho cos phi) $
  so then the absolute Jacobian determinant is
  $ abs(det T_(X P)^(-1)) = rho^2 sin phi $
]

== Vector fields

=== Vector fields

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

=== Conservative vector field

#definition(title: [Conservative vector field])[
  A vector field $vn(F)$ is conservative iff there exists $f : Reals^n to Reals$ such that $vn(F) = grad f$ at all points in $Reals^n$. Then $f$ is called the *potential function* for $F$.
]

*Note*: Sometimes in physics, the potential function is defined such that $vn(F) = - grad f$ -- for example, $vn(E) = grad V$ in E+M.

#lemma[
  A conservative vector field is irrotational.

  If a vector field is irrotational and is defined on a domain with no holes, then it is conservative.
]

=== Divergence and curl

#definition(title: [Del operator])[
  In $Reals^3$, del is defined by
  $ grad := vn((partial)/(partial x), (partial)/(partial y), (partial)/(partial z)) $

  In $Reals^n$, del is defined by
  $ grad = vn((partial)/(partial x_1), dots.v, (partial)/(partial x_n)) $

  Del is an operator; it takes in a function and outputs a function.
]

#definition(title: [Divergence])[
  Let $vn(F) : X subset.eq Reals^n to Reals^n$ be a differentiable vector field. Then the divergence of $vn(F)$ is the scalar field
  $ op("div") vn(F) = grad dot vn(F) = (partial F_1)/(partial x_1) + dots.c + (partial F_n)/(partial x_n) $
]

#lemma[
  If $vn(F)$ represents the flow rate of a fluid, then $op("div") vn(F)$ represents the net mass flow through each point in the domain of $vn(F)$:
  - If $op("div") vn(F) > 0$, then more fluid is flowing out than in.
  - If $op("div") vn(F) < 0$, then more fluid is flowing in than out.
  - If $op("div") vn(F) = 0$, then the same amount of fluid flows in as flows out. In this case, $vn(F)$ is considered *incompressible* and *solenoidal*.

  The divergence of a vector field represents how "outgoing" the field is at each point, and how source-like (if positive) or sink-like (if negative) each point is.
]

#definition(title: [Curl ($Reals^3$)])[
  Let $vn(F) : X subset.eq Reals^3 to Reals^3$ be a differentiable vector field on $Reals^3$. Then the curl of $vn(F)$ is the vector field
  $ op("curl") vn(F) = grad times vn(F) $
]

#definition(title: [Curl ($Reals^2$)])[
  Let $vn(F) : X subset.eq Reals^2 to Reals^2$ be a differentiable vector field on $Reals^2$. Then the curl of $vn(F)$ is the scalar field
  $ op("curl") vn(F) = (partial F_2)/(partial x) - (partial F_1)/(partial y) $

  This is equivalent to the magnitude of $grad times vn(F)$, where counterclockwise is positive and clockwise is negative (by right-hand rule).
]

#definition(title: [Irrotational])[
  If $grad times vn(F) = 0$ everywhere on the vector field $vn(F) : X subset.eq Reals^n to Reals^n$, then $vn(F)$ is considered *irrotational*.
]

#lemma[
  Let there exist an infinitesimally small sphere at the point $vn(x) in X$. Let $vn(F) : X subset.eq Reals^3 to Reals^3$ be a vector field that represents the velocity of a fluid at each point in $X$. Then $op("curl") vn(F)$ is the unique vector such that
  - The direction of $op("curl") vn(F)$ is along the axis of rotation of the sphere, following the right-hand rule.
  - The magnitude of $op("curl") vn(F)$ is the speed of the rotation of the sphere.
]

=== Line integrals

#definition(title: [Scalar line integral])[
  If $C$ is a smooth plane curve defined by $x = x(t), y = y(t), a <= t <= b$, then
  $ integral_C f(x, y) dif s := integral_a^b f(x(t), y(t)) sqrt(((d x)/(d t))^2 + ((d y)/(d t))^2) dif t $

  This generalizes to higher dimensions -- if $C$ is a smooth curve defined by $vn(x) = vn(x)(t), a <= t <= b$, where $x in Reals^n$, then
  $ integral_C f(vn(x)) dif s = integral_a^b f(vn(x)(t)) sqrt(((d x_1)/(d t))^2 + dots.c + ((d x_n)/(d t))^2) dif t $
]

#definition(title: [Line integral of a vector field along a smooth curve])[
  If $F$ is any continuous vector field defined on a smooth curve $C$ defined by $vn(r)(t), a <= t <= b$, then
  $ integral_C vn(F) dot dif vn(r) = integral_C vn(F) dot hat(T) dif s = integral_a^b vn(F)(vn(r)(t)) dot vn(r)'(t) dif t $

  It represents the work done by moving a particle along the curve $C$, if $F$ is a force field.
]

// MVCWUP - Apr 29

#definition(title: [Orientation-preserving reparamaterization])[
  Let $vn(x) : [a, b] to Reals^n$ be a piecewise $C^1$ path, and let $vn(F) : X subset Reals^n to Reals^n$ whose domain $X$ contains the image of $vn(x)$.

  If $vn(y) : [c, d] to Reals^n$ is any reparametrization of $vn(x)$, then
  - If $vn(y)$ is *orientation-preserving*, then $integral_y vn(F) dif s = integral_x vn(F) dif s$.
  - If $vn(y)$ is *orientation-reversing*, then $integral_y vn(F) dif s = 0 integral_x vn(F) dif s$.
]

#definition(title: [Path independence])[
  A vector field $vn(F)$ is path-independent iff for any two paths $C_1$ and $C_2$ which have the same start and end points,
  $ integral_(C_1) vn(F) dot dif vn(r) = integral_(C_2) vn(F) dot dif vn(r) $
]

#theorem(title: [Fundamental Theorem of Line Integrals])[
  Let $C$ be a smooth curve given by the function $vn(r)(t)$ defined on the interval $t in [a, b]$. Let $f$ be a differentiable function whose gradient $grad f$ is continuous on $C$. Then
  $ integral_C grad f dot dif vn(r) = f(vn(r)(b)) - f(vn(r)(a)) $

  In other words, the line integral of a conservative field along a curve is equal to the potential difference between its endpoints.

  This implies that the following statements are equivalent (each implies the others):
  - The vector field $vn(F)$ is conservative
  - The vector field $vn(F)$ is path-independent
  - $integral.cont_C vn(F) dot dif vn(r) = 0$ for every closed path $C$.
]

=== Green's Theorem

#theorem(title: [Green's Theorem])[
  Let $partial D$ be a positively oriented, piecewise smooth, simple closed curve in the $x y$-plane, and $D$ be the region bounded by $partial D$. If $P$ and $Q$ have continuous partial derivatives on an open region containing $D$, then
  $ integral.cont_(partial D) P dif x + Q dif y = integral.double_D ((partial Q)/(partial x) - (partial P)/(partial y)) dif A $
  Equivalently, if $vn(F) = x, y mapsto vn(P(x, y), Q(x, y))$, then
  $ integral.cont_(partial D) vn(F) dot dif vn(r) = integral.double_D op("curl") vn(F) dif A $

  In other words, the circulation of a vector field along a curve is the same as the sum of the curls within the region bounded by the curve.
]

#definition(title: [Circulation])[
  The circulation of the vector field $vn(F)$ around the curve $C$ is
  $ integral.cont_C vn(F) dot dif vn(r) $

  It measures how much $F$ aligns with the curve $C$.
]

== Surfaces

=== Parametric surfaces

#definition(title: [Parametric/parameterized surface])[
  Let $vn(X) : D subset.eq Reals^2 to Reals^3$ be a one-to-one function (except possibly at the boundary of $D$). Then the image of $X$ is called a parameterized surface.
]

#definition(title: [Normal vector to a parameterized surface])[
  Let $vn(X) = vn(u, v) mapsto vn(x(u,v), y(u,v), z(u,v))$ be a parameterization of a surface, and let $vn(u)$ be a vector in the domain of $vn(X)$. Then the tangent vector along the $u$-axis is $vn(X)_u (vn(u))$, where
  $ vn(X)_u = vn((partial x)/(partial u), (partial y)/(partial u), (partial z)/(partial u)) $
  and similarly the tangent vector along the $v$-axis is $vn(X)_v (vn(u))$.

  Then the normal vector to the parameterized surface at the point $vn(u)$ is
  $ vn(N) = vn(X)_u (vn(u)) times vn(X)_v (vn(v)) $
]

#definition(title: [Smooth])[
  A paramaterization $vn(X)$ of a surface is smooth at a point if its normal vector is not equal to 0 at that point.

  A surface is smooth at a point if there exists a paramaterization for that surface which is smooth at that point.

  Note that a smooth surface can have non-smooth paramaterizations.
]

=== Surface integrals

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

=== Stokes' Theorem

#definition(title: [Positive oriented boundary])[
  Given a surface $S$ whose boundary is the curve $C$, the positive orientation of the curve is such that if one were to walk along the curve in that direction, with the vector upwards from the top of their head parallel to the normal vectors of $S$, the surface would be to that person's left. Equivalently, you could choose a normal vector and use the right-hand rule (thumb is the normal vector and the positive orientation is given by the curl of the fingers).

  // #figure(
  //   image("content/mvc/images/positive-oriented-boundary.png", width: 50mm),
  // )
]

#theorem(title: [Stokes' Theorem])[
  Let $S$ be an oriented smooth surface, bounded by a curve $partial S$, composed of finitely many simple closed smooth differentiable ($C^1$) curves with positive orientation. Let $vn(F)$ be a differentiable ($C^1$) vector field whose domain includes $S$. Then
  $ integral.cont_(partial S) vn(F) dot dif vn(r) = integral.double_S grad times vn(F) dot dif vn(S) $

  In other words, the circulation of a vector field along a curve is the same as the sum of the curls within the surface bounded by the curve.
]

// TODO: Meaning of Curl
// curl is flux through infinitesimally small circle

=== Gauss's Theorem

#theorem(title: [Gauss's Theorem / Divergence theorem])[
  Let $D$ be a solid region in $Reals^3$, bounded by a surface $partial D$, composed of finitely many smooth closed surfaces with positive orientation. Let $vn(F)$ be a differentiable ($C^1$) vector field whose domain includes $D$. Then
  $ integral.surf_(partial D) vn(F) dot dif vn(S) = integral.triple_D grad dot F dif V $

  In other words, the flux of a vector field through a closed surface is the same as the sum of the divergences of the vector field through the region bounded by the surface.

  This follows from that
  - The ratio of flux to volume approaches the divergence as the volume becomes smaller.
  - If the region is partitioned into smaller regions, the flux of the region is equal to the sum of the flux of the smaller regions (since the flux of the boundary of the two regions cancels out).
]

// TODO: MVT for Integrals

// TODO: Meaning of Divergence
// Divergence is the flux through an infinitesimally small sphere