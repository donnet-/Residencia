class Horario < ActiveRecord::Base
  belongs_to :actualizacion_docente_profesional
    
    #validate :valid_horario
#    def valid_horario
#       
#        if hora_inicio == hora_fin
#                errors.add(:hora_fin, "No puede ser a la misma hora" )
#        else
#            if hora_inicio > hora_fin
#                errors.add(:hora_inicio, "La hora de inicio debe ser mayor a la de fin")
#            end
#        end
#    end
end
