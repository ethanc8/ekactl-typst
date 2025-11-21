#import "@preview/cetz:0.3.1"

#set page(width: auto, height: auto, margin: 0.5cm)

#cetz.canvas({
  import cetz.draw: *
  
  // Left side - reaction equation
  content((0, 2), [E + S])
  line((0.9, 2.1), (1.7, 2.1), mark: (end: "stealth"))
  line((0.9, 1.9), (1.7, 1.9), mark: (start: "stealth"))
  content((2.2, 2), [ES])
  line((2.8, 2), (3.8, 2), mark: (end: "stealth"))
  content((4.4, 2), [E + P])
  
  // Plus and I below
  content((0, 0.8), [+])
  content((0, 0.3), [I])
  
  // Double arrow with Ki
  line((0.2, 0.6), (0.2, -0.2), mark: (start: "stealth", end: "stealth"))
  content((-0.35, 0.2), $K_i$)
  
  // EI at bottom
  content((0, -0.5), [EI])
  
  // Right side - Pac-Man style circles with labels
  
  // Top circle with S (enzyme-substrate)
  circle((6.5, 2), radius: 0.5, fill: rgb(173, 216, 230), stroke: black)
  // Pac-Man mouth
  line((6.1, 2.25), (6.3, 2), stroke: white + 3pt)
  line((6.1, 1.75), (6.3, 2), stroke: white + 3pt)
  // S label in circle
  circle((7.1, 2.25), radius: 0.2, fill: white, stroke: black + 0.8pt)
  content((7.1, 2.25), text(size: 8pt, [S]))
  
  // Arrows for top circle
  line((5.2, 2.15), (5.9, 2.1), mark: (end: "stealth"))
  line((5.2, 1.85), (5.9, 1.9), mark: (start: "stealth"))
  
  // Bottom circle with I (enzyme-inhibitor)
  circle((6.5, 0.5), radius: 0.5, fill: rgb(173, 216, 230), stroke: black)
  // Pac-Man mouth
  line((6.1, 0.75), (6.3, 0.5), stroke: white + 3pt)
  line((6.1, 0.25), (6.3, 0.5), stroke: white + 3pt)
  // I label in circle
  circle((7.1, 0.75), radius: 0.2, fill: white, stroke: black + 0.8pt)
  content((7.1, 0.75), text(size: 8pt, [I]))
  
  // Arrows for bottom circle
  line((5.2, 0.65), (5.9, 0.6), mark: (end: "stealth"))
  line((5.2, 0.35), (5.9, 0.4), mark: (start: "stealth"))
})