import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineLifeCourseEpidemiologyLemmaCanonicalLaneLean

structure CompartmentModel where
  states : Type
  transitionRates : Type
  flowEquations : Prop
  identifiabilityConditions : Prop

structure CompartmentModelEvidence (M : CompartmentModel) where
  flowEquationsClosed : M.flowEquations
  identifiabilityConditionsClosed : M.identifiabilityConditions

def CompartmentModelClosed (M : CompartmentModel) : Prop :=
  M.flowEquations ∧ M.identifiabilityConditions

theorem compartment_model_closed_from_evidence (M : CompartmentModel)
    (E : CompartmentModelEvidence M) : CompartmentModelClosed M := by
  exact And.intro E.flowEquationsClosed E.identifiabilityConditionsClosed

end MedicineLifeCourseEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse