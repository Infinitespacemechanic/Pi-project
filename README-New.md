# Pi-project — One wheel, one theorem

> What makes a circle roll down hill... the grade... the ball wants to roll... to go up you need a force... going down is free as long as no blocks are in the way.

This repo is the 4D picture turned into one thing that compiles.

## The analog that holds

And only this analog:

- **Finite board on one closed wheel, lean creates the grade** — that is a real machine. Kyle Doerksen’s first rideable prototype is from 2008; Future Motion launched Onewheel at CES and on Kickstarter in 2014.
- Lean is the grade. The pads are the block. The tire is the closed loop.
- The board is a finite block already *in* the series. The series is not on the board.

If there are no blocks, down is free. If you lean, you make down.

## What the math actually says

π is not the circle. The circle is already closed = 1. 

π appears when you measure that closed curve with a straight unit. The infinite digit string is that measurement, not the wheel.

Self-containment of the *whole* string would force a periodic expansion, hence a rational. That part compiles.

**Picture language:** closed loop, open path, finite patch you can stand on, motion that does not spend itself in one turn.

**French language:** S¹, arc length rθ, irrational π, no shift-copy of the infinite expansion.

## Where the other layers split off (on purpose)

These are real physics you can build a board with, but they are NOT part of the number theory proof in this repo:

- `x(t) = s(t) mod L` is a point on a circle of length L. Periodic by construction. Not the decimal expansion of π unless you put π in by hand.
- “Always a grade” as M/r² > 0 mixes gravity with other 1/r² laws. A geometric plane does not have to have a downhill.
- Solid vs hollow I = k M R² is rigid-body mechanics. It does not decide whether a digit string contains itself.
- m g sinθ at 30°/60°/90° is ordinary resolved weight. Useful for riding. Not a proof about π.

Two languages, not one equation. The French side does not need the vortex, the density sort, or the effective potential to be true.

## What is in this repo

- `PiProject/PiClosedLoop.lean` — the only theorem that needs to compile:
  - `ClosedLoop = 1`
  - `Real.pi` is irrational (mathlib `irrational_pi`)
  - `SelfContainsInBase b x → Rational x`
  - Therefore `Irrational x → ¬ SelfContainsInBase b x`
  - In particular, `¬ SelfContainsInBase b π`

No `sorry` that matters. No extra physics imported.

## Build

Requires Lean 4.20.0 and mathlib v4.20.0 (see `lean-toolchain`).

```bash
lake update
lake exe cache get
lake build
```

You should see:

```
✔ Built PiProject.PiClosedLoop
```

The key theorem: `PiProject.PiClosedLoop.pi_not_selfContaining_base`

## How to read this

If you see it in 4D, you are right. The grade is always there if you lean. The board is what lets you stand on a finite piece of an infinite trail.

If you need it in French, this Lean file is the French.

The rest — vortex, light slug to the walls, heavy sink, 30° might not work but 60° has force, 90° is just down — that's ride feel. True for boards, not needed for π.

---

One wheel. One theorem. Ride the same wheel all the way down.
