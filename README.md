
# pi_project — One wheel, one theorem

This is the clean split:
- ClosedLoop = 1 (S¹)
- Real.pi is Irrational (mathlib: irrational_pi)
- SelfContainsInBase b x -> Rational x
- Therefore Irrational x -> not SelfContains

No vortex, no I=kMR², no Mg sinθ in this file by design.

## Build
```bash
lake update
lake exe cache get
lake build
```

The theorem that should compile: PiProject.PiClosedLoop.pi_not_selfContaining_base

Lean version: 4.20.0 / mathlib v4.20.0
