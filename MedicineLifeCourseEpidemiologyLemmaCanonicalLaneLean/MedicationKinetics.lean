import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineLifeCourseEpidemiologyLemmaCanonicalLaneLean

structure MedicationKineticsPackage where
  absorptionRate : Prop
  distributionVolume : Prop
  eliminationHalfLife : Prop
  steadyStateConcentration : Prop
  linearKinetics : Prop
  compartmentCount : Nat
  timeCourse : Prop

structure MedicationKineticsEvidence (M : MedicationKineticsPackage) where
  absorptionRateClosed : M.absorptionRate
  distributionVolumeClosed : M.distributionVolume
  eliminationHalfLifeClosed : M.eliminationHalfLife
  steadyStateConcentrationClosed : M.steadyStateConcentration
  linearKineticsClosed : M.linearKinetics
  timeCourseClosed : M.timeCourse

def MedicationKineticsClosed (M : MedicationKineticsPackage) : Prop :=
  M.absorptionRate ∧ M.distributionVolume ∧ M.eliminationHalfLife ∧
  M.steadyStateConcentration ∧ M.linearKinetics ∧ M.timeCourse

theorem medication_kinetics_closed_from_evidence (M : MedicationKineticsPackage)
    (E : MedicationKineticsEvidence M) : MedicationKineticsClosed M := by
  exact And.intro E.absorptionRateClosed
    (And.intro E.distributionVolumeClosed
      (And.intro E.eliminationHalfLifeClosed
        (And.intro E.steadyStateConcentrationClosed
          (And.intro E.linearKineticsClosed E.timeCourseClosed))))

end MedicineLifeCourseEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse