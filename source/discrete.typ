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

#let pmod(m) = $quad (mod med #m)$

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
  $ p xor q = p "XOR" q = p arrow.l.r.not q $
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

= Number theory

#see[#link("https://mfleck.cs.illinois.edu/building-blocks/version-1.4/number-theory.html")[Fleck 4], #link("https://web.archive.org/web/20260206022606if_/https://cedre.tech/teaching/2024_spring/lecture-notes.pdf#page=64")[Cedre DM5]]

== Divisibility and parity

#definition(title: [Divisibility])[
  For any $a, b in Integers$, #defname[$a$ divides $b$] iff $b$ is a multiple of $a$:
  $ a | b := (exists k in Integers)(b = k a) $

  We can also think about this as $a | b iff b/a$ is an integer, but this definition is usually more difficult to use in proofs, and requires introducing rational numbers.
]

#theorem(title: [Absolutely montonicity of divisibility])[
  Let $a, b in Integers$ with $b != 0$. Then, $a | b$ implies $abs(a) <= abs(b)$.
]

#theorem(title: [Divisibility is a partial order])[
  The divisibility relation on $Naturals$ has the following properties:
  - *Reflexive:* For all $a in Naturals$, $a | a$.
  - *Antisymmetric:* For all $a, b in Naturals$, if $a | b$ and $b | a$, then $a = b$.
  - *Transitive:* For all $a, b, c in Naturals$, if $a | b$ and $b | c$, then $a | c$.
]

#theorem[
  Let $n, a, b, x, y in Integers$ s.t. $n | x$ and $n | y$. Then, $n | a x + b y$.
]

#definition(title: [Parity])[
  Let $z in Integers$. $z$ is #defname[even] iff $2 | z$, and is #defname[odd] iff $2 | z - 1$. For every $z in Integers$, $z$ is even xor odd.
]

== Primality

#definition(title: [Primality])[
  $p in Naturals$ is #defname[prime] iff $p > 1$ and $p$ is minimally divisible, i.e. for all $n in Naturals$, $n | p$ implies $n = 1$ or $n = p$.

  Any natural number other than $1$ that is not prime is #defname[composite].
]

#theorem(title: [Fundamental theorem of arithmetic])[
  Let $n in Naturals$ s.t. $n >= 2$. Then, there exists a unique $k in Naturals$ and unique list $(p_0, a_0), ..., (p_k, a_k) in Naturals^2$ s.t. $p_0, ..., p_k$ are distinct prime numbers satisfying:

  $ n = product_(i=0)^k p_i^(alpha_i) = p_0^(alpha_0) p_1^(alpha_1) ... p_k^(alpha_k). $

  In short, for any natural number other than $2$, there exists a unique prime factorization of that number.
]

#theorem(title: [Euclid's Theorem])[
  There are infinitely many prime numbers.
]

== GCD and LCM

#definition(title: [GCD and LCM])[
  The greatest common divisor of two integers $a, b in Integers$ is the unique natural number $gcd(a, b)$ such that:
  - $gcd(a, b)$ is a common divisor of $a$ and $b$:
    - $gcd(a, b) | a$
    - $gcd(a, b) | b$
  - $gcd(a, b)$ is the greatest common divisor:
    - For all $z in Integers$, $z | a$ and $z | b$ implies $z | gcd(a, b)$.

  We use divisibility instead of $<=$ as our partial order, which gives us that $gcd(0, 0) = 0$.
  
  The least common multiple is defined dually: $lcm(a, b)$ is the unique natural number such that:
  - $lcm(a, b)$ is a common multiple of $a$ and $b$:
    - $a | lcm(a, b)$
    - $b | lcm(a, b)$
  - $lcm(a, b)$ is the least common multiple:
    - For all $z in Integers$, $a | z$ and $b | z$ implies $lcm(a, b) | z$.

  We can also find GCD and LCM over finite sets of more than 2 integers in a similar manner.
]

