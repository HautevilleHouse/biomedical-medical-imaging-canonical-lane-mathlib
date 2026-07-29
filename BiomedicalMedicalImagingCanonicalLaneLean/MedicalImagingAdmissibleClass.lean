import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalMedicalImagingCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlib

structure ImagingAdmittedObject where
  modality : String
  protocol : String
  clinicalIndication : String
  diagnosticAccuracy : Prop
  conclusion : diagnosticAccuracy

structure MedicalImagingAdmissibleClass where
  object : ImagingAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : MedicalImagingAdmissibleClass) : Prop :=
  A.object.diagnosticAccuracy ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end BiomedicalMedicalImagingCanonicalLaneLean
end HautevilleHouse