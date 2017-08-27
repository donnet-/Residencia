class ModuloDiplomado < ActiveRecord::Base
  belongs_to :actividad
  has_and_belongs_to_many :actividad_docentes
  #accepts_nested_attributes_for 
    
    validates :nombreModulo, presence: {message: "EL nombre del módulo es requerido"}, length: {minimum: 5, maximum: 250, message: "Minímo 20 caracteres, máximo 250"}, uniqueness: {message: "El nombre del módulo debe ser único."}, format: {with: /\A[a-z[á,é,í,ó,ú,Á,É,Í,Ó,Ú]A-Z\s]+\z/, message: "Sólo se aceptan letras!"}
    validates :fechaInicio, presence: {message: "La fecha de inicio es requerida"}
    validates :fechaTermino, presence: {message: "La fecha de termino es requerido"}
    validates :duracion, presence: {message: "La duración del curso es requerida"}, length: {minimum: 5, maximum: 30, message: "Mínimo 5 caracteres, máximo 30"}
    #validate :valid_date
    
    def valid_date
        @modulo = ModuloDiplomado.all
        
        for mod in @modulo
            if mod.actividad_id == actividad_id
                if mod.fechaInicio == fechaInicio || mod.fechaInicio < fechaTermino || mod.fechaTermino < fechaInicio || mod.fechaTermino == fechaTermino
                    errors.add(:fechaInicio, "La fecha de inicio y termino deben ser diferentes a las ya registradas!!")
                end
            end
        end
    end
end