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

#let assert = math.tack.r

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

#definition(title: [Propositional equivalence])[
  Two propositions $p$ and $q$ are logically equivalent, denoted $p equiv q$, iff they have the same truth value.
]

#definition[
  $R$ is #defname[reflexive] iff $a R a$ for all $a in A$.

  $R$ is #defname[symmetric] iff $a R b iff b R a$.

  $R$ is #defname[transitive] iff $a R b, b R c implies a R c$.
]

#definition(title: [Equivalence relation])[
  A relation that is reflexive, symmetric, and transitive.
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
  The #defname[contrapositive] of $p to q$ is $not q to not p$. It is equivalent to the original statement:

  $ p to q equiv not q to not p $
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
  $lambda$ is a proposition iff $lambda$ satisfies any of the following conditions:
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

#corollary[
  - $True equiv not False$ and $False equiv not True$
  - $p equiv q <==> not p equiv not q$
  - For any $p, q, r, s$ s.t. $p equiv q$ and $r equiv s$:
    - $p and r equiv q and s$
    - $p or r equiv q or s$
    - $p to r equiv q to s$
    - $p <--> r equiv q <--> s$
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

#definition(title: [Turnstile symbol])[
  $assert phi$, where $phi$ is a predicate, means that we can prove $phi$ with what we currently know.

  $Gamma assert phi$ means that given that assumptions $Gamma$ are true, we can prove that $phi$ is true.
]

#axiom(title: [Deduction rule])[
  If by assuming $p$, we can prove $q$, then we can write $p to q$:
  $ (p assert q) assert (p to q). $
]

#axiom(title: [Modus ponens])[
  If we have $p to q$ and we know $p$ is true, then we can deduce $q$ is true:
  $ p, (p to q) assert q. $
]

#axiom(title: [Reductio ab absurdum])[
  If $not p$ leads to a contradiction, then $not p$ is absurd; thus $p$ is true:
  $ (not p assert q), (not p assert not q) assert p. $
]

#theorem(title: [Modus tollens])[
  If we have $p to q$ but also $not q$, then we can infer $not p$:
  $ not q, (p to q) assert not p. $
]

=== Syllogisms and other theorems

$
  #[*Hypothetical syllogism:*] &\
    (p to q), (q to r) &assert p to r \
  #[*Implication elimination:*] & #[(consolidation rule)] \
    (p to q) &assert (p assert q) \
  #[*Conjunction introduction:*] & #[(adjunction)] \
    p, q &assert p and q \
  #[*Conjunction elimination:*] & #[(simplification)] \
    p and q &assert p \
  #[*Disjunction introduction:*] & #[(proof by cases)] \
    p &assert p or q \
  #[*Disjunction elimination:*] & #[(explosion)]\
    (p to r), (q to r), (p or q) &assert r \
  #[*Constructive dilemma:*] &\
    (alpha to gamma), (beta to delta), (alpha or beta) &assert gamma or delta
$

= First-order logic

#see[#link("https://web.archive.org/web/20260206022606if_/https://cedre.tech/teaching/2024_spring/lecture-notes.pdf#page=34")[Cedre DM2], #link("https://cedre.tech/teaching/2026/spring/cs_173/resources/notes/cl00.pdf")[Cedre CL00], #link("https://cedre.tech/teaching/2026/spring/cs_173/resources/notes/cl01.pdf")[Cedre CL01]]

== Objects

#definition(title: [Universe of discourse])[
  The collection of all objects that we "care about" / we "discuss".
]

#definition(title: [Term])[
  A symbol that refers to an object in the universe of discourse.

  A term which refers to a specific object is a #defname[constant].
]

#definition(title: [Variable])[
  A #defname[variable] is a term that refers to a generic object, not one particular object.

  In order for a variable to be meaningful, it must be quantified (for example by a quantifier like $forall$ or $exists$) within some scope, i.e. a #defname[bound variable]. A variable which is not quantified is a #defname[free variable].
]

== Predicates

#definition(title: [Predicate])[
  Let $x_1, ..., x_n$ be variables. $phi(x_1, ..., x_n)$ is an #defname[$n$-ary predicate] iff replacing each of the $n$ variables by constants $t_1, ..., t_n$ results in a proposition $phi(t_1, ..., t_n)$ carrying a truth value.
]

