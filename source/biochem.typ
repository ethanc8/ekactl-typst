#import "@local/ethan-standard-style:0.1.0": *
#show: ekactl-style.with(
  section-number: 2,
  title: "Biochemistry"
)

#import "@preview/xarrow:0.3.1": xarrow

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
  #defname[Oxidation] is a process in which a substance loses electrons (or loses hydrogen).

  #defname[Reduction] is a process in which a substance gains electrons (or gains hydrogen).

  Oxidation and reduction must occur together.
]

#definition(title: [Oxidation state])[
  The hypothetical charge of an atom if all of its bonds to other atoms were fully ionic.

  In covalent bonds, we assign the electrons to the more electronegative atom.

  For a carbon, it is more oxidized if it has more bonds to oxygen. If a carbon has four bonds to oxygen it is the most oxidized possible.
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

#definition(title: [Hydrogen bond])[
  An intermolecular force between a hydrogen bonded to N, O, or F and a lone pair.
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

// TODO

= Enzymes

#definition(title: [Catalyst])[
  A substance that increases the rate of a chemical reaction and is not consumed by the reaction.
]

#definition(title: [Enzyme])[
  A biological macromolecule that is a catalyst.
]

#definition(title: [Substrate])[
  The reactant in an enzyme-catalyzed reaction.

  The substrate binds to the enzyme at the #defname[active site].
]

== Cofactors

#definition(title: [Cofactor])[
  Something that the enzyme needs to bind to in order to work.
]

#definition(title: [Coenzyme])[
  A cofactor which is an organic molecule, loosely bound to the enzyme.
]

#definition(title: [Prosthetic group])[
  A cofactor tightly bound to the enzyme, which stays permanently attached.
]

#definition(title: [Holoenzyme])[
  The enzyme with all of its cofactors.
]

#definition(title: [Apoenzyme])[
  The enzyme without its cofactors.
]

== Types of enzymes

#definition(title: [Oxidoreductase])[
  Catalyzes redox reactions.
]

#definition(title: [Transferase])[
  Catalyzes the transfer of a functional group from one molecule to another.
]

#definition(title: [Hydrolase])[
  Catalyzes hydrolysis (breaking bonds by reacting with water)
]

#definition(title: [Lyase])[
  Catalyzes the breaking of bonds without water nor oxidation
]

#definition(title: [Isomerase])[
  Catalyzes the rearrangement of the atoms in the molecule.
]

#definition(title: [Ligase])[
  Catalyzes the joining of molecules.
]

== Chemical reaction kinetics

#definition(title: [Rate])[
  The #defname[rate] or #defname[velocity] of a chemical reaction with one product is the change in concentration of the product over the change in time.

  Given a balanced chemical reaction with two reactants and two products:
  $ #ce("$a$A + $b$B -> $p$P + $q$Q") $

  #let dt = $d t$

  the rate is defined as:
  $ v = -1/a (d"[A]")/dt = -1/b (d"[B]")/dt = 1/p (d"[P]")/dt = 1/q (d"Q")/dt $
]

#definition(title: [Rate constant, rate equation])[
  The #defname[rate constant] $k$ of a reaction is inherent to the reaction and is related to its speed.

  Assume a reaction #ce("A -> B").

  A zero-order reaction has a constant rate:
  $ v = k $

  A first-order reaction has a linearly increasing rate:
  $ v = k"[A]" $

  A second-order reaction has a quadratically increasing rate:
  $ v = k"[A]"^2 $ 
]

== Enzyme kinetics

#definition(title: [Enzyme-catalyzed reaction])[
  A reaction:

  #ce("E + S <->[$k_1$][$k_3$] ES ->[$k_2$] E + P")

  $"E"$ represents the free enzyme, $"E"_"T"$ represents the total enzyme, $"S"$ represents the substrate, and $"P"$ represents the product.
]

#definition(title: [Michaelis constant])[
  The #defname[Michaelis constant] is defined as:
  $ K_m := (k_2 + k_3)/(k_1) $

  A low $K_m$ causes a quick reaction, while a high $K_m$ causes a slower reaction.
]

#definition(title: [$K_"cat"$])[
  $ k_"cat" := (v_"max")/["E"] $
]

$k_"cat"$ and $K_m$ are both inherent to each enzyme, and are invariant with respect to concentration, etc.

$(k_"cat")/(K_m)$ is the best measure of enzyme efficiency.

#theorem(title: [Michaelis-Menton equation])[
  The maximum velocity of an enzyme-catalyzed reaction is
  $ v_max = k_2 ["E"_"T"] $

  The velocity of an enzyme-catalyzed reaction is given by the #defname[Michaelis-Menton equation]:
  $ v = (v_max "[S]")/(K_m + "[S]") $

  The equivalent, linear #defname[Lineweaver-Burk equation] is:
  $ 1/v = (K_m)/(v_max "[S]") + 1/v_max $

  Note also that the $x$-intercept of $1/"[S]"$ is equal to $-1/K_m$.
]

== Enzyme regulation

There are three types of enzyme regulation:
- genetic regulation
- covalent modification (phosphorylation)
- allosteric regulation

// TODO

== Enzyme inhibition


#definition(title: [Phosphorylation])[
  A type of #defname[covalent modification] where the inactive enzyme can be activated by adding a phosphate group and deactivated by removing a phosphate group.
]

#definition(title: [Allosteric regulation])[
  
]

=== Irreversible inhibitors

#definition(title: [Irreversible inhibitor])[
  The inhibitor permanently covalently-bonds to the enzyme.
]


=== Reversible inhibitors

#definition(title: [Competitive inhibition])[
  The inhibitor pretends to be the substrate and binds to the active site:
  #image("image.png")

  #image("image-2.png")

  $v_max$ does not change, since at high substrate concentrations the substrate will outcompete the inhibitor.

  The effective $K_m$ increases since at low substrate concentrations the inhibitor outcompetes the substrate, so the inactive substrates have no enzyme affinity.

  #image("image-1.png")
]

#definition(title: [Uncompetitive inhibition])[
  The inhibitor binds to some inhibition site on the enzyme, but the inhibition site can only be bound to when the enzyme has already bound a substrate:
  
  #image("image-4.png")

  Since ES only forms under high substrate concentration, and once inhibited cannot form product, it lowers the $v_max$. 

  The $K_m$ is reduced because the ES-I complex reduces the concentration of the ES complex, which causes a shift to form more ES. This results in less free enzyme, so the remaining enzyme has a greater affinity.

  #image("image-5.png")
]

#definition(title: [Noncompetitive (mixed) inhibition])[
  The inhibitor can inhibit either the enzyme or the substrate, and the inhibited enzyme can still bind to the substrate:
  #image("image-6.png")

  $v_max$ is reduced since at high substrate concentrations, still a lot of the enzyme is inhibited. $K_m$ does not change since the active enzymes still have the same $K_m$:
  #image("image-7.png")
]

// noncompetitive means mixed

// TODO

= Metabolism

#definition(title: [Catabolic pathway])[
  A pathway that releases energy by breaking down complex molecules into simpler compounds.
]

#definition(title: [Anabolic pathway])[
  A pathway that consumes energy to build complex molecules from simpler compounds.
]

#axiom(title: [First law of thermodynamics])[
  Energy can be transferred and transformed, but not created nor destroyed.
]

#axiom(title: [Second law of thermodynamics])[
  Every energy transformation increases the entropy of the universe.
]

#definition(title: [Spontaneous])[
  A spontaneous process can occur without adding energy to the system. A nonspontaneous process requires energy.
]

#definition(title: [Free energy])[
  #defname[Free energy], $G$, is the portion of a system's energy available to perform work when the temperature throughout the system is uniform.
]

#theorem[
  The (Gibbs) free energy $G$ in a system is related to the total energy/enthalpy $H$, entropy $S$, and temperature $T$ by:
  $ Delta G = Delta H - T Delta S $

  In order for a system to be spontaneous, $Delta G$ must be negative; the system must either give up energy (decrese $H$) or give up order (increase $S$).
]

#definition(title: [Exergonic reaction])[
  A reaction that net releases free energy (and thus has negative $Delta G$).
]

#definition(title: [Endergonic reaction])[
  A reaction that requires an input of energy (and thus has positive $Delta G$).
]

== Adenosine triphosphate

ATP can provide the energy needed for a nonspontaneous reaction to become spontaneous.

It is composed of the nitrogenous base adenine, the surgar ribose, and a chain of three phosphate groups.

#image("image-9.png")

The hydrolysis of ATP releases 7.3 kcal/mol ATP:

$ #ce("ATP + H_2O ->") "P"_i #ce("+ ADP") $

== Carbohydrates