#definition(title: [Coprimality])[
  $x, y in Naturals$ are #defname[coprime] iff $gcd(x, y) = 1$.

  Given $cal(Z) subset.eq Integers$ and $k in Naturals - 2$, the numbers in $cal(Z)$ are #defname[$k$-wise relatively prime] iff $gcd(z_0, z_1, ..., z_(k - 1)) = 1$ for each choice of distinct $z_0, ... z_(k - 1) in cal(Z)$
]

#theorem[
  Given arbitrary integers $a, b in Integers$, $gcd(a, b) = 1$ iff for all $p in Naturals$, $p$ being prime implies that $p divides.not a$ or $p divides.not b$.
]

#lemma(title: [Euclid's division lemma])[
  If $a, b in Integers$ and $b != 0$, there exist unique $q, r in Integers$ satisfying
  $ a = q b + r "and" 0 <= r < abs(b). $

  We call $q$ the #defname[quotient] and $r$ the #defname[remainder].
]

#algorithm(title: [Euclidean division])[
  Given $a, b in Integers$, we compute their greatest common divisor as follows.

  $ gcd(a, b) := cases(
    a &"if" b = 0,
    gcd(b, a mod b) &"if" b != 0
  ) $

  Let $a mod b$ denote the integer $r$ s.t. there exists a unique $q in Integers$ satisfying $a = q b + r$ and $0 <= r < abs(b)$.
]

#theorem(title: [Bézout's identity])[
  For all $a, b in Integers$, there exists $x, y in Integers$ s.t. $a x + b y = gcd(a, b)$.
]

#theorem(title: [Euclid's lemma])[
  For any $a, b in Integers$ and any prime $p in Naturals$, if $p | a b$, then $p | a$ or $p | b$.
]

== Congruence mod $k$

#definition(title: [Congruence mod $k$])[
  For any $a, b in Integers$ and $k in Integers^+$, $a equiv b pmod(k)$ iff $k | (a - b)$.
]

#definition(title: [Integers mod $k$])[
  The set of all equivalence classes under $equiv pmod(k)$:
  $ [0]_(equiv pmod(k)), [1]_(equiv pmod(k)), ..., [k - 1]_(equiv pmod(k)) $
]

= Sets

== Zermelo set theory

#see[#link("https://web.archive.org/web/20260206022606if_/https://cedre.tech/teaching/2024_spring/lecture-notes.pdf#page=45")[Cedre DM3.2]]

#definition(title: [First-order theory])[
  A formal language built upon the first-order logic by establishing a universe of discourse, introducing predicate symbols, functional symbols, and/or constant symbols, and then writing down axioms which describe the basic truths.

  Functional symbols transform terms into other terms.
]

#definition(title: [Equality])[
  $ X = Y :iff X "and" Y "refer to the same object" $

  $=$ is an equivalence relation, so it is reflexive, symmetric, and transitive.
]

#definition(title: [Set roster notation])[
  Given finitely many terms $x_0, x_1, ..., x_(n - 1)$, we use ${x_0, x_1, ..., x_(n - 1)}$ to denote the set containing exacty the objects denoted by the given terms.

  For any $z$,
  $ z in {x_0, x_1, ..., x_(n - 1)} :iff (z = x_0) or (z = x_1) or dots.c or (z = x_(n - 1)). $
]

#definition(title: [Set builder notation])[
  We define ${x : phi(x)}$ to denote the set of all objects satisfying the predicate $phi$.

  $ z in {x : phi(x)} :iff phi(z). $
]

#definition(title: [Subset])[
  Given two sets $A$ and $B$, $A$ is a #defname[subset] of $B$, denoted $A subset.eq B$, when every element of $A$ is also an element of $B$.

  $ A subset.eq B :iff forall z(z in A implies z in B). $
]

#definition(title: [Inductive set])[
  A set $cal(I)$ is #defname[inductive] if $0 in cal(I)$ and for all $x$, $x in cal(I)$ implies $S(x) in cal(I)$, where $S$ is the successor function.
]

#axiom(title: [Infinity], number: 0)[
  There exists an inductive set $A$ such that for all $B$, if $B$ is inductive then $A subset.eq B$.

  $ exists A(A "is inductive" and forall B (B "is inductive" implies A subset.eq B)). $

  This set $A$ is the "smallest" inductive set, and is equivalent to the set of natural numbers $Naturals$.

  Equivalently: $Naturals$ exists.
]

#axiom(title: [Extensionality], number: 1)[
  $ forall A forall B ((A = B) iff forall z (z in A iff z in B)) $

  For all sets $A$ and $B$, $A = B$ iff for all objects $z$, $z in A iff z in B$.

  Thus, sets are equal iff they have the same elements.
]

#lemma[
  For all sets $A$ and $B$, $A = B$ iff $A subset.eq B$ and $B subset.eq A$.
]

#definition(title: [Empty set])[
  A set $A$ is #defname[empty] iff for all $x$, $x in.not A$. 

  We define the empty set, denoted $emptyset$, as
  $ emptyset := {z : z != z}. $

  The empty set is empty, and it is unique.
]

#lemma[
  All sets contain the empty set.
]

#theorem(title: [Set inclusion is a partial order])[
  Set inclusion is a partial order, i.e. it satisfies:
  - *Reflexive:* For all sets $A$, $A subset.eq A$.
  - *Antisymmetric:* For all sets $A$ and $B$, if $A subset.eq B$ and $B subset.eq A$, then $A = B$.
  - *Transitive:* For all sets $A$, $B$, and $z$, if $A subset.eq B$ and $B subset.eq z$, then $A subset.eq z$.
]

#axiom(title: [Pairing], number: 2)[
  $ forall A forall B exists z (z = {A, B}). $

  For all sets $A$ and $B$, the set ${A, B}$ exists.
]

#example(title: [Russell's paradox])[
  Consider the set 
  $ A := {x : p(x)} quad p(x) := x in.not x. $

  Is $A in A$? If $A in A$, then $p(A)$, therefore $A in.not A$. If $
  A in.not A$, then $not p(A)$, therefore $A in A$.
]

#axiom(title: [Schema of Separation], number: 3)[
  For any predicate $phi$ with at most one free variable,
  $ forall A exists B (B = {z : z in x and phi(z)}). $

  For every set $A$, its subset consisting of the elements of $A$ satisfying $phi$ exists.
]

#definition(title: [Power set])[
  Given a set $A$, its powerset is the set of all possible subsets of x:

  $ powerset(A) := {B: B subset.eq A}. $
]

#axiom(title: [Power], number: 4)[
  $ forall A exists powerset(A) $

  All sets have powersets.
]

#lemma[
  If $A$ is a set, $powerset(A)$ includes $emptyset$ and $A$.
]

#definition(title: [Union of two sets])[
  Given two sets $A$ and $B$, the #defname[union] is defined as
  $ A union B := {x : x in A or x in B}. $

  This is the set which contains all the elements of $A$ and all the elements of $B$, but no other elements.
]

#definition(title: [Union over a set])[
  Given a set $A$, the #defname[union over $A$], i.e. the iterated union over the elements of $A$, is
  $ union.big A = union.big_(B in A) B := {z : (exists C in A)(z in C)} $
]

#axiom(title: [Union], number: 5)[
  For all sets $A$, $union A$ exists.
]

#definition(title: [Intersection of two sets])[
  Given two sets $A$ and $B$, the #defname[union] is defined as
  $ A union B := {x : x in A and x in B}. $

  This set contains exactly the items shared by $A$ and $B$.
]

#definition(title: [Intersection over a set])[
  Given a set $A$, the #defname[intersection over $A$], i.e. the iterated intersection over the elements of $A$, is
  $ inter.big A = inter.big_(B in A) B := {z : forall C (C in A implies z in C)} $
]

#definition(title: [Difference between two sets])[
  Given two sets $A$ and $B$, the #defname[difference] between $A$ and $B$ is defined as
  $ A - B = A setminus B := {x : x in A and x in.not B}. $
]

#theorem[
  - For all sets $A$ and $B$, $A union B$ exists.
  - For all sets $A$ and $B$, $A inter B$ exists.
  - For all sets $A$ and $B$, $A - B$ exists.
]

#axiom(title: [Regularity], number: 6)[
  $ forall A (A != emptyset implies exists B (B in A and B inter A = emptyset)). $

  For all nonempty sets $A$, there exists $B in A$ s.t. $B inter A$ is empty.
]

#theorem[
  $ forall A (A in.not A). $
  All sets do not include themselves.
]

#theorem(title: [The universe does not exist])[
  There does not exist a "set of all sets", i.e.
  - There does not exist a set $U$ s.t. for all sets $A$, $A in U$.
  - $U := {A : A "is a set"}$ does not exist.
]

#definition[
  $ (forall x in X)(phi(x)) :&iff forall x (x in X implies phi(x)) \
  (exists x in X)(phi(x)) :&iff exists x (x in X and phi(x)) \
  z in {x in X : phi(x)} :&iff z in X and phi(z) \
  {x in X : phi(x)} :&= {x : x in X and phi(x)} $
]

== Cartesian product

#definition(title: [Ordered pair])[
  The #defname[ordered pair] whose first coordinate is $x$ and second coordinate is $y$ is defined as
  $ (x, y) := {{x}, {x, y}}. $

  This is, more specifically, the #defname[Kuratowski definition of the ordered pair].
]

#definition(title: [$k$-tuple])[
  The #defname[$k$-tuple] is defined as
  $ (x_1, x_2, x_3, ..., x_(k - 1)) := (x_1, (x_2, (x_3, dots.c(x_(k - 1), emptyset)))). $
]

#definition(title: [Cartesian product])[
  The #defname[Cartesian product] of two sets $A$ and $B$ is the set of all possible ordered pairs between them:

  $ A times B := {(a, b) : a in A and b in B}. $
]

== Random useful theorems

#theorem(title: [DeMorgan's Laws])[
  $ X - (A union B) &= (X - A) inter (X - B) \
  X - (A inter B) &= (X - A) union (X - B) $
]

#theorem(title: [Product rule])[
  $ abs(A times B) = abs(A) abs(B). $
]

= Relations and functions

== Relations

#see[#link("https://mfleck.cs.illinois.edu/building-blocks/version-1.4/relations.html")[Fleck 6]]

#definition(title: [Relation])[
  A #defname[relation] $R : A to B$ is any subset of $A times B$.

  $a R b$ means $(a, b) in R$.
]

#definition[
  $R$ is #defname[reflexive] iff $a R a$ for all $a in A$.

  $R$ is #defname[irreflexive] iff $not(a R a)$ for all $a in A$.

  $R$ is #defname[symmetric] iff $a R b iff b R a$.

  $R$ is #defname[antisymmetric] iff $a R b and b R a implies a = b$.

  $R$ is #defname[transitive] iff $a R b, b R c implies a R c$.
]

#definition(title: [Equivalence relation])[
  A relation that is reflexive, symmetric, and transitive.
]

#definition(title: [Equivalence class])[
  Let $R : A to B$ be an equivalence relation. Then the #defname[equivalence class] of $a in A$ is
  $ [a] = [a]_R := {b in A : a R b} $

  The set of all equivalence relations of $R$ in $A$ is called $A\/R$.
]

#definition(title: [Order])[
  A #defname[partial order] is a relation that is reflexive, antisymmetric, and transitive.
  
  A #defname[linear order] or #defname[total order] is a is a partial order $R$ in which every pair of elements are comparable.

  A #defname[strict partial order] is a relation that is irreflexive, antisymmetric, and transitive.
]

#theorem(title: [Relations can compose])[
  If $R : A to B$ and $S : B to C$, then $S compose R : A to C$ is a subset of $A times C$.
]

#warning-box[$R compose R^(-1)$ is not necessarily the identity map!]

#theorem[
  $ (S compose R)^(-1) &= R^(-1) compose S^(-1) \
  (T compose S) compose R &= T compose (S compose R) $
]

== Functions

#definition(title: [Function])[
  A #defname[function] (also called a #defname[map] or #defname[mapping]) is a relation $f : A to B$ where each $a in A$ appears as the first element (input) of an ordered pair $(a, b) = a f b$ exactly once.

  If $(a, b) in f$, we can also say $f(a) = b$. $b$ is the #defname[value] of $f$ at $a$, or the #defname[image] of $a$ under $f$.

  $A$ is the #defname[domain] and $B$ the #defname[codomain] of $f$.
]

#definition(title: [Injective])[
  A function $f$ is #defname[injective] or #defname[one-to-one] iff:
  - $f(a) = f(b) => a = b$, or equivalently
  - $a != b => f(a) != f(b)$
]

#definition(title: [Surjective])[
  A function $f : A to B$ is #defname[surjective] or #defname[onto] iff:
  - $f(A) = B$ (its image is its codomain), or equivalently
  - for every $b in B$ there exists $a in A$ s.t. $f(a) = b$
]

#definition(title: [Bijective])[
  A function is #defname[bijective] and has #defname[one-to-one correspondence] if it is both injective and surjective.
]

#theorem[
  A composition of two functions is a function. If both are sur/in/bijective, so is their composition.
]

#theorem[
  Strictly increasing functions in $Reals to Reals$ are bijective.
]

= Induction

== Least element principle

#definition(title: [Order on $Naturals$])[
  $ x < y :&iff x in y \
  x <= y :&iff (x < y) or (x = y) $
  
  $<=$ forms a total order on $Naturals$, and $<$ forms a strict total order on $Naturals$.
]

#theorem(title: [Least element property of $Naturals$])[
  For all nonempty subsets $M$ of the naturals, there exists $m in M$ s.t. for all $n in M$, $m <= n$.

  $m$ is then the minimum of $M$.
]

#theorem(title: [Weak induction])[
  For any wff $phi$ with at most one free variable, the following holds:
  $ (forall n in Naturals)(phi(n)) iff phi(0) and (forall k in Naturals)(phi(k) implies phi("succ"(k))). $
]

#theorem(title: [Strong induction])[
  For any wff $phi$ with at most one free variable, the following holds:
  $ & (forall n in Naturals)(phi(n)) iff phi(0) and (forall k in Naturals) \
  &quad ((phi(0) and phi(1) and dots.c and phi(k)) implies phi("succ"(k))). $

  Any proof using strong induction has an equivalent proof using weak induction.
]

== Primitive arithmetic operations on the naturals

#definition(title: [Addition])[
  $ n + 0 :&= n \
  n + "succ"(m) :&= "succ"(n + m) "if" m in Naturals $
]

#definition(title: [Multiplication])[
  $ n * 0 :&= n \
  n * "succ"(n) :&= (n * m) + n "if" m in Naturals $
]

#definition(title: [Exponentiation])[
  $ n^0 :&= 1 \
  n^("succ"(m)) :&= n^m * n "if" m in Naturals $
]

#definition(title: [Exponentiation])[
  $ n arrow.t arrow.t 0 :&= 1 \
  n arrow.t arrow.t "succ"(m) :&= n^(n arrow.t arrow.t m) "if" m in Naturals $
]

#definition(title: [Iterated addition])[
  Let $f : Naturals to Naturals$ be a sequence of natural numbers. Then,
  $ sum_(i = a)^b f(i) :&= 0 & "if" b < a \
  sum_(i = a)^a f(i) :&= f(a) & "if" b = a \
  sum_(i = a)^("succ"(b)) f(i) :&= (sum_(i = a)^b f(i)) + f("succ"(b)) & "if" b > a $
]

#definition(title: [Iterated addition])[
  Let $f : Naturals to Naturals$ be a sequence of natural numbers. Then,
  $ sum_(i = a)^b f(i) :&= 0 & "if" b < a \
  sum_(i = a)^a f(i) :&= f(a) & "if" b = a \
  sum_(i = a)^("succ"(b)) f(i) :&= (sum_(i = a)^b f(i)) + f("succ"(b)) & "if" b > a $
]

#definition(title: [Iterated multiplication])[
  Let $f : Naturals to Naturals$ be a sequence of natural numbers. Then,
  $ product_(i = a)^b f(i) :&= 0 & "if" b < a \
  product_(i = a)^a f(i) :&= f(a) & "if" b = a \
  product_(i = a)^("succ"(b)) f(i) :&= (product_(i = a)^b f(i)) * f("succ"(b)) & "if" b > a $
]

== Cardinality

#definition(title: [Relative cardinality])[
  $abs(X) <= abs(Y)$ iff there exists an injection $X to Y$. 
  
  $abs(X) >= abs(Y)$ iff $Y = emptyset$ or there exists a surjection $X to Y$.

  $abs(X) = abs(Y)$ iff there exists a bijective function $X to Y$.
]

#definition(title: [Left-inverse])[
  $f : X to Y$ is #defname[left-invertible] iff there exists $g : Y to X$ s.t. $g compose f = id_X$.

  Left-invertible implies monomorphism.
]

#definition(title: [Monomorphism])[
  $f : X to Y$ is a #defname[monomorphism], denoted $f : X arrow.r.hook Y$, iff for any set $Z$ and any pair of functions $g_1 : X to Z$ and $g_2 : X to Z$, we have $f compose g_1 = f compose g_2 implies g_1 = g_2$.
]

#definition(title: [Right-inverse])[
  $f : X to Y$ is #defname[right-invertible] iff there exists $g : Y to X$ s.t. $f compose g = id_Y$.

  Right-invertible implies epimorphism.
]

#definition(title: [Epimorphism])[
  $f : X to Y$ is a #defname[epimorphism], denoted $f : X arrow.r.twohead Y$, iff for any set $Z$ and any pair of functions $g_1 : X to Z$ and $g_2 : X to Z$, we have $f compose g_1 = f compose g_2 implies g_1 = g_2$.
]

#definition(title: [Isomorphism])[
  $f : X to Y$ is an #defname[isomorphism] iff there exists a function $g : Y to X$ s.t. $g compose f = id_X$ and $f compose g = id_Y$. If such a $g$ exists, it will be unique, and is denoted $f^(-1)$, the #defname[inverse] of $f$.
]

#axiom(number: 7, title: [Trichotomy of Cardinality])[
  For any sets $A$ and $B$, we have $abs(A) < abs(B)$ and $abs(A) > abs(B)$ or $abs(A) = abs(B)$.

  This is equivalent to the axiom of choice.
]

#theorem(title: [Cantor-Schröder-Bernstein])[
  For all sets $X$ and $Y$, $abs(X) <= abs(Y)$ and $abs(Y) <= abs(X)$ iff $abs(X) = abs(Y)$.
]

#theorem[
  Every injection has a surjective left-inverse, and is therefore a monomorphism.

  Every surjection has an injective right-inverse, and is therefore an epimorphism.

  Every bijection has a unique two-sided inverse, and is therefore an isomorphism.

  $<=$, $>=$, and $=$ behave as expected, with regards to cardinalities.
]

#theorem[
  $X subset.eq Y$ implies $abs(X) <= abs(Y)$.
]

#theorem(title: [Pigeonhole Principle])[
  For any sets $A$ and $B$:
  - If $abs(A) > abs(B)$, there are no injective functions $A to B$.
  - If $abs(A) < abs(B)$, there are no surjective functions $A to B$.

  If $A$ and $B$ are both finite, then for any function $f : A to B$, there exists $b in B$ s.t.
  $ abs({a in A : f(a) = b}) >= ceil(abs(A)/abs(B)) = floor((abs(A) - 1)/(abs(B))) + 1. $
]

