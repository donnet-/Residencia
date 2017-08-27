class CatPlanCurso < ActiveRecord::Base
    
    has_many :cat_materias
    accepts_nested_attributes_for :cat_materias, allow_destroy: true
    
    validates :descripcion, uniqueness: {message: "Ya existe ese plan de estudios."}, presence: {message: "La clave del plan de estudios es requerido"}, length: {minimum: 5, maximum: 30, message: "Mínimo 5 caracteres, Máximo 30"}
    validates :estado, presence: {message: 'El estado del plan de estudios es requerido.'}
end