import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineLifeCourseEpidemiologyLemmaCanonicalLaneLean

structure BiomarkerModel where
  temporalProfile : Type
  naturalVariability : Prop
  measurementError : Prop
  biologicalThresholds : Prop
  predictiveValue : Prop

structure BiomarkerEvidence (B : BiomarkerModel) where
  naturalVariabilityClosed : B.naturalVariability
  measurementErrorClosed : B.measurementError
  biologicalThresholdsClosed : B.biologicalThresholds
  predictiveValueClosed : B.predictiveValue

def BiomarkerClosed (B : BiomarkerModel) : Prop :=
  B.naturalVariability ∧ B.measurementError ∧
  B.biologicalThresholds ∧ B.predictiveValue

theorem biomarker_closed_from_evidence (B : BiomarkerModel)
    (E : BiomarkerEvidence B) : BiomarkerClosed B := by
  exact And.intro E.naturalVariabilityClosed
    (And.intro E.measurementErrorClosed
      (And.intro E.biologicalThresholdsClosed E.predictiveValueClosed))

end MedicineLifeCourseEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse