import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalMedicalImagingCanonicalLaneLean

structure ImagingReconstructionPackage where
  forwardModel : Type u
  inverseProblem : Type v
  regularization : Prop
  convergenceGuarantee : Prop
  reconstructionError : Prop
  computationalFeasibility : Prop

structure ImagingReconstructionEvidence (I : ImagingReconstructionPackage) where
  regularizationClosed : I.regularization
  convergenceGuaranteeClosed : I.convergenceGuarantee
  reconstructionErrorClosed : I.reconstructionError
  computationalFeasibilityClosed : I.computationalFeasibility

def ImagingReconstructionClosed (I : ImagingReconstructionPackage) : Prop :=
  I.regularization ∧ I.convergenceGuarantee ∧ I.reconstructionError ∧ I.computationalFeasibility

theorem imaging_reconstruction_closed_from_evidence
    (I : ImagingReconstructionPackage)
    (E : ImagingReconstructionEvidence I) : ImagingReconstructionClosed I := by
  exact And.intro E.regularizationClosed
    (And.intro E.convergenceGuaranteeClosed
      (And.intro E.reconstructionErrorClosed E.computationalFeasibilityClosed))

end BiomedicalMedicalImagingCanonicalLaneLean
end HautevilleHouse