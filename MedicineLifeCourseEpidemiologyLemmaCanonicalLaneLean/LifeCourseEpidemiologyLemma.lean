import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineLifeCourseEpidemiologyLemmaCanonicalLaneLean

structure LifeCourseEpidemiologyLemmaPackage where
  longitudinalData : Prop
  criticalPeriods : Prop
  accumulationModel : Prop
  socialDeterminants : Prop
  interactionTerms : Prop
  lemmaClosure : Prop

structure LifeCourseEpidemiologyLemmaEvidence (L : LifeCourseEpidemiologyLemmaPackage) where
  longitudinalDataClosed : L.longitudinalData
  criticalPeriodsClosed : L.criticalPeriods
  accumulationModelClosed : L.accumulationModel
  socialDeterminantsClosed : L.socialDeterminants
  interactionTermsClosed : L.interactionTerms
  lemmaClosureClosed : L.lemmaClosure

def LifeCourseEpidemiologyLemmaClosed (L : LifeCourseEpidemiologyLemmaPackage) : Prop :=
  L.longitudinalData ∧ L.criticalPeriods ∧ L.accumulationModel ∧ L.socialDeterminants ∧ L.interactionTerms ∧ L.lemmaClosure

theorem life_course_epidemiology_lemma_closed_from_evidence (L : LifeCourseEpidemiologyLemmaPackage) (E : LifeCourseEpidemiologyLemmaEvidence L) : LifeCourseEpidemiologyLemmaClosed L := by
  exact And.intro E.longitudinalDataClosed
    (And.intro E.criticalPeriodsClosed
      (And.intro E.accumulationModelClosed
        (And.intro E.socialDeterminantsClosed
          (And.intro E.interactionTermsClosed E.lemmaClosureClosed))))

end MedicineLifeCourseEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse