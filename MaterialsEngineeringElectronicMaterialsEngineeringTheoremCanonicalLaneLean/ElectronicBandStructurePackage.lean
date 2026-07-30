import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringElectronicMaterialsEngineeringTheoremCanonicalLaneLean

structure ElectronicBandStructurePackage where
  bandGap : ℝ
  effectiveMass : ℝ
  densityOfStates : Prop
  brillouinZone : Prop
  carrierConcentration : Prop

structure ElectronicBandStructureEvidence (E : ElectronicBandStructurePackage) where
  bandGapClosed : E.bandGap ≥ 0
  effectiveMassClosed : E.effectiveMass > 0
  densityOfStatesClosed : E.densityOfStates
  brillouinZoneClosed : E.brillouinZone
  carrierConcentrationClosed : E.carrierConcentration

def ElectronicBandStructureClosed (E : ElectronicBandStructurePackage) : Prop :=
  E.bandGap ≥ 0 ∧
  E.effectiveMass > 0 ∧
  E.densityOfStates ∧
  E.brillouinZone ∧
  E.carrierConcentration

theorem electronic_band_structure_closed_from_evidence (E : ElectronicBandStructurePackage)
    (Ev : ElectronicBandStructureEvidence E) : ElectronicBandStructureClosed E := by
  exact And.intro Ev.bandGapClosed
    (And.intro Ev.effectiveMassClosed
      (And.intro Ev.densityOfStatesClosed
        (And.intro Ev.brillouinZoneClosed Ev.carrierConcentrationClosed)))

end MaterialsEngineeringElectronicMaterialsEngineeringTheoremCanonicalLaneLean
end HautevilleHouse
