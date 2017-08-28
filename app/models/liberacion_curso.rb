class LiberacionCurso < ActiveRecord::Base
    has_many :liberacio_docente_cursos
    accepts_nested_attributes_for :liberacio_docente_cursos, allow_destroy: true
end
