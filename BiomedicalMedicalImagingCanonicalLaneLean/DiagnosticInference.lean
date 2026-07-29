import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalMedicalImagingCanonicalLaneLean

structure DiagnosticTestPackage where
  sensitivity : ℝ
  specificity : ℝ
  prevalence : ℝ
  rocCurve : ℝ → ℝ
  testDiscrimination : Prop

structure DiagnosticTestEvidence (D : DiagnosticTestPackage) where
  sensitivityBetween0And1 : 0 ≤ D.sensitivity ∧ D.sensitivity ≤ 1
  specificityBetween0And1 : 0 ≤ D.specificity ∧ D.specificity ≤ 1
  prevalenceBetween0And1 : 0 ≤ D.prevalence ∧ D.prevalence ≤ 1
  rocCurveValid : ∀ t, 0 ≤ D.rocCurve t ∧ D.rocCurve t ≤ 1
  testDiscriminationClosed : D.testDiscrimination

def DiagnosticTestClosed (D : DiagnosticTestPackage) : Prop :=
  (0 ≤ D.sensitivity ∧ D.sensitivity ≤ 1) ∧
  (0 ≤ D.specificity ∧ D.specificity ≤ 1) ∧
  (0 ≤ D.prevalence ∧ D.prevalence ≤ 1) ∧
  (∀ t, 0 ≤ D.rocCurve t ∧ D.rocCurve t ≤ 1) ∧ D.testDiscrimination

theorem diagnostic_test_closed_from_evidence (D : DiagnosticTestPackage) (E : DiagnosticTestEvidence D) :
    DiagnosticTestClosed D := by
  exact And.intro E.sensitivityBetween0And1 (And.intro E.specificityBetween0And1 (And.intro E.prevalenceBetween0And1 (And.intro E.rocCurveValid E.testDiscriminationClosed)))

end BiomedicalMedicalImagingCanonicalLaneLean
end HautevilleHouse