class ViajeGrupo < ActiveRecord::Base
  belongs_to :curso_materia
  belongs_to :actividad
    
    validates :curso_materia_id, presence: {message: 'El grupo de curso es requerido'}, if: :valid_group?
    #validate :valid_group
    
    def valid_group?
        @grupocurso = ViajeGrupo.all
        
        for elem in @grupocurso
            if elem.actividad_id == actividad_id
                if elem.curso_materia_id == curso_materia_id
                    errors.add(:curso_materia_id, 'Ya se encuentra registrado ese curso')
                end
            end
        end
    end
end
