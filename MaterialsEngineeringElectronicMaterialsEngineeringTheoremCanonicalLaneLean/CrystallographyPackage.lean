import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringElectronicMaterialsEngineeringTheoremCanonicalLaneLean

structure CrystallographyPackage where
  latticeType : String
  unitCellVolume : ℝ
  bravaisLattice : Prop
  symmetryGroup : Prop
  crystalStructure : Prop

structure CrystallographyEvidence (C : CrystallographyPackage) where
  latticeTypeClosed : C.latticeType = "FCC" ∨ C.latticeType = "BCC" ∨ C.latticeType = "HCP"
  unitCellVolumeClosed : C.unitCellVolume > 0
  bravaisLatticeClosed : C.bravaisLattice
  symmetryGroupClosed : C.symmetryGroup
  crystalStructureClosed : C.crystalStructure

def CrystallographyClosed (C : CrystallographyPackage) : Prop :=
  (C.latticeType = "FCC" ∨ C.latticeType = "BCC" ∨ C.latticeType = "HCP") ∧
  C.unitCellVolume > 0 ∧
  C.bravaisLattice ∧
  C.symmetryGroup ∧
  C.crystalStructure

theorem crystallography_closed_from_evidence (C : CrystallographyPackage)
    (E : CrystallographyEvidence C) : CrystallographyClosed C := by
  exact And.intro E.latticeTypeClosed
    (And.intro E.unitCellVolumeClosed
      (And.intro E.bravaisLatticeClosed
        (And.intro E.symmetryGroupClosed E.crystalStructureClosed)))

end MaterialsEngineeringElectronicMaterialsEngineeringTheoremCanonicalLaneLean
end HautevilleHouse
