class ViajeItinerarioEmpresa < ActiveRecord::Base
  belongs_to :visita
    
    validates :curpEmpresa, presence: {message: 'La empresa es requerida'}
    validates :fecha, presence: {message: 'La fecha es requerida'}
    validates :hora, presence: {message: 'La hora es requerida'}, length: {minimum: 4, maximum: 15, message: 'Mínimo de caracteres 4, máximo 15'}
    validate :valid_empresa
    validate :valid_date
    
    def valid_empresa
        @empr = ViajeItinerarioEmpresa.all
        for elem in @empr
            if elem.visita_id == visita_id
                if elem.curpEmpresa == curpEmpresa
                    errors.add(:curpEmpresa, 'Ya esta registrada esa visita en el itinerario')
                end
            end
        end
    end
    
    def valid_date
        if fecha.present? && fecha <= Date.today
              errors.add(:fecha, "La fecha debe ser a futuro!!!")
        end
    end
end
