#import "@local/ethan-standard-style:0.1.0": *
#show: ekactl-style.with(
  section-number: 5,
  title: "Java"
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

= Basic reflection

#procedure(title: [Enumerating methods of class])[
	```java
	Class clazz = String.class; // by class name
	Class clazz = instance.getClass(); // get from an instance 

	for(java.lang.reflect.Method m : clazz.getMethods()) {
		System.out.println(m);
	}
	```
]

= Common packages

- `java.util` — collections (`List`, `Map`, `Set`, `ArrayList`, `HashMap`, `Scanner`, `Random`, etc.)
- `java.io` — file/stream I/O (`File`, `BufferedReader`, `IOException`)
- `java.lang` — core classes, *auto-imported already* (`String`, `Object`, `Math`, `Integer`, etc. — no import needed)
- `java.lang.reflect` — reflection (`Method`, `Field`, `Modifier`)
- `java.time` — dates/times (`LocalDate`, `LocalDateTime`, `Duration`)
- `java.util.stream` — streams (`Stream`, `Collectors`)
- `java.util.concurrent` — threading utilities

= Footguns

- `==` tests pointer equality, not value equality, if the arguments are objects
	- Use `equals` for value equality on common classes
- Similarly, don't use `<`, `>`, `<=`, `>=` on objects
	- Use `compareTo`, which returns positive value if LHS > RHS, negative value if LHS < RHS, and 0 if equal
