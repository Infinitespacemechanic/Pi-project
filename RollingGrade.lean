import Mathlib.Data.Real.Basic
import Mathlib.Tactic.Positivity

-- Step 1 definitions (closed circle + grade)
structure ClosedCircle where
  r : ℝ
  m : ℝ
  hr : 0 < r
  hm : 0 < m

structure Grade where
  angle : ℝ
  g : ℝ
  hg : 0 < g
  h_angle_pos : 0 < angle

def downForce (c : ClosedCircle) (grade : Grade) : ℝ :=
  c.m * grade.g * grade.angle

-- Your Step 2 definitions
structure Mass where
  M : ℝ
  hM : 0 < M

def potential (mass : Mass) (r : ℝ) (_hr : 0 < r) : ℝ :=
  - mass.M / r  -- G=1 for lean

def grade_magnitude (mass : Mass) (r : ℝ) (_hr : 0 < r) : ℝ :=
  mass.M / (r * r) -- |∇Φ|

theorem always_a_grade (mass : Mass) (r : ℝ) (hr : 0 < r) :
  0 < grade_magnitude mass r hr := by
  unfold grade_magnitude
  apply div_pos
  exact mass.hM
  apply mul_pos hr hr

-- Corollary: for any point at finite distance, there exists a downhill direction
-- So a closed circle at that point has a free direction
theorem closed_circle_always_can_roll (c : ClosedCircle) (mass : Mass) (r : ℝ) (hr : 0 < r) :
  ∃ (grade : Grade), 0 < downForce c grade := by
  have h_grade : 0 < grade_magnitude mass r hr := always_a_grade mass r hr
  -- Build a Grade whose angle is exactly the gravitational grade magnitude
  -- g = 1 is enough, since positivity is all we need for "down is free"
  let grade : Grade := {
    angle := grade_magnitude mass r hr
    g := 1
    hg := by linarith
    h_angle_pos := h_grade
  }
  use grade
  unfold downForce
  -- c.m > 0, grade.g = 1 > 0, grade.angle = grade_magnitude > 0
  have hm : 0 < c.m := c.hm
  have hg : 0 < grade.g := grade.hg
  have ha : 0 < grade.angle := grade.h_angle_pos
  positivity
