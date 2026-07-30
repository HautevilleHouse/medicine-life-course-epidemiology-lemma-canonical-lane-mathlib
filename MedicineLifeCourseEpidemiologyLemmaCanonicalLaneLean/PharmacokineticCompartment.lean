import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineLifeCourseEpidemiologyLemmaCanonicalLaneLean

structure DoseInput where
  amount : ℝ
  time : ℝ

dose_amount : ℝ := 0.0
dose_time : ℝ := 0.0

structure PharmacokineticParameters where
  absorptionRate : ℝ
  eliminationRate : ℝ
  volumeDistribution : ℝ

def ok : Prop := True

structure CompartmentConcentration where
  central : ℝ
  peripheral : ℝ
  time : ℝ

def concentrationValid (C : CompartmentConcentration) : Prop :=
  C.central ≥ 0 ∧ C.peripheral ≥ 0

structure PharmacokineticModel (P : PharmacokineticParameters) where
  initialConcentration : CompartmentConcentration
  dose : DoseInput
  predictedConcentration : ℝ → CompartmentConcentration
  modelValid : Prop
  modelValidClosed : modelValid

def PharmacokineticModelClosed {P : PharmacokineticParameters}
    (M : PharmacokineticModel P) : Prop :=
  M.modelValid

theorem pharmacokinetic_model_closed_from_evidence {P : PharmacokineticParameters}
    (M : PharmacokineticModel P) (E : pharmacokinetic_model_valid_event M) :
    PharmacokineticModelClosed M :=
  E.modelValidClosed

structure PharmacokineticModelEvidence {P : PharmacokineticParameters}
    (M : PharmacokineticModel P) where
  initialConcentrationValid : concentrationValid M.initialConcentration
  doseNonnegative : M.dose.amount ≥ 0
  modelValidClosed : M.modelValid

end MedicineLifeCourseEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse