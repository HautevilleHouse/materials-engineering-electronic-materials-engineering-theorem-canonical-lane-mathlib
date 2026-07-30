import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringElectronicMaterialsEngineeringTheoremCanonicalLaneLean

structure CrystalStructurePackage where
  lattice : Type u
  basisVectors : lattice → Type v
  unitCellVolume : Prop
  symmetryGroup : Prop
  bravaisLatticeType : Prop
  latticeParameters : Prop

structure CrystalStructureEvidence (C : CrystalStructurePackage) where
  unitCellVolumeClosed : C.unitCellVolume
  symmetryGroupClosed : C.symmetryGroup
  bravaisLatticeTypeClosed : C.bravaisLatticeType
  latticeParametersClosed : C.latticeParameters

def CrystalStructureClosed (C : CrystalStructurePackage) : Prop :=
  C.unitCellVolume ∧ C.symmetryGroup ∧ C.bravaisLatticeType ∧ C.latticeParameters

theorem crystal_structure_closed_from_evidence (C : CrystalStructurePackage)
    (E : CrystalStructureEvidence C) : CrystalStructureClosed C := by
  exact And.intro E.unitCellVolumeClosed
    (And.intro E.symmetryGroupClosed
      (And.intro E.bravaisLatticeTypeClosed E.latticeParametersClosed))

end MaterialsEngineeringElectronicMaterialsEngineeringTheoremCanonicalLaneLean
end HautevilleHouse