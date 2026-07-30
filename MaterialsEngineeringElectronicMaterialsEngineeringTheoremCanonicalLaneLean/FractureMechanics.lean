import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringElectronicMaterialsEngineeringTheoremCanonicalLaneLean

structure FractureMechanicsPackage where
  stressIntensityFactor : Type u
  crackPropagation : Prop
  fractureToughness : Prop
  parisLaw : Prop
  fatigueLife : Prop

structure FractureMechanicsEvidence (F : FractureMechanicsPackage) where
  crackPropagationClosed : F.crackPropagation
  fractureToughnessClosed : F.fractureToughness
  parisLawClosed : F.parisLaw
  fatigueLifeClosed : F.fatigueLife

def FractureMechanicsClosed (F : FractureMechanicsPackage) : Prop :=
  F.crackPropagation ∧ F.fractureToughness ∧ F.parisLaw ∧ F.fatigueLife

theorem fracture_mechanics_closed_from_evidence (F : FractureMechanicsPackage)
    (E : FractureMechanicsEvidence F) : FractureMechanicsClosed F := by
  exact And.intro E.crackPropagationClosed
    (And.intro E.fractureToughnessClosed
      (And.intro E.parisLawClosed E.fatigueLifeClosed))

end MaterialsEngineeringElectronicMaterialsEngineeringTheoremCanonicalLaneLean
end HautevilleHouse