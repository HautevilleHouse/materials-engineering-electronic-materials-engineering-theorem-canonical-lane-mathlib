import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringElectronicMaterialsEngineeringTheorem

structure CrystalStructurePackage where
  latticeType : String
  fractionalCoordinates : List (Float × Float × Float)
  spaceGroup : String
  unitCellParameters : Float × Float × Float × Float × Float × Float
  atomsPerUnitCell : Nat
  bravaisLatticeIndex : Nat

structure CrystalStructureEvidence (C : CrystalStructurePackage) where
  latticeTypeClosed : C.latticeType = "FCC" ∨ C.latticeType = "BCC" ∨ C.latticeType = "HCP" ∨ C.latticeType = "Diamond" ∨ C.latticeType = "Other"
  fractionalCoordinatesClosed : C.fractionalCoordinates.length = C.atomsPerUnitCell
  spaceGroupClosed : C.spaceGroup ≠ ""
  unitCellParametersClosed : (C.unitCellParameters.1 > 0) ∧ (C.unitCellParameters.2 > 0) ∧ (C.unitCellParameters.3 > 0)

def CrystalStructureClosed (C : CrystalStructurePackage) : Prop :=
  C.latticeType = "FCC" ∨ C.latticeType = "BCC" ∨ C.latticeType = "HCP" ∨ C.latticeType = "Diamond" ∨ C.latticeType = "Other" ∧
  C.fractionalCoordinates.length = C.atomsPerUnitCell ∧
  C.spaceGroup ≠ "" ∧
  (C.unitCellParameters.1 > 0) ∧ (C.unitCellParameters.2 > 0) ∧ (C.unitCellParameters.3 > 0)

theorem crystal_structure_closed_from_evidence (C : CrystalStructurePackage) (E : CrystalStructureEvidence C) : CrystalStructureClosed C := by
  exact And.intro E.latticeTypeClosed (
    And.intro E.fractionalCoordinatesClosed (
      And.intro E.spaceGroupClosed (And.intro E.unitCellParametersClosed.1 E.unitCellParametersClosed.2)))

end HautevilleHouse.MaterialsEngineeringElectronicMaterialsEngineeringTheorem
end HautevilleHouse