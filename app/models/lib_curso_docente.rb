class LibCursoDocente < ActiveRecord::Base
  belongs_to :periodo_liberacion_curso
    has_many :lib_doc_criterios, :dependent => :destroy
    accepts_nested_attributes_for :lib_doc_criterios, allow_destroy: true
end
