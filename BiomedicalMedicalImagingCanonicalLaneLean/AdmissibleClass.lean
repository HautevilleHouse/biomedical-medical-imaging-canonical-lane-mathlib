import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalMedicalImagingCanonicalLaneLean

structure MedicalImagingAdmittedObject where
  modality : String
  compartmentModel : Prop
  pharmacokineticParameters : Prop
  survivalEndpoint : Prop
  diagnosticThreshold : Prop
  bridgeConclusion : Prop

structure AdmissibleClass where
  object : MedicalImagingAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  A.object.bridgeConclusion ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end BiomedicalMedicalImagingCanonicalLaneLean
end HautevilleHouse