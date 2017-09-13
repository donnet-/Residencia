class BancoProyectoEstudiante < ActiveRecord::Base
  belongs_to :banco_proyecto
  has_and_belongs_to_many :estudiantes
end
