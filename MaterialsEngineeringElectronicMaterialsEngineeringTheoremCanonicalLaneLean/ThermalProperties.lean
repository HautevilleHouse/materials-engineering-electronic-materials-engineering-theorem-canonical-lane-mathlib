import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringElectronicMaterialsEngineeringTheoremCanonicalLaneLean

structure ThermalPropertiesPackage where
  thermalConductivity : Prop
  thermalExpansion : Prop
  specificHeat : Prop
  debyeTemperature : Prop
  thermalDiffusivity : Prop

structure ThermalPropertiesEvidence (T : ThermalPropertiesPackage) where
  thermalConductivityClosed : T.thermalConductivity
  thermalExpansionClosed : T.thermalExpansion
  specificHeatClosed : T.specificHeat
  debyeTemperatureClosed : T.debyeTemperature
  thermalDiffusivityClosed : T.thermalDiffusivity

def ThermalPropertiesClosed (T : ThermalPropertiesPackage) : Prop :=
  T.thermalConductivity ∧ T.thermalExpansion ∧ T.specificHeat ∧ T.debyeTemperature ∧ T.thermalDiffusivity

theorem thermal_properties_closed_from_evidence (T : ThermalPropertiesPackage)
    (E : ThermalPropertiesEvidence T) : ThermalPropertiesClosed T := by
  exact And.intro E.thermalConductivityClosed
    (And.intro E.thermalExpansionClosed
      (And.intro E.specificHeatClosed
        (And.intro E.debyeTemperatureClosed E.thermalDiffusivityClosed)))

end MaterialsEngineeringElectronicMaterialsEngineeringTheoremCanonicalLaneLean
end HautevilleHouse