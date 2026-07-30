import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringElectronicMaterialsEngineeringTheoremCanonicalLaneLean

structure TransportPropertiesPackage where
  electricalConductivity : ℝ
  thermalConductivity : ℝ
  mobility : ℝ
  scatteringMechanism : Prop
  transportEquation : Prop

structure TransportPropertiesEvidence (T : TransportPropertiesPackage) where
  electricalConductivityClosed : T.electricalConductivity > 0
  thermalConductivityClosed : T.thermalConductivity > 0
  mobilityClosed : T.mobility > 0
  scatteringMechanismClosed : T.scatteringMechanism
  transportEquationClosed : T.transportEquation

def TransportPropertiesClosed (T : TransportPropertiesPackage) : Prop :=
  T.electricalConductivity > 0 ∧
  T.thermalConductivity > 0 ∧
  T.mobility > 0 ∧
  T.scatteringMechanism ∧
  T.transportEquation

theorem transport_properties_closed_from_evidence (T : TransportPropertiesPackage)
    (Ev : TransportPropertiesEvidence T) : TransportPropertiesClosed T := by
  exact And.intro Ev.electricalConductivityClosed
    (And.intro Ev.thermalConductivityClosed
      (And.intro Ev.mobilityClosed
        (And.intro Ev.scatteringMechanismClosed Ev.transportEquationClosed)))

end MaterialsEngineeringElectronicMaterialsEngineeringTheoremCanonicalLaneLean
end HautevilleHouse
