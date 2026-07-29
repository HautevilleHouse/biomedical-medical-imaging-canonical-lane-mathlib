import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalMedicalImagingCanonicalLaneLean

structure PharmacokineticInferencePackage where
  populationModel : Type u
  individualParameters : Type v
  absorptionRate : Prop
  eliminationRate : Prop
  bioavailability : Prop
  therapeuticWindow : Prop

structure PharmacokineticInferenceEvidence (P : PharmacokineticInferencePackage) where
  absorptionRateClosed : P.absorptionRate
  eliminationRateClosed : P.eliminationRate
  bioavailabilityClosed : P.bioavailability
  therapeuticWindowClosed : P.therapeuticWindow

def PharmacokineticInferenceClosed (P : PharmacokineticInferencePackage) : Prop :=
  P.absorptionRate ∧ P.eliminationRate ∧ P.bioavailability ∧ P.therapeuticWindow

theorem pharmacokinetic_inference_closed_from_evidence
    (P : PharmacokineticInferencePackage)
    (E : PharmacokineticInferenceEvidence P) : PharmacokineticInferenceClosed P := by
  exact And.intro E.absorptionRateClosed
    (And.intro E.eliminationRateClosed
      (And.intro E.bioavailabilityClosed E.therapeuticWindowClosed))

end BiomedicalMedicalImagingCanonicalLaneLean
end HautevilleHouse