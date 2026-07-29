import HautevilleHouse.BiomedicalMedicalImagingCanonicalLaneLean.FinalTheorem
import HautevilleHouse.CanonicalLaneMathlibCore

namespace HautevilleHouse
namespace BiomedicalMedicalImagingCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure ImagingProofObligation where
  sourceKey : String
  theoremObject : String
  commonCoreImported : Bool
  theoremSpecificDefinitionsNative : Bool
  theoremSpecificBridgeNative : Bool
  theoremSpecificAdmittedClosureNative : Bool
  unrestrictedClassicalClosureNative : Bool
  carriedGap : String

def imagingProofObligation : ImagingProofObligation := {
  sourceKey := sourceRepository,
  theoremObject := "Biomedical Medical Imaging Canonical Theorem",
  commonCoreImported := true,
  theoremSpecificDefinitionsNative := true,
  theoremSpecificBridgeNative := true,
  theoremSpecificAdmittedClosureNative := true,
  unrestrictedClassicalClosureNative := false,
  carriedGap := "theorem-specific imaging endgame pilot closes over the admitted class; unrestricted classical closure remains carried"
}

def theoremSpecificEndgamePilotClosed : Prop :=
  forall A : AdmissibleClass, ConstrainedImagingClosure A

theorem theorem_specific_endgame_pilot_checked :
    theoremSpecificEndgamePilotClosed := by
  intro A
  exact constrained_imaging_endgame A

end BiomedicalMedicalImagingCanonicalLaneLean
end HautevilleHouse