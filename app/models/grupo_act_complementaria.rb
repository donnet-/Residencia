class GrupoActComplementaria < ActiveRecord::Base
    
  require 'csv'
    
  belongs_to :actividad_complementaria
  belongs_to :estudiante
    
    validates :numControl, presence: {message: "El número de control es requerido"}
    validate :valid_student_comple
    
    def valid_student_comple
        @grupC = GrupoActComplementaria.all
        
        for elem in @grupC
            if elem.actividad_complementaria_id == actividad_complementaria_id
                if elem.numControl == numControl
                    errors.add(:numControl, "El estudiante ya se encuentra registrado en estegrupo")
                end
            end
        end
    end
    
    def self.import(complementaria,file)
    CSV.foreach(file.path, headers: true, encoding:'iso-8859-1:utf-8') do |row|
      parameters = ActionController::Parameters.new(row.to_hash)
      complementaria.grupo_act_complementarias.create(parameters.permit(:numControl, :apPaterno, :apMaterno, :nombre))
    end
  end
end