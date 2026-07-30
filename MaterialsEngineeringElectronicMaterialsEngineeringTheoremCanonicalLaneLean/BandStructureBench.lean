import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringElectronicMaterialsEngineeringTheorem

structure BandStructureBench where
  crystalPotential : Type
  schrodingerEquation : Prop
  periodicBoundary : Prop
  eigenstateComputed : Prop
  bandGapDetermined : Prop

structure BandStructureEvidence (B : BandStructureBench) where
  schrodingerEquationClosed : B.schrodingerEquation
  periodicBoundaryClosed : B.periodicBoundary
  eigenstateComputedClosed : B.eigenstateComputed
  bandGapDeterminedClosed : B.bandGapDetermined

def BandStructureClosed (B : BandStructureBench) : Prop :=
  B.schrodingerEquation ∧ B.periodicBoundary ∧ B.eigenstateComputed ∧ B.bandGapDetermined

theorem band_structure_closed_from_evidence (B : BandStructureBench) (E : BandStructureEvidence B) :
  BandStructureClosed B := by
  exact And.intro E.schrodingerEquationClosed
    (And.intro E.periodicBoundaryClosed
      (And.intro E.eigenstateComputedClosed E.bandGapDeterminedClosed))

end MaterialsEngineeringElectronicMaterialsEngineeringTheorem
end HautevilleHouse
