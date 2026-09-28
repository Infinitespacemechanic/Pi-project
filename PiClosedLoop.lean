import Mathlib.Analysis.SpecialFunctions.Trigonometric.Basic
import Mathlib.Data.Real.Irrational
import Mathlib.Data.Nat.Digits
import Mathlib.Topology.UnitInterval

/-!
# The analog that holds

Finite board on one closed wheel, lean creates the grade.
That is a real machine (Onewheel 2008 / 2014).
Lean is the grade. Pads are the block. Tire is the closed loop.

# What the math actually says

π is not the circle. The circle is already closed = 1.
π appears when you measure that closed curve with a straight unit.
The infinite digit string is that measurement, not the wheel.
Self-containment of the *whole* string would force periodic expansion,
hence rational.

The board is a finite block already in the series.
The series is not on the board.

Two languages, not one equation.
- Picture: closed loop, open path, finite patch
- French: S¹, arc length rθ, irrational π, no shift-copy
-/

noncomputable section

open Real

-- The closed loop is 1. This is S¹ normalized.
def ClosedLoop : ℝ := 1

theorem closed_loop_one : ClosedLoop = 1 := rfl

-- π is the measurement, not the loop. Mathlib knows it is irrational.
theorem pi_is_measurement_not_loop : Irrational Real.pi :=
  irrational_pi

-- Define: a real in [0,1) has a base-b expansion containing a shift copy of itself
-- from position N onward with period k > 0
-- This is the formal version of "the whole string contains itself"
def SelfContainsInBase (b : ℕ) (x : ℝ) : Prop :=
  ∃ (N k : ℕ), 0 < k ∧ ∃ (p : ℤ), 
    -- eventually periodic => rational
    -- We state it as: x is rationally related to a periodic tail
    -- Full digit lemma would need Nat.digits, we state the rational consequence
    x = (p : ℝ) / (b ^ N * (b ^ k - 1))

-- Lemma: self-containment forces rational
-- Proof idea: 0.d₁...d_N (d_{N+1}...d_{N+k}) repeating = p / (b^N (b^k-1))
theorem selfContains_imp_rational (b : ℕ) (hb : 2 ≤ b) (x : ℝ)
    (h : SelfContainsInBase b x) : ∃ q : ℚ, (q : ℝ) = x := by
  rcases h with ⟨N, k, _, p, hx⟩
  -- x is explicitly p / (b^N (b^k-1)) which is rational
  use ⟨p, b ^ N * (b ^ k - 1), by positivity⟩
  simp [hx]
  -- rational coercion
  rfl

-- Since π is irrational, it cannot be of that rational form
theorem pi_not_selfContaining_base (b : ℕ) (hb : 2 ≤ b) :
    ¬ SelfContainsInBase b Real.pi := by
  intro h
  have hr := selfContains_imp_rational b hb Real.pi h
  rcases hr with ⟨q, hq⟩
  -- q = π  would make π rational, contradiction with irrational_pi
  have : Irrational Real.pi := irrational_pi
  rw [← hq] at this
  -- Irrational (q : ℝ) is impossible for rational q
  -- Mathlib: Irrational (q : ℝ) is False
  have : ¬ Irrational (q : ℝ) := by
    exact not_irrational_q
  contradiction

-- Corollary: same for any irrational
theorem irrational_not_selfContaining (b : ℕ) (hb : 2 ≤ b) (x : ℝ)
    (hx_irr : Irrational x) : ¬ SelfContainsInBase b x := by
  intro h
  have hr := selfContains_imp_rational b hb x h
  rcases hr with ⟨q, hq⟩
  rw [← hq] at hx_irr
  exact not_irrational_q hx_irr

-- The board is a finite block already in the series, not the series on the board
def FiniteBoard (L : ℝ) (x : ℝ) : Prop := 0 ≤ x ∧ x < L

theorem board_finite_patch (L : ℝ) (hL : 0 < L) : ∃ x, FiniteBoard L x := by
  use 0
  constructor
  · linarith
  · exact hL

/-!
# Summary

- ClosedLoop = 1 : S¹
- Real.pi is Irrational
- SelfContainsInBase b x -> Rational x
- Therefore Irrational x -> ¬ SelfContainsInBase b x
- In particular, ¬ SelfContainsInBase b π

The vortex, density sort, Mg sinθ, M/r² are separate machines.
They do not appear in this file, by design.
-/

end
