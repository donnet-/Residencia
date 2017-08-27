class Visita < ActiveRecord::Base
  belongs_to :actividad
    
    has_many :viaje_itinerario_empresas, dependent: :destroy
    accepts_nested_attributes_for :viaje_itinerario_empresas, allow_destroy: true
    
    validates :asunto, presence: {message: "El asunto es requerido"}
end
