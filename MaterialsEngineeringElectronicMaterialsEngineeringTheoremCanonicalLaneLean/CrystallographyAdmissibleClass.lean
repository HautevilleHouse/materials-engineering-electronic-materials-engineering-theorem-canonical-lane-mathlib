import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringElectronicMaterialsEngineeringTheorem

structure CrystallographyAdmissibleClass where
  object : AdmittedObject
  latticeParameters : Prop
  symmetryGroup : Prop
  defectConcentration : Prop
  gateWitness : latticeParameters ∨ defectConcentration

def admittedClosure (A : CrystallographyAdmissibleClass) : Prop :=
  A.latticeParameters ∧ A.symmetryGroup

end MaterialsEngineeringElectronicMaterialsEngineeringTheorem
end HautevilleHouse