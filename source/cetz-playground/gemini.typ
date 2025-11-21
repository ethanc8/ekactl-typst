#import "@preview/cetz:0.3.1": canvas, draw

#set page(width: auto, height: auto, margin: 1cm)

#canvas(length: 1cm, {
  // --- Styles & Colors ---
  let enzyme-fill = rgb("#cceaff") // Light blue
  let stroke-style = (thickness: 1.5pt, paint: black)
  let arrow-style = (stroke: 1.5pt)
  
  // --- Helper Functions ---
  
  // Reusable shape logic for the Enzyme to avoid code repetition and errors
  let enzyme-path(r: 1.2) = {
    let start-angle = 30deg
    let end-angle = 330deg
    // Calculate the exact coordinate where the arc ends
    let arc-end = (r * calc.cos(end-angle), r * calc.sin(end-angle))
    let notch-center = (0.5, 0)
    
    (
      draw.arc((0,0), start: start-angle, stop: end-angle, radius: r),
      // Explicitly draw line from arc-end to the notch center
      draw.line(arc-end, notch-center)
      // 'close: true' in the parent merge-path will connect notch-center back to start
    )
  }

  // Function to draw the Enzyme (Pacman shape)
  let draw-enzyme(pos, rotation: 0deg) = {
    draw.group({
      draw.translate(pos)
      draw.rotate(rotation)
      draw.merge-path(
        stroke: stroke-style, 
        fill: enzyme-fill, 
        close: true,
        enzyme-path()
      )
    })
  }

  // Shape for Substrate/Inhibitor (fitting the notch)
  let substrate-shape = (
    (0.6, 0.3), (1.0, 0.3), (1.2, 0), (1.0, -0.3), (0.6, -0.3)
  )

  // Function to draw Enzyme-Substrate Complex
  let draw-ES(pos) = {
    draw.group({
      draw.translate(pos)
      // Draw Enzyme
      draw.merge-path(stroke: stroke-style, fill: enzyme-fill, close: true, enzyme-path())
      // Draw Substrate filling the gap
      draw.line(..substrate-shape, close: true, stroke: stroke-style, fill: white)
      draw.content((0.9, 0), text(weight: "bold", "S"))
    })
  }

  // Function to draw Enzyme-Inhibitor Complex
  let draw-EI(pos) = {
    draw.group({
      draw.translate(pos)
      // Draw Enzyme
      draw.merge-path(stroke: stroke-style, fill: enzyme-fill, close: true, enzyme-path())
      // Draw Inhibitor filling the gap
      draw.line(..substrate-shape, close: true, stroke: stroke-style, fill: white)
      draw.content((0.9, 0), text(weight: "bold", "I"))
    })
  }

  // Function for small floating badges (S) and (I)
  let badge(pos, txt) = {
    draw.circle(pos, radius: 0.3, fill: white, stroke: stroke-style)
    draw.content(pos, text(weight: "bold", txt))
  }

  // Function for equilibrium arrows
  let eq-arrows(start, end, vertical: false, label: none) = {
    if vertical {
      draw.line((start.at(0) - 0.1, start.at(1)), (end.at(0) - 0.1, end.at(1)), mark: (start: ">"), stroke: arrow-style)
      draw.line((start.at(0) + 0.1, start.at(1)), (end.at(0) + 0.1, end.at(1)), mark: (end: ">"), stroke: arrow-style)
      if label != none {
        draw.content((start.at(0) + 0.4, (start.at(1) + end.at(1))/2), label)
      }
    } else {
      draw.line((start.at(0), start.at(1) + 0.1), (end.at(0), end.at(1) + 0.1), mark: (end: ">"), stroke: arrow-style)
      draw.line((start.at(0), start.at(1) - 0.1), (end.at(0), end.at(1) - 0.1), mark: (start: ">"), stroke: arrow-style)
    }
  }

  // --- Main Drawing ---

  // 1. The Chemical Equation (Top Left)
  let eq-x = 0
  let eq-y = 0
  
  draw.content((eq-x, eq-y), text(size: 1.2em, weight: "bold", [E + S]))
  
  // Horizontal Equilibrium
  eq-arrows((eq-x + 1.5, eq-y), (eq-x + 3.5, eq-y))
  
  draw.content((eq-x + 4.5, eq-y), text(size: 1.2em, weight: "bold", [ES]))
  
  // Forward Arrow
  draw.line((eq-x + 5.5, eq-y), (eq-x + 7.5, eq-y), mark: (end: ">"), stroke: stroke-style)
  
  draw.content((eq-x + 8.5, eq-y), text(size: 1.2em, weight: "bold", [E + P]))

  // Vertical Branch (Inhibitor)
  draw.content((eq-x - 0.6, eq-y - 1), text(size: 1.5em, weight: "bold", [+]))
  draw.content((eq-x - 0.6, eq-y - 2), text(size: 1.2em, weight: "bold", [I]))
  
  // Vertical Equilibrium Arrow
  eq-arrows((eq-x - 0.6, eq-y - 2.8), (eq-x - 0.6, eq-y - 4.8), vertical: true, label: text(size: 1.1em, [$K_I$]))
  
  draw.content((eq-x - 0.6, eq-y - 5.5), text(size: 1.2em, weight: "bold", [EI]))


  // 2. The Graphical Representation (Right Side)
  
  // Coordinates
  let c-center = (6, -3) // Central free enzyme
  let c-top = (11, 0)    // ES Complex
  let c-bot = (11, -6)   // EI Complex

  // Draw Central Enzyme
  draw-enzyme(c-center)

  // Draw Top Branch (Substrate)
  draw-ES(c-top)
  
  // Arrows to Top
  let arrow-offset-x = 1.5
  let arrow-offset-y = 0.8
  let arrow-start-top = (c-center.at(0) + arrow-offset-x, c-center.at(1) + arrow-offset-y)
  let arrow-end-top = (c-top.at(0) - arrow-offset-x, c-top.at(1) - arrow-offset-y)
  
  draw.line(
    (arrow-start-top.at(0), arrow-start-top.at(1)+0.1), 
    (arrow-end-top.at(0), arrow-end-top.at(1)+0.1), 
    mark: (end: ">"), stroke: stroke-style
  )
  draw.line(
    (arrow-start-top.at(0), arrow-start-top.at(1)-0.1), 
    (arrow-end-top.at(0), arrow-end-top.at(1)-0.1), 
    mark: (start: ">"), stroke: stroke-style
  )
  // Floating Substrate badge
  badge((arrow-start-top.at(0) + 1, arrow-start-top.at(1) + 0.8), "S")


  // Draw Bottom Branch (Inhibitor)
  draw-EI(c-bot)

  // Arrows to Bottom
  let arrow-start-bot = (c-center.at(0) + arrow-offset-x, c-center.at(1) - arrow-offset-y)
  let arrow-end-bot = (c-bot.at(0) - arrow-offset-x, c-bot.at(1) + arrow-offset-y)

  draw.line(
    (arrow-start-bot.at(0), arrow-start-bot.at(1)+0.1), 
    (arrow-end-bot.at(0), arrow-end-bot.at(1)+0.1), 
    mark: (end: ">"), stroke: stroke-style
  )
  draw.line(
    (arrow-start-bot.at(0), arrow-start-bot.at(1)-0.1), 
    (arrow-end-bot.at(0), arrow-end-bot.at(1)-0.1), 
    mark: (start: ">"), stroke: stroke-style
  )
  // Floating Inhibitor badge
  badge((arrow-start-bot.at(0) + 1, arrow-start-bot.at(1) - 0.8), "I")

})
