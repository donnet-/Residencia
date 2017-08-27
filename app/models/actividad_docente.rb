class ActividadDocente < ActiveRecord::Base
  belongs_to :docente
  belongs_to :cat_tipo_participacion
  belongs_to :actividad
    
    has_many :act_individual_docentes
    accepts_nested_attributes_for :act_individual_docentes, allow_destroy: true
    has_and_belongs_to_many :modulo_diplomados
    
    validates :docente_id, presence: {message: 'El docente es requerido'}
    validates :cat_tipo_participacion_id, presence: {message: 'el tipo de participacion es requerido'}
    
    def method_info_docente
        @docent = Docente.find(docente_id)
        #@dat = @plan.descripcion
        "#{@docent.nombreD} #{@docent.apPaterno} #{@docent.apMaterno}"
    end
end
