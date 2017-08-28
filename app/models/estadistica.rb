class Estadistica < ActiveRecord::Base
  belongs_to :curso_materia
  belongs_to :periodo_curs_materia
  belongs_to :curso_materia
  belongs_to :periodo_curs_materia
    
    validates :carrera, presence: {message: "El campo es obligatorio."}
    validates :ordinaria, presence: {message: "El total de estudiantes es requerido"}, numericality: {only_integer: true, greater_than: -1, less_than: 55}    
    validates :complementaria, presence: {message: "El total de estudiantes es requerido"}, numericality: {only_integer: true, greater_than: -1, less_than: 55}    
    validates :especial, presence: {message: "El total de estudiantes es requerido"}, numericality: {only_integer: true, greater_than: -1, less_than: 55}    
    validates :reprobados, presence: {message: "El total de estudiantes es requerido"}, numericality: {only_integer: true, greater_than: -1, less_than: 55}    
    validates :desertores, presence: {message: "El total de estudiantes es requerido"}, numericality: {only_integer: true, greater_than: -1, less_than: 50}    
    validates :periodo_curs_materia_id, presence: true
    validates_uniqueness_of :periodo_curs_materia_id, scope: [:curso_materia_id]
    validates :curso_materia_id, presence: true
    validate :totales

    def totales
      total = CursoMateria.find(curso_materia_id).total
      x = ordinaria.to_i + complementaria.to_i + especial.to_i + reprobados.to_i + desertores.to_i
      if x != total          
        errors.add(:desertores, "los datos ingresados no son igual al total")
      end
    end
end