#definition(title: [Carbohydrate])[
  A molecule of the form
  $ "C"_n ("H"_2 "O")_n  $

  Types of carbohydrates:
  - monosaccharides (sugar monomers)
  - oligosaccharides (di-, trisaccharides, etc)
  - polysaccharides (starch)
  - cellulose
]

#definition(title: [Glucose])[
  The most abundant monosaccharide in the body, which is part of every disaccharide.
]

#definition(title: [Starch])[
  A polysaccharide with α-glycosidic bonds.

  #image("image-14.png")

  Starch is the energy reserve of plants, used to store glucose when it is not needed.
]

#definition(title: [Glycogen])[
  A highly branched polysaccharide, the energy reserve of animals.
]

#definition(title: [Cellulose])[
  A polysaccharide with β-glycosidic bonds.

  #image("image-15.png")
]

=== Carbohydrate metabolism

#definition(title: [Amylase])[
  An enzyme that catalyzes the hydrolysis of starch into sugars.

  Example:
  $ #ce("starch <=>[β amylase][H2O] maltose") $
]

#definition(title: [α-glucosidase])[
  An enzyme that catalyzes the hydrolysis of oligosaccharides into sugars.

  Example:
  $ #ce("maltose <=>[α glucosidase][H2O] glucose") $
]

#image("image-16.png")

== Substrate-level phosphorylation

#definition(title: [Substrate-level phosphorylation])[
  Adding a phosphate to ATP in order to form ADP, using directly the 
]

== Glycolysis

$ "Glucose" + 2 #ce("NAD+") + 2 #ce("ADP") + 2 "P"_i --> \
  2 "Pyruvate" + 2 #ce("NADH") + 2 #ce("H+") + 2 "ATP" + 2 #ce("H2O") $

Glycolysis happens in the cytosol.

#image("image-12.png")

The irreversible reactions are:

\#1 $#ce("Glucose + ATP ->[Hexokinase] ADP +") "Glucose-6-phosphate"$

\#3 $"Fructose-6-phosphate" #ce("+ ATP ->[Phosphofructokinase]ADP + ") "Fructose-1,6-biphosphate"$ (the committed step)

\#10 $#ce("Phosphoenolpyruvate + ADP ->[Pyruvate kinase] ATP + Pyruvate")$

Note that step \#4 splits the fructose-1,6-biphosphate into two molecules! Each of them go through the ext steps to make pyruvate.

After the first step, before the committed step, it can go into:
- Pentose phosphate pathway: generate NADPH and ribose-5-phosphate
- Glycogenesis: Synthesize glycogen
- Glycogenolysis: Convert glycogen back to glucose-1-phosphate via glucose-6-phosphate
- Glycolysis: Convert glucose to pyruvate

== Fermentation

It happens to pyruvate when there's no oxygen.

$ #ce("Pyruvate + NADH ->[Lactate dehydrogenase] NAD+ + Lactate") $

It's a redox reaction!

The #ce("NAD+") can be used for more glycolysis.

== Link step and Krebs (citric acid) cycle

#definition(title: [Link step])[
  $ #ce("Pyruvate + NAD+ ->[Pyruvate dehydrogenase]") \ "NADH" + "Acetyl-CoA" + #ce("CO2") $
]

The pyruvate goes from the cytosol to the mitochondrial matrix, then the link step happens.

After the link step, it's ready to enter the Krebs cycle.

#image("image-13.png")

#definition(title: [Acetyl group])[
  #ce("CH3CO")

  There is a double bond between the C and the O.
]

Fatty acids and amino acids can also go into the Krebs cycle.

== Oxidative phosphorylation

This uses the energy from #ce("NADH") and #ce("FADH2") to phosphorylate the ATP.

=== Electron transport chain

#image("image-10.png")

This uses the energy from the "electron acceptors", #ce("NADH") and #ce("FADH2"), to pump protons into the intermembrane space.

The electrons flow into the oxygen due to the voltage gradient. There are enzymes (the redox carriers) with different voltages that cause the electrons to flow towards the oxygen. The electrons reaching each of the redox carriers cause a change in the electric field, which pumps the protons into the intermembrane space.

[The notes about the redox carriers are not necessary for the test but help to understand it.]

=== Chemiosmosis

#image("image-11.png")

The protons want to go back to the mitochondrial matrix for two reasons:
- concentration gradient - wants same concentration on both sides
- voltage gradient
