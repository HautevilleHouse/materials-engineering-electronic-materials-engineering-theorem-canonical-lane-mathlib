import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringElectronicMaterialsEngineeringTheoremCanonicalLaneLean

structure ElasticityPackage where
  youngModulus : ℝ
  poissonRatio : ℝ
  elasticTensor : Prop
  isotropicBehavior : Prop
  stressStrainRelation : Prop

structure ElasticityEvidence (E : ElasticityPackage) where
  youngModulusClosed : E.youngModulus > 0
  poissonRatioClosed : -1 < E.poissonRatio ∧ E.poissonRatio < 0.5
  elasticTensorClosed : E.elasticTensor
  isotropicBehaviorClosed : E.isotropicBehavior
  stressStrainRelationClosed : E.stressStrainRelation

def ElasticityClosed (E : ElasticityPackage) : Prop :=
  E.youngModulus > 0 ∧
  -1 < E.poissonRatio ∧ E.poissonRatio < 0.5 ∧
  E.elasticTensor ∧
  E.isotropicBehavior ∧
  E.stressStrainRelation

theorem elasticity_closed_from_evidence (E : ElasticityPackage)
    (Ev : ElasticityEvidence E) : ElasticityClosed E := by
  have h1 : E.youngModulus > 0 := Ev.youngModulusClosed
  have h2 : -1 < E.poissonRatio ∧ E.poissonRatio < 0.5 := Ev.poissonRatioClosed
  exact And.intro h1 (And.intro h2.1 (And.intro h2.2 (And.intro Ev.elasticTensorClosed
    (And.intro Ev.isotropicBehaviorClosed Ev.stressStrainRelationClosed))))

end MaterialsEngineeringElectronicMaterialsEngineeringTheoremCanonicalLaneLean
end HautevilleHouse
