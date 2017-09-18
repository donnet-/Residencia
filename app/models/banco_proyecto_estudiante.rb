class BancoProyectoEstudiante < ActiveRecord::Base
  has_and_belongs_to_many :banco_proyecto
  has_and_belongs_to_many :estudiantes
end
