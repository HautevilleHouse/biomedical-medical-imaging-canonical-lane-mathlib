import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BiomedicalMedicalImagingCanonicalLaneLean.CompartmentModel

namespace HautevilleHouse
namespace BiomedicalMedicalImagingCanonicalLaneLean

structure PharmacokineticParameterPackage (C : CompartmentModelPackage) where
  clearance : ℝ
  volumeOfDistribution : ℝ
  halfLife : ℝ
  bioavailability : ℝ

structure PharmacokineticParameterEvidence (C : CompartmentModelPackage) (P : PharmacokineticParameterPackage C) where
  clearanceClosed : P.clearance > 0
  volumeOfDistributionClosed : P.volumeOfDistribution > 0
  halfLifeClosed : P.halfLife > 0
  bioavailabilityClosed : 0 < P.bioavailability ∧ P.bioavailability ≤ 1

def PharmacokineticParameterClosed (C : CompartmentModelPackage) (P : PharmacokineticParameterPackage C) : Prop :=
  P.clearance > 0 ∧ P.volumeOfDistribution > 0 ∧ P.halfLife > 0 ∧ (0 < P.bioavailability ∧ P.bioavailability ≤ 1)

theorem pharmacokinetic_parameter_closed_from_evidence (C : CompartmentModelPackage) (P : PharmacokineticParameterPackage C)
    (E : PharmacokineticParameterEvidence C P) : PharmacokineticParameterClosed C P := by
  refine And.intro E.clearanceClosed (And.intro E.volumeOfDistributionClosed (And.intro E.halfLifeClosed E.bioavailabilityClosed))

end BiomedicalMedicalImagingCanonicalLaneLean
end HautevilleHouse