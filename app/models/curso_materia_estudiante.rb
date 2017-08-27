class CursoMateriaEstudiante < ActiveRecord::Base
    require 'csv'
    belongs_to :curso_materia

  def self.import(curso,file)
    CSV.foreach(file.path, headers: true, encoding:'iso-8859-1:utf-8') do |row|
      parameters = ActionController::Parameters.new(row.to_hash)
      curso.curso_materia_estudiantes.create(parameters.permit(:numControl, :apellidoPaterno, :apellidoMaterno, :nombre))
    end
  end
end