class PeriodoActividadAcademica < ActiveRecord::Base
    has_many :lib_actividad_docentes, dependent: :destroy
    accepts_nested_attributes_for :lib_actividad_docentes, allow_destroy: true
    validates :periodo, uniqueness: {message: "ese periodo ya ha sido dado de alta!"}
end