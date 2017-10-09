class SolicitudHorario < ActiveRecord::Base
  belongs_to :solicitud
  
  validates :hora_inicio,:presence => { :message => "No puede quedar en blanco" }
  
  validates_time :hora_termino, :presence => { :message => "No puede quedar en blanco" },
      :after => :hora_inicio,
      :after_message => "Debe ser después de la hora de inicio (en formato de 24 horas)"
  
  validates :dia_inicio, :presence => { :message => "No puede quedar en blanco" }
  
  validates :dia_termino, :presence => { :message => "No puede quedar en blanco" }
  
  #validate :valid_horario
  
  #def valid_horario
  #  if hora_inicio == hora_fin
  #    errors.add(:hora_fin, "No puede ser a la misma hora" )
  #  else
  #    if hora_inicio > hora_fin
  #      errors.add(:hora_inicio, "La hora de inicio debe ser mayor a la de fin")
  #    end
  #  end
  #end
end
