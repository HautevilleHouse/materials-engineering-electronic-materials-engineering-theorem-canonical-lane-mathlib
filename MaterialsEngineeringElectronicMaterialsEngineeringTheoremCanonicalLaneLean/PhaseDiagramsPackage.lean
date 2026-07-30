import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringElectronicMaterialsEngineeringTheoremCanonicalLaneLean

structure PhaseDiagramsPackage where
  temperatureRange : ℝ × ℝ
  compositionRange : ℝ × ℝ
  phaseBoundaries : Prop
  equilibriumPhases : Prop
  leverRule : Prop

structure PhaseDiagramsEvidence (P : PhaseDiagramsPackage) where
  temperatureRangeClosed : P.temperatureRange.1 < P.temperatureRange.2
  compositionRangeClosed : P.compositionRange.1 < P.compositionRange.2
  phaseBoundariesClosed : P.phaseBoundaries
  equilibriumPhasesClosed : P.equilibriumPhases
  leverRuleClosed : P.leverRule

def PhaseDiagramsClosed (P : PhaseDiagramsPackage) : Prop :=
  P.temperatureRange.1 < P.temperatureRange.2 ∧
  P.compositionRange.1 < P.compositionRange.2 ∧
  P.phaseBoundaries ∧
  P.equilibriumPhases ∧
  P.leverRule

theorem phase_diagrams_closed_from_evidence (P : PhaseDiagramsPackage)
    (E : PhaseDiagramsEvidence P) : PhaseDiagramsClosed P := by
  exact And.intro E.temperatureRangeClosed
    (And.intro E.compositionRangeClosed
      (And.intro E.phaseBoundariesClosed
        (And.intro E.equilibriumPhasesClosed E.leverRuleClosed)))

end MaterialsEngineeringElectronicMaterialsEngineeringTheoremCanonicalLaneLean
end HautevilleHouse
