class SolicitudHorario < ActiveRecord::Base
  belongs_to :solicitud

  validate :valid_horario
  def valid_horario
       if hora_inicio == hora_termino
             errors.add(:hora_termino, "No puede ser a la misma hora" )
      else
          if hora_inicio > hora_termino
                errors.add(:hora_termino, "La hora de salida debe ser mayor a la de inicio")
            end
        end
    end
end
