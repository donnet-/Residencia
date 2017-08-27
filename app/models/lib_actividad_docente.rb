class LibActividadDocente < ActiveRecord::Base
  belongs_to :periodo_actividad_academica
    has_many :lib_doc_act_criterios, dependent: :destroy
    accepts_nested_attributes_for :lib_doc_act_criterios, allow_destroy: true
end
