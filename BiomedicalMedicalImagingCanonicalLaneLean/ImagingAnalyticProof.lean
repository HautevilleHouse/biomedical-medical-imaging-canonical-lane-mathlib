import HautevilleHouse.BiomedicalMedicalImagingCanonicalLaneLean.SurvivalAnalysis

namespace HautevilleHouse
namespace BiomedicalMedicalImagingCanonicalLaneLean

structure ScannerCalibrationCertificate where
  geometricCalibration : Prop
  intensityCalibration : Prop
  geometricCalibrationClosed : geometricCalibration
  intensityCalibrationClosed : intensityCalibration
  calibrationEvidence : ScannerCalibrationEvidence

structure TracerKineticsCertificate {I : ImagingAnalyticFoundation} where
  inflowModel : Prop
  uptakeModel : Prop
  washoutModel : Prop
  inflowModelClosed : inflowModel
  uptakeModelClosed : uptakeModel
  washoutModelClosed : washoutModel
  kineticsPackage : CompartmentModelPackage I
  kineticsEvidence : CompartmentModelEvidence kineticsPackage

structure DiagnosticAccuracyCertificate where
  sensitivity : Prop
  specificity : Prop
  rocAUC : Prop
  sensitivityClosed : sensitivity
  specificityClosed : specificity
  rocAUCClosed : rocAUC
  accuracyEvidence : DiagnosticAccuracyEvidence

def ScannerCalibrationClosed (S : ScannerCalibrationCertificate) : Prop := 
  S.geometricCalibration ∧ S.intensityCalibration

theorem scanner_calibration_closed_from_evidence
    (S : ScannerCalibrationCertificate) (E : ScannerCalibrationEvidence) :
    ScannerCalibrationClosed S := by
  exact And.intro S.geometricCalibrationClosed S.intensityCalibrationClosed

def DiagnosticAccuracyClosed (D : DiagnosticAccuracyCertificate) : Prop := 
  D.sensitivity ∧ D.specificity ∧ D.rocAUC

theorem diagnostic_accuracy_closed_from_evidence
    (D : DiagnosticAccuracyCertificate) (E : DiagnosticAccuracyEvidence) :
    DiagnosticAccuracyClosed D := by
  exact And.intro D.sensitivityClosed (And.intro D.specificityClosed D.rocAUCClosed)

structure ImagingAnalyticFoundation where
  scanner : ScannerCalibrationCertificate
  tracer : TracerKineticsCertificate
  diagnostic : DiagnosticAccuracyCertificate
  survival : SurvivalAnalysisCertificate

def ImagingAnalyticFoundationClosed (A : ImagingAnalyticFoundation) : Prop :=
  ScannerCalibrationClosed A.scanner ∧
  CompartmentModelClosed A.tracer.kineticsPackage ∧
  DiagnosticAccuracyClosed A.diagnostic ∧
  SurvivalAnalysisClosed A.survival

theorem imaging_analytic_foundation_closed_from_evidence
    (A : ImagingAnalyticFoundation) : ImagingAnalyticFoundationClosed A := by
  refine And.intro ?_ (And.intro ?_ (And.intro ?_ ?_))
  · exact scanner_calibration_closed_from_evidence A.scanner A.scanner.calibrationEvidence
  · exact compartment_model_closed_from_evidence A.tracer.kineticsPackage A.tracer.kineticsEvidence
  · exact diagnostic_accuracy_closed_from_evidence A.diagnostic A.diagnostic.accuracyEvidence
  · exact survival_analysis_closed_from_evidence A.survival A.survival.survivalEvidence

end BiomedicalMedicalImagingCanonicalLaneLean
end HautevilleHouse