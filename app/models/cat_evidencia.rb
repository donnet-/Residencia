class CatEvidencia < ActiveRecord::Base
    has_many :act_individual_docentes
    has_many :requisito_evidencias
    accepts_nested_attributes_for :requisito_evidencias, allow_destroy: true
    has_and_belongs_to_many :cat_tipo_actividades
    
    validates :nombreEvidencia, uniqueness: {message: "Ya existe ese tipo de evidencia"}, presence: {message: "El nombre de la evidencia es requerido"}, length: {minimum: 5, maximum: 60, message: "Mínimo 5 caracteres, Máximo 30"}, format: {with: /\A[a-z[á,é,í,ó,ú,Á,É,Í,Ó,Ú]A-Z\s]+\z/, message: "Sólo se aceptan letras!"}
    validates :estado, presence: {message: 'El estado de la evidencia es requerido'}
end