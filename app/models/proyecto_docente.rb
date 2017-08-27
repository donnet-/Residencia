class ProyectoDocente < ActiveRecord::Base
  belongs_to :proyecto
  has_many :proyecto_docente_evidencias
  accepts_nested_attributes_for :proyecto_docente_evidencias, allow_destroy: true
end
