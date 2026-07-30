import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineLifeCourseEpidemiologyLemmaCanonicalLaneLean

structure TestProperties where
  sensitivity : ℝ
  specificity : ℝ
  positiveLikelihoodRatio : ℝ
  negativeLikelihoodRatio : ℝ

def testValid (T : TestProperties) : Prop :=
  T.sensitivity ≥ 0 ∧ T.sensitivity ≤ 1 ∧
  T.specificity ≥ 0 ∧ T.specificity ≤ 1

structure DiseaseStatus where
  present : Bool
  priorProbability : ℝ

def priorValid (D : DiseaseStatus) : Prop :=
  D.priorProbability ≥ 0 ∧ D.priorProbability ≤ 1

structure PosteriorProbability (D : DiseaseStatus) (T : TestProperties) (positive : Bool) where
  value : ℝ
  valid : Prop
  validClosed : valid

def PosteriorProbabilityClosed {D : DiseaseStatus} {T : TestProperties} {positive : Bool}
    (P : PosteriorProbability D T positive) : Prop :=
  P.valid

theorem posterior_probability_closed_from_evidence {D : DiseaseStatus} {T : TestProperties}
    {positive : Bool} (P : PosteriorProbability D T positive)
    (E : posterior_probability_evidence D T positive P) :
    PosteriorProbabilityClosed P :=
  E.validClosed

structure PosteriorProbabilityEvidence {D : DiseaseStatus} {T : TestProperties}
    {positive : Bool} (P : PosteriorProbability D T positive) where
  priorValid : priorValid D
  testValid : testValid T
  validClosed : P.valid

end MedicineLifeCourseEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse