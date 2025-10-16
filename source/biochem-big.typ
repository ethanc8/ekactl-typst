#import "@local/ethan-standard-style:0.1.0": *

#let this-style(
  doc
) = [
  #set page(
    paper: "us-letter",
    flipped: true,
    margin: 20pt,
  )

  // Theorem environments
  #show: show-theorion

  // Font
  #show: set-text-font.with(font: fonts.libertinus-serif)
  #show: set-mono-font.with(font: fonts.dejavu-sans-mono)
  #show: set-math-font.with(font: math-fonts.newcm-math)

  #doc

]

#show: this-style

#import "ptable.typ" : ptable

// #place(
//   [#box(
//     stroke: black,
//     ptable
//   )]
// )

#scale(45%, origin: top + left)[#ptable]



#pagebreak()

#figure(
  image("ProteinogenicAminoAcids.svg")
)
