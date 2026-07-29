import HautevilleHouse.BiomedicalMedicalImagingCanonicalLaneLean.AdmissibleClass
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace BiomedicalMedicalImagingCanonicalLaneLean

structure ImagingSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure ImagingAdmittedObject where
  space : ImagingSpace
  scannerResolution : Prop
  contrastAgentInjected : Prop
  signalModel : Prop
  diagnosticConclusion : Prop
  conclusion : diagnosticConclusion

def ImagingWitnessClosed (O : ImagingAdmittedObject) : Prop :=
  O.diagnosticConclusion

structure ImagingEndgameState where
  object : ImagingAdmittedObject

end BiomedicalMedicalImagingCanonicalLaneLean
end HautevilleHouse