import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringElectronicMaterialsEngineeringTheoremCanonicalLaneLean

structure ElasticityTensorPackage where
  stiffnessMatrix : Type u
  complianceMatrix : Type v
  youngModulus : Prop
  poissonRatio : Prop
  shearModulus : Prop
  anisotropyFactor : Prop

structure ElasticityTensorEvidence (E : ElasticityTensorPackage) where
  youngModulusClosed : E.youngModulus
  poissonRatioClosed : E.poissonRatio
  shearModulusClosed : E.shearModulus
  anisotropyFactorClosed : E.anisotropyFactor

def ElasticityTensorClosed (E : ElasticityTensorPackage) : Prop :=
  E.youngModulus ∧ E.poissonRatio ∧ E.shearModulus ∧ E.anisotropyFactor

theorem elasticity_tensor_closed_from_evidence (E : ElasticityTensorPackage)
    (Ev : ElasticityTensorEvidence E) : ElasticityTensorClosed E := by
  exact And.intro Ev.youngModulusClosed
    (And.intro Ev.poissonRatioClosed
      (And.intro Ev.shearModulusClosed Ev.anisotropyFactorClosed))

end MaterialsEngineeringElectronicMaterialsEngineeringTheoremCanonicalLaneLean
end HautevilleHouse