import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineLifeCourseEpidemiologyLemmaCanonicalLaneLean

structure TimeToEvent where
  time : ℝ
  eventOccurred : Bool

data HazardModel (covariates : Type) where
  proportional : (covariates → ℝ) → HazardModel covariates
  acceleratedFailure : (covariates → ℝ) → HazardModel covariates

def survivalFunction (h : ℝ → ℝ) (t : ℝ) : ℝ :=
  Real.exp (-∫ s in (0:ℝ)..t, h s)

structure KaplanMeierEstimator where
  times : List ℝ
  survivalEstimates : List ℝ
  valid : Prop
  validClosed : valid

def KaplanMeierEstimatorClosed (K : KaplanMeierEstimator) : Prop :=
  K.valid

theorem kaplan_meier_estimator_closed_from_evidence (K : KaplanMeierEstimator)
    (E : kaplan_meier_evidence K) : KaplanMeierEstimatorClosed K :=
  E.validClosed

structure KaplanMeierEvidence (K : KaplanMeierEstimator) where
  timesIncreasing : ∀ {a b : ℝ}, a ∈ K.times → b ∈ K.times → a < b
  survivalNonincreasing : ∀ {x y : ℝ}, x ∈ K.survivalEstimates → y ∈ K.survivalEstimates → x ≥ y
  validClosed : K.valid

end MedicineLifeCourseEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse