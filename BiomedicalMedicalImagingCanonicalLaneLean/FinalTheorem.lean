import HautevilleHouse.BiomedicalMedicalImagingCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace BiomedicalMedicalImagingCanonicalLaneLean

def ConstrainedBiomedicalImagingClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_biomedical_imaging_endgame (A : AdmissibleClass) :
    ConstrainedBiomedicalImagingClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end BiomedicalMedicalImagingCanonicalLaneLean
end HautevilleHouse