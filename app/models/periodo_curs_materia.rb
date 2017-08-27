class PeriodoCursMateria < ActiveRecord::Base
    has_many :curso_materias, dependent: :destroy
    accepts_nested_attributes_for :curso_materias, allow_destroy: true
    has_many :archivo_periodos, dependent: :destroy
    accepts_nested_attributes_for :archivo_periodos, allow_destroy: true
    has_many :materia_evidencias, dependent: :destroy
    has_many :curso_evidencias, dependent: :destroy
    has_many :estadisticas, dependent: :destroy
    belongs_to :docente
    
    validates :periodo, presence: {message: "El periodo es requerido!"}
    validates_uniqueness_of :periodo, scope: [:docente_id], message: "El periodo ya ha sido registrado"
    validates :docente_id, presence: {message: "El docente es requerido"}
    
end