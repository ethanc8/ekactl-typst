#import "@local/ethan-standard-style:0.1.0": *
#show: ekactl-style.with(
  section-number: 2,
  title: "Biochemistry"
)

#import "@preview/alchemist:0.1.8": *

#let pH = "pH"
#let pOH = "pOH"
#let pKa = $"p"K_a$

Note that when we use $log$ in this section, we mean $log_(10)$.

= pH and buffers

== pH and pOH

$[ce("H+")]$ is the molarity of #ce("H+") in whatever solution we're measuring the pH of.

$
    pH &= -log([ce("H+")]) & [ce("H+")] &= 10^(-pH) \
    pOH &= -log([ce("OH-")]) & [ce("OH-")] &= 10^(-pOH) \
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

#definition(title: [Dissociation of strong acids and bases])[
  The reaction in which a strong acid or base breaks apart into a proton (#ce("H+")) (for a strong acid) or a hydroxide (#ce("OH-")) (for a strong base) and another ion.

  Strong acids and bases dissociate completely in water.
]

== Protonation and ionization

#definition(title: "Protonation and ionization")[
  #defname[Protonation] is the gain of a proton.

  #defname[Ionization] is the loss of a proton.
]

== Weak acids

#definition(title: [Conjugate base])[
  The non-proton product of an acid ionization reaction in which an acid loses its proton.
]

#definition(title: [Ionization of a weak acid])[
  The reaction in which part of a weak acid breaks apart into a proton and its conjugate base. The conjugate base is often written as #ce("A-").

  $
    ce("HA(aq) <=> H+(aq) + A-(aq)")
  $

  This often occurs in water. Note that only a small amount of most weak acids ionize.
]

#definition(title: [Equilibrium constant for ionization of a weak acid])[
  $
    K_a = ([ce("H+")][ce("A-")])/[ce("HA")]
  $

  The negative log of $K_a$ is called $pKa$:
  $
    pKa = - log K_a
  $
]

Stronger acids have higher $K_a$ and lower $pKa$.

The following equation is easily derived from taking the log of both sides of the definition of $K_a$ and rearranging.

#theorem(title: [Henderson-Hasselbalch equation])[
  $
    pH &= pKa + log ([ce("A-")]/[ce("HA")]) \
    &= pKa + log (["conjugate base"]/["acid"])
  $
]

== Buffers

#definition(title: [Buffer])[
  A solution that can resist change in pH upon the addition of an acid or a base.
]

Buffers can be created using a weak acid and its conjugate base, or a weak base and its conjugate acid.

=== Behavior of weak acid-conjugate base buffers



=== Bicarbonate buffer system

$ #ce("CO2 + H2O <=> H2CO3 <=> H+ + HCO3^-") $

= Amino acids


== Proteinogenic amino acids

#figure(
  image("ProteinogenicAminoAcids.svg")
)

== Types of amino acids

#definition(title: [Neutral nonpolar amino acid])[
  An amino acid whose side chain contains mostly hydrocarbons. These are also called hydrophobic amino acids.

  *Aromatic amino acids*: Phenylalanine, tryptophan

  *Aliphatic amino acids:* Glycine, alanine, valine, leucine, isoleucine, proline, methionone, cysteine
]

#definition(title: [Neutral polar amino acid])[
  These are also called hydrophilic amino acids.

  *Examples:* Serine, threonine, tyrosine, asparagine, glutamine
]

#definition(title: [Acidic amino acid])[
  An amino acid whose side chain is negatively charged at $pH approx 7$. All standard acidic amino acids have carboxylate groups in their side chains.

  *Examples:* Aspartic acid, glutamic acid
]

#definition(title: [Basic amino acid])[
  An amino acid whose side chain is positively charged at $pH approx 7$. 

  *Examples:* Lysine, histidine, arginine
]

== Charges and titration of amino acids


Amino acid at low pH:

#skeletize({
  fragment("H")
  single()
  fragment("N")
  branch({
  single(angle:2)
  fragment("H")
  })
  branch({
  single(angle:-2)
  fragment("H")
  })
  single()
  fragment($"C"_alpha$)
  branch({
  single(angle:2)
  fragment("H")
  })
  branch({
  single(angle:-2)
  fragment("R")
  })
  single()
  fragment("C")
  branch({
  double(angle:1)
  fragment("O", lewis: (
    lewis-double(angle: 135deg),
    lewis-double(angle: 315deg),
  ))
  })
  branch({
  single(angle:-1)
  fragment("O", lewis: (
    lewis-double(angle: 60deg),
    lewis-double(angle: 240deg),
  ))
  single(angle:0)
  fragment("H")
  })
  
})

As pH increases, first #ce("COOH") loses a proton (becoming #ce("COO-")), and then #ce("NH3^+") loses a proton (becoming #ce("NH2")). If the amino acid is acidic or basic, at some pH it will also lose a proton from its side chain.

#figure(
  image("Titration_Curves_of_20_Amino_Acids_Organized_by_Side_Chain.png")
)

#definition(title: [Isoelectric point])[
  The #pH at which the amino acid has no net charge.

  It is also denoted *pI*. 
]

#definition(title: [Zwitterion])[
  The form of an amino acid which has no net charge.
]

#lemma[
  Of the following $pKa$s:
  - The $pKa$ of the amino group (#ce("NH3^+ <=> NH2"))
  - The $pKa$ of the carboxyl group (#ce("COO- <=> COOH"))
  - The $pKa$ of the side chain
  The isoelectric point is:
  - For acidic (positive) amino acids, the mean of the two lowest $pKa$s
  - For basic (negative) amino acids, the mean of the two highest $pKa$s
  - For nonpolar and polar amino acids, the mean of the $pKa$ of the amino group and the $pKa$ of the carboxyl group (the only two $pKa$s)
]

#theorem[
  $ "Formal charge" = "valence electrons" - ("dots" + "bonds") $
]

== Skeletal drawing

Carbons are not shown, and hydrogens bonded to carbons are not shown.

== Redox

#definition(title: [Oxidation and reduction])[
  #defname[Oxidation] is a process in which a substance loses electrons.

  #defname[Reduction] is a process in which a substance gains electrons.

  Oxidation and reduction must occur together.
]

#definition(title: [Oxidation state])[
  The hypothetical charge of an atom if all of its bonds to other atoms were fully ionic.

  In covalent bonds, we assign the electrons to the more electronegative atom.
]

#lemma[
  In carbon-hydrogen bonds, the electron is assigned to the carbon.

  In carbon-oxygen bonds, the electron is assigned to the oxygen.

  In carbon-carbon bonds, the electrons are shared equally.
]

#example[
The following are half-reactions; the top is a reduction and the bottom is an oxidation.
$ #ce("Cu^2+ + 2e- -> Cu") #h(0.5cm) "(reduction)" \
  #ce("Zn -> Zn^2+ + 2e-") #h(0.5cm) "(oxidation)" $

The redox reaction is obtained by adding the half reactions and simplifying:
$ #ce("Cu^2+ + 2e- + Zn") &--> #ce("Cu + Zn^2+ + 2e^-") \
  #ce("Cu^2+ + Zn") &--> #ce("Cu + Zn^2+") $

]

== Protein structure

#definition[
  #defname[Primary structure] is the order of the amino acids.

  #defname[Secondary structure] is the $alpha$-helices and $beta$-pleated sheets, formed by hydrogen bonds between the peptide bonds.

  #defname[Tertiary structure] is the overall shape of each polypeptide, which is determined by side-chain characteristics such as:
  - Nonpolar (hydrophobic) amino acids going towards the center
  - Disulfide bonds
    - Disulfide bonds cannot be broken without a reducing agent
  - Salt bridges (ionic bonds)
  - Hydrogen bonds on the side chains

  #defname[Quaternary structure] is multiple polypeptide chains together, held together by the same forces that create tertiary structure.
]

== Thin layer chromatography, polarity

#lemma[
  For amino acids in the same group (same charge and polar/nonpolar), longer and bulkier hydrocarbon side chains increase hydrophobicity and nonpolarity.

  Thus, within the same group, one can count the number of carbons; more carbons means more nonpolar.
]

#theorem(title: [Beer-Lambert law])[
  The absorbance of light passing through an object, where the path the light takes through the object has length $l$, with molar absorptivity $epsilon$ and concentration $c$ is given by
  $ A = epsilon l c $
]


