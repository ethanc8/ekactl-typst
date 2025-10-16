// https://raw.githubusercontent.com/typst/packages/main/packages/preview/cetz/0.4.2/gallery/periodic-table.typ

#import "@preview/cetz:0.4.2": canvas, draw

#import "@preview/whalogen:0.2.0": ce

#let chem = ce

#set page(width: auto, height: auto, margin: 15pt)

// Element colors
#let colors = (
  alkali-metal: rgb("#8989ff"),
  alkaline-earth: rgb("#89a9ff"),
  metal: rgb("#89c9ff"),
  metalloid: rgb("#ffa959"),
  nonmetal: rgb("#59d9d9"),
  halogen: rgb("#ffff59"),
  noble-gas: rgb("#89ff89"),
  lanthanide: rgb("#ff8989"),
  synthetic: rgb("#525252"),
  polyatomic: white,
)

#let ions = (
  // Period 1
  (
    ("1", "1.0079", "H", "Hydrogen"),
    none,
    none,
    none,
    none,
    none,
    none,
    none,
    none,
  ),
  // Period 2
  (
    ("3", "6.941", "Li", "Lithium", colors.alkali-metal),
    ("4", "9.0122", "Be", "Beryllium", colors.alkaline-earth),
    none,
    none,
    none,
    ("6", "12.011", "C", "Carbon", colors.nonmetal),
    ("7", "14.007", "N", "Nitrogen", colors.nonmetal),
    ("8", "15.999", "O", "Oxygen", colors.nonmetal),
    ("9", "18.998", "F", "Fluorine", colors.halogen),
    ("10", "20.180", "Ne", "Neon", colors.noble-gas),
  ),
  // Period 3
  (
    ("11", "22.990", "Na", "Sodium", colors.alkali-metal),
    ("12", "24.305", "Mg", "Magnesium", colors.alkaline-earth),
    none,
    none,
    none,
    none,
    ("15", "30.974", "P", "Phosphorus", colors.nonmetal),
    ("16", "32.065", "S", "Sulphur", colors.nonmetal),
    ("17", "35.453", "Cl", "Chlorine", colors.halogen),
    ("18", "39.948", "Ar", "Argon", colors.noble-gas),
  ),
  // Period 4
  (
    ("19", "39.098", "K", "Potassium", colors.alkali-metal),
    ("20", "40.078", "Ca", "Calcium", colors.alkaline-earth),
    none,
    none,
    none,
    none,
    none,
    ("34", "78.96", "Se", "Selenium", colors.nonmetal),
    ("35", "79.904", "Br", "Bromine", colors.halogen),
  ),
  // Period 5
  (
    ("37", "85.468", "Rb", "Rubidium", colors.alkali-metal),
    ("38", "87.62", "Sr", "Strontium", colors.alkaline-earth),
    none,
    none,
    none,
    none,
    none,
    none,
    ("53", "126.9", "I", "Iodine", colors.halogen),
  ),
  // Period 6
  (
    ("55", "132.91", "Cs", "Caesium", colors.alkali-metal),
    ("56", "137.33", "Ba", "Barium", colors.alkaline-earth),
    none,
    none,
    none,
    none,
    none,
    none,
    none,
  ),
  // Period 7
  (
    ("87", "223", "Fr", "Francium", colors.alkali-metal),
    ("88", "226", "Ra", "Radium", colors.alkaline-earth),
    none,
    none,
    none,
    none,
    none,
    none,
    none,
  ),
  // Period 8
  (
    (none, (1.0079 + 3*15.999), chem("H3O+"), "Hydronium", colors.polyatomic),
    none,
    none,
    none,
    none,
    none,
    none,
    none,
    (none, (1.0079 + 15.999), chem("OH-"), "Hydroxide", colors.polyatomic),
  ),
  // Period 9
  (
    none,
    none,
    none,
    none,
    none,
    none,
    none,
    (none, none, chem("CO3^2-"), "Carbonate", colors.polyatomic),
    (none, none, chem("CH3COO-"), "Hydroxide", colors.polyatomic),
  ),
)

#let elements = ions

// Helper function to create an element box
#let element(number, mass, symbol, name, fill: white, text-color: black) = {
  box(width: 3cm, height: 3cm, fill: fill, stroke: black, inset: 4pt)[
    #set align(center)
    #text(size: 18pt, weight: "bold")[#number #h(1fr) #mass]\
    #v(1fr)
    #text(size: 40pt, weight: "bold", fill: text-color)[#symbol]\
    #v(1fr)
    #text(size: 13pt)[#name]
  ]
}

// Helper function to create a synthetic element (gray text)
#let synthetic-element(number, mass, symbol, name, fill: white) = {
  element(number, mass, symbol, name, fill: fill, text-color: colors.synthetic)
}

#let iontable = canvas({
  import draw: line, content, rect

  let cell-size = 3.25 // Increased cell size
  let start-x = 0
  let start-y = 0
  // let lanthanide-gap = 2.5 // Gap before lanthanides/actinides

  // Function to calculate element position
  let pos(group, period) = {
    let y-offset = 0
    (
      start-x + (group - 1) * cell-size,
      start-y - (period - 1) * cell-size - y-offset,
    )
  }

  // Draw main table elements
  for period in range(1, elements.len() + 1) {
    for group in range(1, 10) {
      let data = elements.at(period - 1).at(group - 1)
      if data != none {
        if data.len() == 5 {
          let elem = if period == 7 and group >= 4 { synthetic-element } else { element }
          content(pos(group, period), elem(..data.slice(0, 4), fill: data.at(4)))
        } else {
          content(pos(group, period), element(..data))
        }
      }
    }
  }

  // Title
  content(
    (7 * cell-size, 0.2 * cell-size),
    text(size: 76pt, weight: "bold")[Table of Common Ions],
  )

  // Period labels
  for period in range(1, 8) {
    content(
      (start-x - cell-size * 0.6, start-y - (period - 1) * cell-size),
      text(size: 16pt, weight: "bold")[#period],
    )
  }

  // Group labels
  let groups = "1+ 2+ 3+ 4+  4- 3- 2- 1-".split(" ")

  // Find first element in each column
  for (num, label) in groups.enumerate(start: 1) {
    let first-period = if num == 1 or num == 18 { 1 } else { 2 }
    let (x, y) = pos(num, first-period)
    content(
      (x, y + cell-size * 0.7),
      box(width: 3cm)[
        #set align(center)
        #text(size: 14pt, weight: "bold")[#num #h(1fr) #label]
      ],
    )
  }

  // Legend
  // let legend-start = (start-x - 0.5 * cell-size, start-y - 6.8 * cell-size)
  // let legend-items = (
  //   ("Alkali Metal", colors.alkali-metal),
  //   ("Alkaline Earth Metal", colors.alkaline-earth),
  //   ("Transition Metal", colors.metal),
  //   ("Metalloid", colors.metalloid),
  //   ("Nonmetal", colors.nonmetal),
  //   ("Halogen", colors.halogen),
  //   ("Noble Gas", colors.noble-gas),
  //   ("Lanthanide/Actinide", colors.lanthanide),
  // )

  // for (idx, (label, color)) in legend-items.enumerate() {
  //   let y-offset = idx
  //   rect(
  //     (legend-start.at(0), legend-start.at(1) - y-offset),
  //     (legend-start.at(0) + 0.8, legend-start.at(1) - y-offset - 0.8),
  //     fill: color,
  //     stroke: black,
  //   )
  //   content(
  //     (legend-start.at(0) + 1, legend-start.at(1) - y-offset - 0.4),
  //     text(size: 14pt)[#label],
  //     anchor: "west",
  //   )
  // }

  // Element key
  let key-pos = (8, -4)
  content(
    key-pos,
    element("Z", "mass", text("Symbol", size: 22pt), "Name"),
  )
  content(
    (key-pos.at(0) + 3.3, key-pos.at(1)),
    text(size: 12pt)[
      black: natural\
      #text(fill: colors.synthetic)[gray: man-made]
    ],
  )
})

#iontable
