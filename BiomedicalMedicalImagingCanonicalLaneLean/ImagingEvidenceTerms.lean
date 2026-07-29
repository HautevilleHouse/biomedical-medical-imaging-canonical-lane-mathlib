import HautevilleHouse.BiomedicalMedicalImagingCanonicalLaneLean.CompartmentModel

namespace HautevilleHouse
namespace BiomedicalMedicalImagingCanonicalLaneLean

structure ScannerCalibrationEvidenceTerms (S : ScannerCalibrationCertificate) where
  geometricCalibrationClosed : S.geometricCalibration
  intensityCalibrationClosed : S.intensityCalibration
  calibrationClosed : ScannerCalibrationClosed S.calibrationEvidence

def ScannerCalibrationCertificate.evidenceTerms
    (S : ScannerCalibrationCertificate) : ScannerCalibrationEvidenceTerms S := {
  geometricCalibrationClosed := S.geometricCalibrationClosed,
  intensityCalibrationClosed := S.intensityCalibrationClosed,
  calibrationClosed := scanner_calibration_closed_from_evidence S S.calibrationEvidence
}

structure TracerKineticsEvidenceTerms {I : ImagingAnalyticFoundation}
    (T : TracerKineticsCertificate I) where
  inflowModelClosed : T.inflowModel
  uptakeModelClosed : T.uptakeModel
  washoutModelClosed : T.washoutModel
  kineticsClosed : CompartmentModelClosed T.kineticsPackage

def TracerKineticsCertificate.evidenceTerms {I : ImagingAnalyticFoundation}
    (T : TracerKineticsCertificate I) : TracerKineticsEvidenceTerms T := {
  inflowModelClosed := T.inflowModelClosed,
  uptakeModelClosed := T.uptakeModelClosed,
  washoutModelClosed := T.washoutModelClosed,
  kineticsClosed := compartment_model_closed_from_evidence T.kineticsPackage T.kineticsEvidence
}

structure DiagnosticAccuracyEvidenceTerms (D : DiagnosticAccuracyCertificate) where
  sensitivityClosed : D.sensitivity
  specificityClosed : D.specificity
  rocAUCClosed : D.rocAUC
  accuracyClosed : DiagnosticAccuracyClosed D

def DiagnosticAccuracyCertificate.evidenceTerms
    (D : DiagnosticAccuracyCertificate) : DiagnosticAccuracyEvidenceTerms D := {
  sensitivityClosed := D.sensitivityClosed,
  specificityClosed := D.specificityClosed,
  rocAUCClosed := D.rocAUCClosed,
  accuracyClosed := diagnostic_accuracy_closed_from_evidence D D.accuracyEvidence
}

structure SurvivalAnalysisEvidenceTerms (S : SurvivalAnalysisCertificate) where
  kaplanMeierClosed : S.kaplanMeier
  coxModelClosed : S.coxModel
  survivalClosed : SurvivalAnalysisClosed S

def SurvivalAnalysisCertificate.evidenceTerms
    (S : SurvivalAnalysisCertificate) : SurvivalAnalysisEvidenceTerms S := {
  kaplanMeierClosed := S.kaplanMeierClosed,
  coxModelClosed := S.coxModelClosed,
  survivalClosed := survival_analysis_closed_from_evidence S S.survivalEvidence
}

end BiomedicalMedicalImagingCanonicalLaneLean
end HautevilleHouse