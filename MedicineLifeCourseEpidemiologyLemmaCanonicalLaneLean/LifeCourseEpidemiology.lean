import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineLifeCourseEpidemiologyLemmaCanonicalLaneLean

structure LifeCourseEpidemiologyPackage where
  criticalPeriods : Prop
  accumulationOfRisk : Prop
  trajectoryModels : Prop
  latencyPeriods : Prop
  socialDeterminants : Prop
  earlyLifeExposures : Prop

def LifeCourseEpidemiologyClosed (L : LifeCourseEpidemiologyPackage) : Prop :=
  L.criticalPeriods ∧ L.accumulationOfRisk ∧ L.trajectoryModels ∧
  L.latencyPeriods ∧ L.socialDeterminants ∧ L.earlyLifeExposures

structure LifeCourseEpidemiologyEvidence (L : LifeCourseEpidemiologyPackage) where
  criticalPeriodsClosed : L.criticalPeriods
  accumulationOfRiskClosed : L.accumulationOfRisk
  trajectoryModelsClosed : L.trajectoryModels
  latencyPeriodsClosed : L.latencyPeriods
  socialDeterminantsClosed : L.socialDeterminants
  earlyLifeExposuresClosed : L.earlyLifeExposures

theorem life_course_epidemiology_closed_from_evidence
    (L : LifeCourseEpidemiologyPackage)
    (E : LifeCourseEpidemiologyEvidence L) : LifeCourseEpidemiologyClosed L := by
  exact And.intro E.criticalPeriodsClosed
    (And.intro E.accumulationOfRiskClosed
      (And.intro E.trajectoryModelsClosed
        (And.intro E.latencyPeriodsClosed
          (And.intro E.socialDeterminantsClosed E.earlyLifeExposuresClosed))))

end MedicineLifeCourseEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse