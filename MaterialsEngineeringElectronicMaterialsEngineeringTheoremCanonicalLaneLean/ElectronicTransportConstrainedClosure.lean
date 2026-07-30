import canonicalLaneMathlib.AdmissibleClass
import CrystallographyAdmissibleClass
import PhaseDiagramBridge
import ElasticityGate
import FractureMechanicsEvidence

namespace HautevilleHouse
namespace MaterialsEngineeringElectronicMaterialsEngineeringTheorem

def ConstrainedElectronicTransportClosure (A : CrystallographyAdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_electronic_transport_endgame (A : CrystallographyAdmissibleClass) :
    ConstrainedElectronicTransportClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end MaterialsEngineeringElectronicMaterialsEngineeringTheorem
end HautevilleHouse