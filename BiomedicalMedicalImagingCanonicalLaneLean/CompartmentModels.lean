import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalMedicalImagingCanonicalLaneLean

structure CompartmentModelsPackage where
  numCompartments : Nat
  transferRates : List (Nat × Nat × ℝ)  -- (from, to, rate)
  initialConditions : List (Nat × ℝ)
  tracerKineticsModel : Prop
  wellMixedAssumption : Prop
  linearity : Prop
  identifiability : Prop

structure CompartmentModelsEvidence (C : CompartmentModelsPackage) where
  tracerKineticsModelClosed : C.tracerKineticsModel
  wellMixedAssumptionClosed : C.wellMixedAssumption
  linearityClosed : C.linearity
  identifiabilityClosed : C.identifiability

def CompartmentModelsClosed (C : CompartmentModelsPackage) : Prop :=
  C.tracerKineticsModel ∧ C.wellMixedAssumption ∧ C.linearity ∧ C.identifiability

theorem compartment_models_closed_from_evidence (C : CompartmentModelsPackage) (E : CompartmentModelsEvidence C) :
    CompartmentModelsClosed C := by
  exact And.intro E.tracerKineticsModelClosed
    (And.intro E.wellMixedAssumptionClosed
      (And.intro E.linearityClosed E.identifiabilityClosed))

end BiomedicalMedicalImagingCanonicalLaneLean
end HautevilleHouse