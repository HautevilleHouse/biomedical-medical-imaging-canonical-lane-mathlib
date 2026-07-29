import HautevilleHouse.BiomedicalMedicalImagingCanonicalLaneLean.Pharmacokinetics

namespace HautevilleHouse
namespace BiomedicalMedicalImagingCanonicalLaneLean

structure SurvivalAnalysisPackage {C : CompartmentModelPackage}
    (P : PharmacokineticsPackage C) where
  hazardFunction : Float → Float
  survivalFunction : Float → Float
  censoringIndicator : Prop
  logRankTestStatistic : Float
  proportionalHazardsAssumption : Prop

def SurvivalAnalysisClosed {C : CompartmentModelPackage} {P : PharmacokineticsPackage C}
    (S : SurvivalAnalysisPackage P) : Prop :=
  S.proportionalHazardsAssumption ∧
  S.hazardFunction (0 : Float) > 0

structure SurvivalAnalysisEvidence {C : CompartmentModelPackage}
    {P : PharmacokineticsPackage C} (S : SurvivalAnalysisPackage P) where
  proportionalHazardsAssumptionClosed : S.proportionalHazardsAssumption
  baselineHazardPositive : S.hazardFunction (0 : Float) > 0

theorem survival_analysis_closed_from_evidence {C : CompartmentModelPackage}
    {P : PharmacokineticsPackage C} (S : SurvivalAnalysisPackage P)
    (E : SurvivalAnalysisEvidence S) : SurvivalAnalysisClosed S := by
  exact And.intro E.proportionalHazardsAssumptionClosed
    E.baselineHazardPositive

end BiomedicalMedicalImagingCanonicalLaneLean
end HautevilleHouse