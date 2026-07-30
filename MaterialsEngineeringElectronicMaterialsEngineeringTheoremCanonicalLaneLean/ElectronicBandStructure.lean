import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringElectronicMaterialsEngineeringTheoremCanonicalLaneLean

structure ElectronicBandStructurePackage where
  brillouinZone : Type u
  bandGap : Prop
  effectiveMass : Prop
  densityOfStates : Prop
  fermiLevel : Prop
  carrierMobility : Prop

structure ElectronicBandStructureEvidence (E : ElectronicBandStructurePackage) where
  bandGapClosed : E.bandGap
  effectiveMassClosed : E.effectiveMass
  densityOfStatesClosed : E.densityOfStates
  fermiLevelClosed : E.fermiLevel
  carrierMobilityClosed : E.carrierMobility

def ElectronicBandStructureClosed (E : ElectronicBandStructurePackage) : Prop :=
  E.bandGap ∧ E.effectiveMass ∧ E.densityOfStates ∧ E.fermiLevel ∧ E.carrierMobility

theorem electronic_band_structure_closed_from_evidence (E : ElectronicBandStructurePackage)
    (Ev : ElectronicBandStructureEvidence E) : ElectronicBandStructureClosed E := by
  exact And.intro Ev.bandGapClosed
    (And.intro Ev.effectiveMassClosed
      (And.intro Ev.densityOfStatesClosed
        (And.intro Ev.fermiLevelClosed Ev.carrierMobilityClosed)))

end MaterialsEngineeringElectronicMaterialsEngineeringTheoremCanonicalLaneLean
end HautevilleHouse