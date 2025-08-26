#import "@local/ethan-standard-style:0.1.0": *
#show: ekactl-style.with(
  section-number: 3,
  title: "Sample formula sheet"
)

= Math

= Theorem environments

Taken from the #link("https://typst.app/universe/package/ctheorems/")[`ctheorem` docs].

#definition[
  A natural number is called a #highlight[_prime number_] if it is greater
  than 1 and cannot be written as the product of two smaller natural numbers.
]
#example[
  The numbers $2$, $3$, and $17$ are prime.
  @cor_largest_prime shows that this list is not exhaustive!
]

#theorem("Euclid")[
  There are infinitely many primes.
]
#proof[
  Suppose to the contrary that $p_1, p_2, dots, p_n$ is a finite enumeration
  of all primes. Set $P = p_1 p_2 dots p_n$. Since $P + 1$ is not in our list,
  it cannot be prime. Thus, some prime factor $p_j$ divides $P + 1$.  Since
  $p_j$ also divides $P$, it must divide the difference $(P + 1) - P = 1$, a
  contradiction.
]

#corollary[
  There is no largest prime number.
] <cor_largest_prime>
#corollary[
  There are infinitely many composite numbers.
]

#theorem[
  There are arbitrarily long stretches of composite numbers.
]
#proof[
  For any $n > 2$, consider $
    n! + 2, quad n! + 3, quad ..., quad n! + n #qedhere
  $
]

= Units

Taken from the #link("https://typst.app/universe/package/zero")[`zero` docs]:

#[
  #let kgm-s2 = zi.declare("kg m/s^2")
  #let inch = zi.declare("in")
  #let molar = zi.declare("M")

  - The current world record for the 100 metres is held by Usain Bolt with #zi.s[9.58]. 
  - The velocity of light is #zi.m-s[299792458].
  - A Newton is defined as #kgm-s2[1]. 
  - The unit of a frequency is #zi.Hz(). 
  - The Imperial unit of length is #inch().
  - The molarity of the solution is #molar[3].
]

= Chemical formulae

We use #link("https://typst.app/universe/package/whalogen/")[Whalogen].

$ #ce("HCl + H2O -> H3O+ + Cl-") $

