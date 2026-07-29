import HautevilleHouse.BiomedicalMedicalImagingCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalMedicalImagingCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  A.object.bridgeConclusion

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.bridgeConclusion

end BiomedicalMedicalImagingCanonicalLaneLean
end HautevilleHouse