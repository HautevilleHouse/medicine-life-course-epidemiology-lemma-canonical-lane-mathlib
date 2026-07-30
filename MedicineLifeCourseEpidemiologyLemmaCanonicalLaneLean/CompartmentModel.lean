import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineLifeCourseEpidemiologyLemmaCanonicalLaneLean

structure CompartmentModelPackage where
  compartmentCount : Nat
  transferRates : Prop
  initialConditions : Prop
  steadyStateSolution : Prop
  homogeneous : Prop
  irreducible : Prop

def CompartmentModelClosed (M : CompartmentModelPackage) : Prop :=
  M.transferRates ∧ M.initialConditions ∧ M.steadyStateSolution ∧
  M.homogeneous ∧ M.irreducible

structure CompartmentModelEvidence (M : CompartmentModelPackage) where
  transferRatesClosed : M.transferRates
  initialConditionsClosed : M.initialConditions
  steadyStateSolutionClosed : M.steadyStateSolution
  homogeneousClosed : M.homogeneous
  irreducibleClosed : M.irreducible

theorem compartment_model_closed_from_evidence (M : CompartmentModelPackage)
    (E : CompartmentModelEvidence M) : CompartmentModelClosed M := by
  exact And.intro E.transferRatesClosed
    (And.intro E.initialConditionsClosed
      (And.intro E.steadyStateSolutionClosed
        (And.intro E.homogeneousClosed E.irreducibleClosed)))

end MedicineLifeCourseEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse