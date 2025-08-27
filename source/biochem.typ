#import "@local/ethan-standard-style:0.1.0": *
#show: ekactl-style.with(
  section-number: 2,
  title: "Biochemistry"
)

#let pH = "pH"
#let pOH = "pOH"
#let pKa = $"p"K_a$

Note that when we use $log$ in this section, we mean $log_(10)$.

= pH and buffers

== pH and pOH

$[ce("H+")]$ is the molarity of #ce("H+") in whatever solution we're measuring the pH of.

$
    pH &= -log([ce("H+")]) & [ce("H+")] &= 10^{-pH} \
    pOH &= -log([ce("OH-")]) & [ce("OH-")] &= 10^{-pOH} \
    pH + pOH &= 14
$

== Strong acids and bases

The following are the strong acids to memorize:
- #ce("H2SO4") (sulfuric acid)
- #ce("HNO3") (nitric acid)
- #ce("HCl") (hydrochloric acid)

The following are the strong bases to memorize:
- #ce("NaOH") (sodium hydroxide)
- #ce("KOH") (potassium hydroxide)
- #ce("Ca(OH)2") (calcium hydroxide)

#definition[Dissociation of strong acids and bases][
  The reaction in which a strong acid or base breaks apart into a proton (#ce("H+")) (for a strong acid) or a hydroxide (#ce("OH-")) (for a strong base) and another ion.

  Strong acids and bases dissociate completely in water.
]

== Weak acids

#definition[Conjugate base][
  The non-proton product of an acid ionization reaction in which an acid loses its proton.
]

#definition[Ionization of a weak acid][
  The reaction in which part of a weak acid breaks apart into a proton and its conjugate base. The conjugate base is often written as #ce("A-").

  $
    ce("HA(aq) <=> H+(aq) + A-(aq)")
  $

  This often occurs in water. Note that only a small amount of most weak acids ionize.
]

#definition[Equilibrium constant for ionization of a weak acid][
  $
    K_a = ([ce("H+")][ce("A-")])/[ce("HA")]
  $

  The negative log of $K_a$ is called $pKa$:
  $
    pKa = - log K_a
  $
]

#theorem[Henderson-Hasselbalch equation][
  $
    pH &= pKa + log ([ce("A-")]/[ce("HA")]) \
    &= pKa + log (["conjugate base"]/["acid"])
  $
]

== Buffers

#definition[Buffer][
  A solution that can resist change in pH upon the addition of an acid or a base.
]

Buffers can be created using a weak acid and its conjugate base, or a weak base and its conjugate acid.
