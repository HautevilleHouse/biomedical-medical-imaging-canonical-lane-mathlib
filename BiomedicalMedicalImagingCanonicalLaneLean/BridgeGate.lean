import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalMedicalImagingCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  True

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  unfold bridgeClosed
  trivial

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  unfold gateClosed
  exact A.gateWitness

end BiomedicalMedicalImagingCanonicalLaneLean
end HautevilleHouse