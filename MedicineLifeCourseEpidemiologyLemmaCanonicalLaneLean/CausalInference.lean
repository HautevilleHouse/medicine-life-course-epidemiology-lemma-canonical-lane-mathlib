import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineLifeCourseEpidemiologyLemmaCanonicalLaneLean

structure CausalModel where
  directedAcyclicGraph : Type
  counterfactualConsistency : Prop
  exchangeability : Prop
  positivity : Prop
  noUnmeasuredConfounding : Prop

structure CausalEvidence (C : CausalModel) where
  counterfactualConsistencyClosed : C.counterfactualConsistency
  exchangeabilityClosed : C.exchangeability
  positivityClosed : C.positivity
  noUnmeasuredConfoundingClosed : C.noUnmeasuredConfounding

def CausalClosed (C : CausalModel) : Prop :=
  C.counterfactualConsistency ∧ C.exchangeability ∧
  C.positivity ∧ C.noUnmeasuredConfounding

theorem causal_closed_from_evidence (C : CausalModel)
    (E : CausalEvidence C) : CausalClosed C := by
  exact And.intro E.counterfactualConsistencyClosed
    (And.intro E.exchangeabilityClosed
      (And.intro E.positivityClosed E.noUnmeasuredConfoundingClosed))

end MedicineLifeCourseEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse