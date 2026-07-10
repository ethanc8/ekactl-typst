#import "@local/ethan-standard-style:0.1.0": *
#show: ekactl-style.with(
  section-number: 5,
  title: "Discrete mathematics"
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

#let True = math.tack.b
#let False = math.tack.t

#let Riemann = $cal(R)$

#let card = [card]

#let int = math.integral

#set math.vec(delim: "[")

#let infty = math.infinity

#let vn = math.arrow // vec name

= Language

#definition(title: [Semantics])[
  The meaning of a sequence of symbols.
]

#definition(title: [Syntax])[
  The grammatical rules for composing symbols into valid sentences.
]

#definition(title: [Variable])[
  A symbol that stands in place for an object that has not been determined yet.
]

A name can be assigned to a particular object using $:=$.

#definition(title: [Sentence])[
  A sentence is the expression of an idea in accordance of the syntax and grammar of a given language.

  A statment is #defname[atomic] if it cannot be broken down into smaller components while complying with the syntax and grammar.

  - *Declarative:* Describes something. Usually, it describes a #defname[subject] and a property, called #defname[predicate], that the subject has.
  - *Interrogative:* Asks a non-rhetorical question.
  - *Imperative:* Command or request.
]

In math, we are concerned with declarative sentences about mathematical objects.

== Church-Turing thesis

#definition(title: [Computable])[
  A function is #defname[computable] if any of the following equivalent things are true:
  - It is expressible as a general recursive process.
  - It is a term in the $lambda$-calculus.
  - It can be described by a Turing machine.
]

#axiom(title: [Church-Turing Thesis])[
  Our intuitive definition of "computable" (which Turing calls "effectively calculable") is equivalent to the above definition.
]

= Zeroth-order logic

== Truth values

#see[Cedre DM1.1]

#definition(title: [Truth value])[
  There are only two truth values:
  - $True$ "true"
  - $False$ "false"
]

#definition(title: [Logical equivalence of propositions])[
  Two propositions $p$ and $q$ are logically equivalent, denoted $p equiv q$, iff they have the same truth value.
]

#theorem[
  Logical equivalence is an equivalence relation.
]

#axiom(title: [Principle of Bivalence])[
  Sentences expressing truth values are either true or false, but not both.
]

#definition(title: [Proposition (informal definition)])[
  A statement which is either true or false, i.e. a statement expressing a truth value.
]

== Logical connectives

#see[Fleck 2.2\~2.9] \
#see[Cedre DM1.2, CL00]

#definition(title: [Negation])[
  $ not True = False \
  not False = True $
]

#definition(title: [Logical dual])[
  Logical connectives $f$ and $g$ are logical duals iff $not f = g$ and $not g = f$ on all possible inputs.
]

#definition(title: [Conjunction, disjunction])[
  - *Conjunction:* $p and q = p "AND" q$
  - *Disjunction:* $p or q = p "OR" q$ (inclusive or)

  Conjunction and disjunction are dual.
]

#definition(title: [Conditional])[
  $p to q$ means "if $p$, then $q$". $p$ is the #defname[antecedent] and $q$ is the #defname[consequent].

  If $p$ and $q$ are propositional formulae: $p to q$ t is true iff every time $p$ is satisfied, then $q$ is satisfied. 

  If $p$ and $q$ are propositions: it is false iff $p$ is true and $q$ is false.

  *Warning:* If $p$ is always false, then $p to q$ is always true regardless if $q$ is false! Also, there need not be any causal relationship between $p$ and $q$.
]

#definition(title: [Converse])[
  The #defname[converse] of $p to q$ is $q to p$. These are not equivalent.
]

#definition(title: [Contrapositive])[
  The #defname[contrapositive] of $p to q$ is $not q to not p$. It is equivalent to the original statement.
]

#definition(title: [Biconditional])[
  $ p <--> q = p "iff" q \
  p <--> q ==> (p to q) and (q to p) $
]

#definition(title: [Exclusive disjunction])[
  $ p xor q = p "XOR" q = p <-->.not q $
]

#table(
  columns: 8,
  table.header(
    $p$, $q$, $not p$, $p and q$, $p or q$, $p xor q$, $p to q$, $p <--> q$
  ),
  True, True, False, True, True, False, True, True,
  True, False, False, False, True, True, False, False,
  False, True, True, False, True, True, True, False,
  False, False, True, False, False, False, True, True
)

#definition(title: [Proposition])[
  $lambda$ is a proposition iff $lambda$ satisfies the following recurrence:
  - $lambda = True$ or $lambda = False$.
  - $lambda = not phi$, where $phi$ is a proposition.
  - $lambda = phi and psi$, where $phi$ and $psi$ are propositions.
  - $lambda = phi or psi$, where $phi$ and $psi$ are propositions.
  - $lambda = phi to psi$, where $phi$ and $psi$ are propositions.
  - $lambda = phi <--> psi$, where $phi$ and $psi$ are propositions.

  We use this definition inductively, by first establishing that $True$ and $False$ are propositions, and then using the connectives to compose larger and larger propositions. Alternatively, we use this definition recursively to determine that statements are propositions by recursively decomposing them.
]

== Propositional formulae

#see[Cedre DM1.2]

#definition(title: [Propositional formula])[
  An expression that evaluates as a proposition when all of its variables are themselves replaced by propositions.
]

#definition(title: [Logical equivalence and nonequivalence])[
  Let $phi$ and $psi$ be propositional formulae both consisting of the same variables $p_1, ... p_n$. $phi equiv psi$ iff every assignment of truth values to those variables produces the same truth value.
]

#theorem[
  Computing a truth table to check if two propositional formulae of $n$ variables are equivalent requires $2^n$ rows.
]

Thus, we want to prove that the two expressions are equivalent, rather than brute-forcing them.

== Propositional logic

#see[Cedre DM1.3]
#see[Fleck 2.2\~2.9]

#axiom(title: [Axioms of classical logic])[
  The following are the axioms of #defname[Boolean algebra], and they have two equivalent forms:
  #table(
    columns: 3,
    [*Identity*], $True and p equiv p$, $False or p equiv p$,
    [*Complement*], $not p and p equiv False$, $not p or p equiv True$,
    [*Commutativity*], $p and q equiv q and p$, $p or q equiv q or p$,
    [*Associativity*], $p and (q and r) equiv (p and q) and r$, $p or (q or r) equiv (p or q) or r$,
    [*Distributivity*], $p and (q or r) equiv (p and q) or (p and r)$
  )

  We also have the following two axioms:
  - *Conditional disintegration:* $p to q equiv not p or q$
  - *Biconditional disintegration:* $p <--> equiv (p to q) and (q to p)$
]

#theorem(title: [Uniqueness of complements])[
  For any $p$ and $q$, if $p and q equiv False$ and $p or q equiv True$, then $not p equiv q$.
]

#theorem(title: [Idempotence])[
  For any proposition $p$, $p and p equiv p$ and $p or p equiv p$.
]

#theorem(title: [Domination])[
  For any proposition $p$, $True or p equiv True$ and $False and p equiv False$.
]

#theorem(title: [De Morgan's Laws])[
  - $not(p and q) equiv not p or not q$
  - $not(p or q) equiv not p and not q$
]

#theorem(title: [Negation equivalences])[
  - $not(not p) equiv p$
  - $not(p to q) equiv p and not q$
]

== Rules of inference

== Predicates and variables
