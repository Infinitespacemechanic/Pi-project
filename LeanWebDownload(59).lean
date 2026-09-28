import Mathlib.Data.Real.Basic

-- Step 1: Closed circle on a grade
structure ClosedCircle where
  r : ℝ
  m : ℝ
  hr : 0 < r
  hm : 0 < m

structure Grade where
  angle : ℝ  -- α > 0 means downhill
  g : ℝ
  hg : 0 < g
  h_angle_pos : 0 < angle -- simplified: sin angle > 0 modeled as angle > 0

def downForce (c : ClosedCircle) (grade : Grade) : ℝ :=
  c.m * grade.g * grade.angle -- stands for m*g*sinα, sinα >0

-- Lemma 1: Down is free - force is positive without push
theorem down_is_free (c : ClosedCircle) (grade : Grade) :
  0 < downForce c grade := by
  unfold downForce
  apply mul_pos
  apply mul_pos
  exact c.hm
  exact grade.hg
  exact grade.h_angle_pos

-- Lemma 2: A closed shape does not bound translation
-- s(t) = 1/2 a t^2 grows without bound even though θ = s / r mod 2π is bounded
theorem closed_does_not_bound_momentum (a : ℝ) (ha : 0 < a) :
  ∀ (P : ℝ), ∃ (t : ℝ), 0 < t ∧ P < a * t := by
  intro P
  use P / a + 1
  constructor
  · lpositivity
  · calc P < P + a := by linarith
       _ = a * (P / a + 1) := by field_simp