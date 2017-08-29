class Anteproyecto < ActiveRecord::Base
  validates :fk_id_proyecto_b, :presence => { :message => "no puede quedar en blanco" },
      length: { maximum: 11, message: "debe tener más de 11 caracteres" },
      numericality: { only_integer: true, message: "debe ser un número" }
  
  validates :nombre_anteproy, :presence => { :message => "no se puede quedar en blanco"},
      length: { maximum: 250, message: "debe tener máximo 250 caracteres" }
  
  validates :asesor_externo, :presence => { :message => "no se puede quedar en blanco"},
      length: { maximum: 100, message: "debe tener máximo 100 caracteres" }
  
  validates :status_anteproy, :presence => { :message => "no se puede quedar en blanco"},
      length: { maximum: 30, message: "debe tener máximo 30 caracteres" }

  belongs_to :banco_proyecto
  has_many :estudiantes
  has_one :revisa_anteproyecto
  has_one :proyecto
  has_many :anteproyecto_estudiantes
  accepts_nested_attributes_for :anteproyecto_estudiantes, allow_destroy: true
  has_many :anteproyecto_observaciones
  accepts_nested_attributes_for :anteproyecto_observaciones, allow_destroy: true
end