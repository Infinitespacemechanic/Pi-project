import Mathlib.Data.Real.Basic
import Mathlib.NumberTheory.Real.Irrational
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Basic

namespace PiProject.PiClosedLoop

/-- The circle is already closed. This is documentation, not a proof about π. -/
def ClosedLoop : ℕ := 1

/-- Digit in base `b ≥ 2`. -/
def digit (b : ℕ) (x : ℝ) (n : ℕ) : ℕ :=
  ((b ^ (n + 1) * x).floor % b).toNat

/-- Whole infinite string equals its shift by `k > 0`. -/
def SelfContainsInBase (b : ℕ) (x : ℝ) : Prop :=
  ∃ k > 0, ∀ n, digit b x (n + k) = digit b x n

/-- Classical: purely periodic expansion in base `b` is rational. -/
lemma selfContains_rational {b : ℕ} {x : ℝ}
    (hb : 2 ≤ b) (h : SelfContainsInBase b x) :
    ∃ p q : ℤ, q ≠ 0 ∧ x = p / q := by
  sorry

theorem irrational_not_selfContaining {b : ℕ} {x : ℝ}
    (hb : 2 ≤ b) (irr : Irrational x) :
    ¬ SelfContainsInBase b x := by
  intro h
  exact irr (selfContains_rational hb h)

theorem pi_not_selfContaining_base {b : ℕ} (hb : 2 ≤ b) :
    ¬ SelfContainsInBase b Real.pi :=
  irrational_not_selfContaining hb irrational_pi

end PiProject.PiClosedLoop
