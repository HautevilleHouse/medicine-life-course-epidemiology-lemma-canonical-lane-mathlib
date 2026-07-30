import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineLifeCourseEpidemiologyLemmaCanonicalLaneLean

structure CompartmentState where
  susceptible : ℕ
  exposed : ℕ
  infected : ℕ
  recovered : ℕ

def ok : Prop := True

structure CompartmentTransition where
  source : CompartmentState
  target : CompartmentState
  rate : ℝ
  valid : Prop
  validClosed : valid

structure CompartmentTransitionEvidence (T : CompartmentTransition) where
  sourceValid : T.source.ok
  ratePositive : T.rate ≥ 0
  transitionValid : T.valid
  transitionValidClosed : transitionValid

def CompartmentTransitionClosed (T : CompartmentTransition) : Prop :=
  T.valid

theorem compartment_transition_closed_from_evidence (T : CompartmentTransition)
    (E : CompartmentTransitionEvidence T) : CompartmentTransitionClosed T :=
  E.transitionValidClosed

end MedicineLifeCourseEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse