import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringElectronicMaterialsEngineeringTheorem

structure PhaseDiagram where
  phases : List String
  boundaries : Prop
  equilibriumConditions : Prop
  stabilityRegions : Prop
  ternaryEutectics : Prop

structure PhaseDiagramEvidence (P : PhaseDiagram) where
  boundariesClosed : P.boundaries
  equilibriumConditionsClosed : P.equilibriumConditions
  stabilityRegionsClosed : P.stabilityRegions
  ternaryEutecticsClosed : P.ternaryEutectics

def PhaseDiagramClosed (P : PhaseDiagram) : Prop :=
  P.boundaries ∧ P.equilibriumConditions ∧ P.stabilityRegions ∧ P.ternaryEutectics

theorem phase_diagram_closed_from_evidence (P : PhaseDiagram) (E : PhaseDiagramEvidence P) : PhaseDiagramClosed P := by
  exact And.intro E.boundariesClosed (And.intro E.equilibriumConditionsClosed (And.intro E.stabilityRegionsClosed E.ternaryEutecticsClosed))

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  exact A.gateWitness

end MaterialsEngineeringElectronicMaterialsEngineeringTheorem
end HautevilleHouse