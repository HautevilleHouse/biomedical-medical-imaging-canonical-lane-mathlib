import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalMedicalImagingCanonicalLaneLean

structure PharmacokineticsPackage where
  absorptionRate : ℝ
  distributionVolume : ℝ
  eliminationRate : ℝ
  bioavailability : ℝ
  concentrationData : List (ℝ × ℝ)  -- time, concentration
  compartmentModel : Nat
  parameterIdentified : Prop
  goodnessOfFit : Prop

structure PharmacokineticsEvidence (P : PharmacokineticsPackage) where
  parameterIdentifiedClosed : P.parameterIdentified
  goodnessOfFitClosed : P.goodnessOfFit

def PharmacokineticsClosed (P : PharmacokineticsPackage) : Prop :=
  P.parameterIdentified ∧ P.goodnessOfFit

theorem pharmacokinetics_closed_from_evidence (P : PharmacokineticsPackage) (E : PharmacokineticsEvidence P) :
    PharmacokineticsClosed P := by
  exact And.intro E.parameterIdentifiedClosed E.goodnessOfFitClosed

end BiomedicalMedicalImagingCanonicalLaneLean
end HautevilleHouse