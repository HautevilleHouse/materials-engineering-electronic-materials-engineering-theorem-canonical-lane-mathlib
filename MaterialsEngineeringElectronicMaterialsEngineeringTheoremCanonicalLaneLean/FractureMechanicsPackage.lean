import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringElectronicMaterialsEngineeringTheorem

structure FractureMechanicsPackage where
  crackGeometry : String
  stressIntensityFactor : Float
  fractureToughness : Float
  crackGrowthRate : Float
  cycleCount : Nat
  fatigueThreshold : Float

structure FractureMechanicsEvidence (F : FractureMechanicsPackage) where
  crackGeometryClosed : F.crackGeometry = "Edge" ∨ F.crackGeometry = "Center" ∨ F.crackGeometry = "Penny"
  stressIntensityFactorClosed : F.stressIntensityFactor > 0
  fractureToughnessClosed : F.fractureToughness > 0
  crackGrowthRateClosed : F.crackGrowthRate ≥ 0
  cycleCountClosed : F.cycleCount ≥ 0
  fatigueThresholdClosed : F.fatigueThreshold ≥ 0

def FractureMechanicsClosed (F : FractureMechanicsPackage) : Prop :=
  (F.crackGeometry = "Edge" ∨ F.crackGeometry = "Center" ∨ F.crackGeometry = "Penny") ∧
  F.stressIntensityFactor > 0 ∧ F.fractureToughness > 0 ∧ F.crackGrowthRate ≥ 0 ∧ F.cycleCount ≥ 0 ∧ F.fatigueThreshold ≥ 0

theorem fracture_mechanics_closed_from_evidence (F : FractureMechanicsPackage) (E : FractureMechanicsEvidence F) : FractureMechanicsClosed F := by
  exact And.intro E.crackGeometryClosed (
    And.intro E.stressIntensityFactorClosed (
      And.intro E.fractureToughnessClosed (
        And.intro E.crackGrowthRateClosed (
          And.intro E.cycleCountClosed E.fatigueThresholdClosed))))

end HautevilleHouse.MaterialsEngineeringElectronicMaterialsEngineeringTheorem
end HautevilleHouse