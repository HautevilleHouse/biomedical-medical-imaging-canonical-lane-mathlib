import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalMedicalImagingCanonicalLaneLean

structure ImagingBiomarkerPackage where
  radiomicsFeatures : List String
  textureAnalysis : Prop
  statisticalMoments : List ℝ
  fractalDimension : ℝ

structure ImagingBiomarkerEvidence (I : ImagingBiomarkerPackage) where
  featuresNotEmpty : I.radiomicsFeatures ≠ []
  textureAnalysisClosed : I.textureAnalysis
  momentsValid : ∀ x ∈ I.statisticalMoments, x ≠ 0
  fractalDimensionPositive : I.fractalDimension > 0

def ImagingBiomarkerClosed (I : ImagingBiomarkerPackage) : Prop :=
  I.radiomicsFeatures ≠ [] ∧ I.textureAnalysis ∧ (∀ x ∈ I.statisticalMoments, x ≠ 0) ∧ I.fractalDimension > 0

theorem imaging_biomarker_closed_from_evidence (I : ImagingBiomarkerPackage) (E : ImagingBiomarkerEvidence I) :
    ImagingBiomarkerClosed I := by
  refine And.intro E.featuresNotEmpty (And.intro E.textureAnalysisClosed (And.intro E.momentsValid E.fractalDimensionPositive))

end BiomedicalMedicalImagingCanonicalLaneLean
end HautevilleHouse