== Finite combinatorics

#definition(title: [Finite])[
  A set $A$ is finite iff there exists $n in Naturals$ s.t. $abs(F) = abs(n)$.
]

#definition(title: [Cardinality of finite set])[
  The #defname[cardinality] of a finite set $A$, denoted $abs(A)$, is the number of elements in the set. Equivalently, it is the natural number $n$ that $A$ is in bijection with: $abs(A) = abs(n)$.
]

#lemma[
  - Every natural number is a finite set.
  - $abs({z in Naturals : 1 <= z <= n}) = abs(n)$ for all $n in Naturals$.
  - For any finite set $A$ and any set $B$, if $B subset.eq A$, then $B$ is finite.
  - If $A$ and $B$ are finite sets, then $abs(A union B) = abs(A) + abs(B) - abs(A inter B)$.
  - For any finite set $X$, $abs(powerset(X)) = 2^abs(X)$.
]

#theorem(title: [Inclusion-exclusion principle])[
  $ abs(A union B) = abs(A) + abs(B) - abs(A inter B). $
]

#definition(title: [Binomial coefficients])[
  For any $k, n in Naturals$, $binom(n, k)$ is the number of subsets of cardinality $k$ taken from a set of cardinality $n$:
  $ binom(n, k) := abs({A : A subset.eq n and abs(A) = k}). $
]

#lemma(title: [Recursive calculation of binomial coefficients])[
  For all $n, k in Naturals$:
  - $binom(n, 0) = 1 = binom(n, n)$
  - $binom(n, 1) = n$
  - $binom(n + 1, k + 1) = binom(n, k + 1) + binom(n, k)$.
]

#lemma[
  For all $n, k in Naturals$ s.t. $k <= n$,
  $ binom(n, k) = binom(n, n - k). $
]

#theorem(title: [Binomial theorem])[
  For any real numbers $x, y in Reals$ and any natural $n in Naturals$, 
  $ (x + y)^n = sum_(k = 0)^n binom(n, k) x^k y^(n - k). $
]

== Infinite combinatorics

#definition(title: [Infinity])[
  A set $I$ is #defname[infinite] iff it is not finite.
]

#theorem[
  - $Naturals$ is infinite.
  - $abs(Naturals) = abs(Naturals^+) = abs(Integers) = abs(Rationals) = abs(Naturals times Naturals)$.
]

#theorem[
  For any set $Y$ and infinite set $X$,
  - $card(X union Y) = max(abs(X), abs(Y))$.
  - $card(X times Y) = max(abs(X), abs(Y))$.
  - If $2 <= abs(Y) <= abs(X)$, then $abs({f : (f : X to Y)}) = abs({f : (f : X to {0, 1})}) = abs(powerset(X))$.
]

#definition(title: [Countability])[
  A set $A$ is #defname[countable] iff $abs(A) <= abs(Naturals)$, otherwise it is #defname[uncountable].

  A set $A$ is #defname[countably infinite] iff
  - it is countable and infinite, or equivalently
  - $abs(A) = abs(Naturals)$

  Thus, $Naturals$ is the smallest infinite set.
]

#theorem[
  - Every subset of $Naturals$ is countable.
  - Every finite set is countable.
  - The countable union of countable sets is countable.
]

#definition(title: [Dedekind infinity])[
  The set $X$ is #defname[Dedekind finite] iff for all sets $W subset.neq X$, $abs(W) < abs(X)$. This is equivalent to being finite.

  The set $X$ is #defname[Dedekind infinite] iff there exists a set $W subset.neq X$ s.t. $abs(W) = abs(X)$. This is equivalent to being infinite.
]

#theorem(title: [Cantor's theorem])[
  For any set $X$, $abs(X) < abs(powerset(X))$.
]

