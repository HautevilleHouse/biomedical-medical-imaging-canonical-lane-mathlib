import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalMedicalImagingCanonicalLaneLean

structure DiagnosticTestEvaluationPackage where
  sensitivity : Prop
  specificity : Prop
  positivePredictiveValue : Prop
  negativePredictiveValue : Prop
  rocAUC : Prop
  prevalence : Prop

structure DiagnosticTestEvaluationEvidence (D : DiagnosticTestEvaluationPackage) where
  sensitivityClosed : D.sensitivity
  specificityClosed : D.specificity
  positivePredictiveValueClosed : D.positivePredictiveValue
  negativePredictiveValueClosed : D.negativePredictiveValue
  rocAUCClosed : D.rocAUC
  prevalenceClosed : D.prevalence

def DiagnosticTestEvaluationClosed (D : DiagnosticTestEvaluationPackage) : Prop :=
  D.sensitivity ∧ D.specificity ∧ D.positivePredictiveValue ∧ D.negativePredictiveValue ∧ D.rocAUC ∧ D.prevalence

theorem diagnostic_test_evaluation_closed_from_evidence
    (D : DiagnosticTestEvaluationPackage)
    (E : DiagnosticTestEvaluationEvidence D) : DiagnosticTestEvaluationClosed D := by
  exact And.intro E.sensitivityClosed
    (And.intro E.specificityClosed
      (And.intro E.positivePredictiveValueClosed
        (And.intro E.negativePredictiveValueClosed
          (And.intro E.rocAUCClosed E.prevalenceClosed))))

end BiomedicalMedicalImagingCanonicalLaneLean
end HautevilleHouse