== Quantification

#definition(title: [Universal quantification])[
  The #defname[universal quantification] of $x$ appearing in $phi$ is denoted

  $ forall x (phi(x, y_1, ..., y_n)). $

  It means that any constant replacing $x$ will satisfy $phi$.
]

#definition(title: [Existential quantification])[
  The #defname[existential quantification] of $x$ appearing in $phi$ is denoted

  $ exists x (phi(x, y_1, ..., y_n)). $

  It means that there exists some value of $x$ which satisfies $phi$.
]

#definition(title: [Unique existential quantification])[
  There exists a unique $x$ s.t. $phi(x)$.

  $ exists! x(phi(x)) := exists x (phi(x) and y (phi(y) to (y = x))). $
]

== Formulae

#definition(title: [Atomic formula])[
  A formula $phi$ is #defname[atomic] iff it satisfies one of the following:
  - $phi = True$ or $phi = False$.
  - $phi = psi(t_1, ..., t_n)$ where $psi$ is an $n$-ary predicate and $t_1, ..., t_n$ are terms.
]

#definition(title: [Well-formed formula])[
  A formula $lambda$ is #defname[well-formed] (is a #defname[wff]) iff it satisfies one of the following:
  - $lambda$ is an atomic formula.
  - $lambda = not phi$, where $phi$ is a wff.
  - $lambda = phi and psi$, where $phi$ and $psi$ are wff.
  - $lambda = phi or psi$, where $phi$ and $psi$ are wff.
  - $lambda = phi to psi$, where $phi$ and $psi$ are wff.
  - $lambda = phi <--> psi$, where $phi$ and $psi$ are wff.
  - $lambda = forall x(phi)$, where $phi$ is a wff.
  - $lambda = exists x(phi)$, where $phi$ is a wff.

  A well-formed formula with no free variables is called a #defname[sentence in the first-order logic].
]

== Rules of inference

#axiom(title: [Universal introduction])[
  If $phi(t)$ for an arbitrary term $t$, then $forall x (phi(x))$.

  Let $t$ be arbitrary. Then,
  $ phi(t) assert forall x (phi(x)). $
]

#axiom(title: [Universal elimination])[
  If $forall x(phi(x))$, then we can pick any $t$ and $phi(t)$ is true.

  Choose some $t$. Then,
  $ forall x(phi(x)) assert phi(t). $
]

#axiom(title: [Existential introduction])[
  If we know $phi(t)$ for a specific term $t$, then $exists x (phi(x))$.

  Choose some $t$. Then,
  $ phi(t) assert exists x (phi(x)). $
]

#axiom(title: [Existential elimination])[
  If we know $exists x (phi(x))$, then $phi(t)$ for some new $t$ that has not yet appeared.

  $ exists x (phi(x)) assert phi(t) $

  where $t$ comes out of the assertion.
]

== Useful theorems

#theorem(title: [Negation of quantifiers])[
  For any well-formed formula $phi$ with one free variable,
  $ not forall x(phi(x)) &equiv exists x(not phi(x)) \
  not exists x(phi(x)) &equiv forall x(not phi(x)). $
]

#theorem(title: [Quantifier shift])[
  For any well-formed formula $phi$ containing two free variables,
  $ forall x forall y (phi(x, y)) &equiv forall y forall x (phi(x, y)) \
  exists x exists y (phi(x, y)) &equiv exists y exists x (phi(x, y)). $

  This means that we can commute quantifiers when they are the same; however the universal and existential quantifiers don't necessarily commute with each other:
  $ exists x forall y (phi(x, y)) &assert forall y exists x (phi(x, y)) \
  forall x exists y (phi(x, y)) &assert.not exists y forall x (phi(x, y)). $
]

#theorem(title: [Distribution of quantifiers])[
  For any well-formed formulae $phi$ and $psi$, each containing exactly one free variable, we can distribute quantifiers as shown below:
  $ forall x (phi(x) and psi(x)) &equiv forall x (phi(x)) and forall x (psi(x)). \
  forall x(phi(x) or psi(x)) &equiv exists x(phi(x)) or exists x(psi(x)). $

  This means that universal quantifiers can be distributed over conjunctions, and existential quantifiers can be distributed over disjunctions. The opposite does not hold.
]
