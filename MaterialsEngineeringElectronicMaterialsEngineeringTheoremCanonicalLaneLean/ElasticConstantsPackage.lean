import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringElectronicMaterialsEngineeringTheorem

structure ElasticConstantsPackage where
  elasticStiffnessMatrix : List (List Float)
  complianceMatrix : List (List Float)
  youngModulus : Float
  poissonRatio : Float
  shearModulus : Float
  bulkModulus : Float

structure ElasticConstantsEvidence (E : ElasticConstantsPackage) where
  elasticStiffnessMatrixClosed : E.elasticStiffnessMatrix.length = 6 ∧ (∀ row ∈ E.elasticStiffnessMatrix, row.length = 6)
  complianceMatrixClosed : E.complianceMatrix.length = 6 ∧ (∀ row ∈ E.complianceMatrix, row.length = 6)
  youngModulusClosed : E.youngModulus > 0
  poissonRatioClosed : -1 < E.poissonRatio ∧ E.poissonRatio < 0.5
  shearModulusClosed : E.shearModulus > 0
  bulkModulusClosed : E.bulkModulus > 0

def ElasticConstantsClosed (E : ElasticConstantsPackage) : Prop :=
  (E.elasticStiffnessMatrix.length = 6 ∧ (∀ row ∈ E.elasticStiffnessMatrix, row.length = 6)) ∧
  (E.complianceMatrix.length = 6 ∧ (∀ row ∈ E.complianceMatrix, row.length = 6)) ∧
  E.youngModulus > 0 ∧ (-1 < E.poissonRatio ∧ E.poissonRatio < 0.5) ∧ E.shearModulus > 0 ∧ E.bulkModulus > 0

theorem elastic_constants_closed_from_evidence (E : ElasticConstantsPackage) (Ev : ElasticConstantsEvidence E) : ElasticConstantsClosed E := by
  exact And.intro Ev.elasticStiffnessMatrixClosed (
    And.intro Ev.complianceMatrixClosed (
      And.intro Ev.youngModulusClosed (
        And.intro Ev.poissonRatioClosed (
          And.intro Ev.shearModulusClosed Ev.bulkModulusClosed))))

end HautevilleHouse.MaterialsEngineeringElectronicMaterialsEngineeringTheorem
end HautevilleHouse