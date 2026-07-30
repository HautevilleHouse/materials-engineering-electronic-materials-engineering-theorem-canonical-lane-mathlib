import canonicalLaneMathlib.AdmissibleClass
import CrystallographyAdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringElectronicMaterialsEngineeringTheorem

def gateClosed (A : CrystallographyAdmissibleClass) : Prop :=
  A.latticeParameters ∨ A.defectConcentration

theorem gate_from_admissible_class (A : CrystallographyAdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end MaterialsEngineeringElectronicMaterialsEngineeringTheorem
end HautevilleHouse