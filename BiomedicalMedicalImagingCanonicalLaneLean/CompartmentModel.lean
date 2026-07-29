import HautevilleHouse.BiomedicalMedicalImagingCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalMedicalImagingCanonicalLaneLean

structure CompartmentModelPackage where
  numberOfCompartments : Nat
  transferRates : List (Nat × Nat × Float)
  compartmentConcentrations : List Float
  initialConditions : List Float
  differentialEquationsFormulated : Prop

def CompartmentModelClosed (P : CompartmentModelPackage) : Prop :=
  P.differentialEquationsFormulated ∧
  P.compartmentConcentrations.length = P.numberOfCompartments ∧
  P.initialConditions.length = P.numberOfCompartments

structure CompartmentModelEvidence (P : CompartmentModelPackage) where
  differentialEquationsFormulatedClosed : P.differentialEquationsFormulated
  initialConditionsCorrect : P.initialConditions.length = P.numberOfCompartments
  concentrationsDefined : P.compartmentConcentrations.length = P.numberOfCompartments

theorem compartment_model_closed_from_evidence (P : CompartmentModelPackage)
    (E : CompartmentModelEvidence P) : CompartmentModelClosed P := by
  exact And.intro E.differentialEquationsFormulatedClosed
    (And.intro E.concentrationsDefined E.initialConditionsCorrect)

end BiomedicalMedicalImagingCanonicalLaneLean
end HautevilleHouse