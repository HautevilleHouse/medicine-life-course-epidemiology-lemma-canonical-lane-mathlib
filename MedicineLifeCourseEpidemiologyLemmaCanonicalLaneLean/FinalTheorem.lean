import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineLifeCourseEpidemiologyLemmaCanonicalLaneLean

open HautevilleHouse
open MedicineLifeCourseEpidemiologyLemmaCanonicalLaneLean

def ConstrainedEpidemiologyClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_epidemiology_endgame (A : AdmissibleClass) :
    ConstrainedEpidemiologyClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end MedicineLifeCourseEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse