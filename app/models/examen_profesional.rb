class ExamenProfesional < ActiveRecord::Base
  belongs_to :cat_tipo_examen_proyecto
  belongs_to :actividad
    
  has_many :egresados
  accepts_nested_attributes_for :egresados, allow_destroy: true
end
