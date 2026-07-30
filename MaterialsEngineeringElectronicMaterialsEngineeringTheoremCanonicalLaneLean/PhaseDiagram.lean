import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringElectronicMaterialsEngineeringTheoremCanonicalLaneLean

structure PhaseDiagramPackage where
  phases : Type u
  transitionLines : Prop
  criticalPoints : Prop
  equilibriumConditions : Prop
  gibbsFreeEnergy : Prop

structure PhaseDiagramEvidence (P : PhaseDiagramPackage) where
  transitionLinesClosed : P.transitionLines
  criticalPointsClosed : P.criticalPoints
  equilibriumConditionsClosed : P.equilibriumConditions
  gibbsFreeEnergyClosed : P.gibbsFreeEnergy

def PhaseDiagramClosed (P : PhaseDiagramPackage) : Prop :=
  P.transitionLines ∧ P.criticalPoints ∧ P.equilibriumConditions ∧ P.gibbsFreeEnergy

theorem phase_diagram_closed_from_evidence (P : PhaseDiagramPackage)
    (E : PhaseDiagramEvidence P) : PhaseDiagramClosed P := by
  exact And.intro E.transitionLinesClosed
    (And.intro E.criticalPointsClosed
      (And.intro E.equilibriumConditionsClosed E.gibbsFreeEnergyClosed))

end MaterialsEngineeringElectronicMaterialsEngineeringTheoremCanonicalLaneLean
end HautevilleHouse