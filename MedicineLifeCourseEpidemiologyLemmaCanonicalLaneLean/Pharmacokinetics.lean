import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineLifeCourseEpidemiologyLemmaCanonicalLaneLean

structure PharmacokineticModel where
  drugConcentration : Type
  absorptionRate : Prop
  distributionVolume : Prop
  eliminationRate : Prop

structure PharmacokineticEvidence (M : PharmacokineticModel) where
  absorptionRateClosed : M.absorptionRate
  distributionVolumeClosed : M.distributionVolume
  eliminationRateClosed : M.eliminationRate

def PharmacokineticClosed (M : PharmacokineticModel) : Prop :=
  M.absorptionRate ∧ M.distributionVolume ∧ M.eliminationRate

theorem pharmacokinetic_closed_from_evidence (M : PharmacokineticModel)
    (E : PharmacokineticEvidence M) : PharmacokineticClosed M := by
  exact And.intro E.absorptionRateClosed
    (And.intro E.distributionVolumeClosed E.eliminationRateClosed)

end MedicineLifeCourseEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse