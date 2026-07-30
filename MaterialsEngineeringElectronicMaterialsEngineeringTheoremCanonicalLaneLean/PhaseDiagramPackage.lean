import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringElectronicMaterialsEngineeringTheorem

structure PhaseDiagramPackage where
  components : Nat
  temperatureRange : Type
  compositionRange : Type
  phaseBoundaries : Prop
  equilibriumAssumption : Prop

structure PhaseDiagramEvidence (P : PhaseDiagramPackage) where
  phaseBoundariesClosed : P.phaseBoundaries
  equilibriumAssumptionClosed : P.equilibriumAssumption

def PhaseDiagramClosed (P : PhaseDiagramPackage) : Prop :=
  P.phaseBoundaries ∧ P.equilibriumAssumption

theorem phase_diagram_closed_from_evidence (P : PhaseDiagramPackage) (E : PhaseDiagramEvidence P) :
  PhaseDiagramClosed P := by
  exact And.intro E.phaseBoundariesClosed E.equilibriumAssumptionClosed

end MaterialsEngineeringElectronicMaterialsEngineeringTheorem
end HautevilleHouse
