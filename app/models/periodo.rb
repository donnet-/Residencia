class Periodo < ActiveRecord::Base
	#validates :contacto, presence: {message: "Se requiere de un número telefónico"}, uniqueness: {message: "Ese contacto ya existe"}, length: {minimum: 9, maximum: 17, message: "Mínimo 9 digitos, máximo 17"}
	#validate :valid_curp_estudiante
	validates :periodo, presence: {message: "El periodo es requerido"}, uniqueness: {message: "Este periodo ya se encuentra registrado"}
	validates :fechaInicio, presence: {message: "No debe quedar vacío"}
	validates :fechaTermino, presence: {message: "No debe quedar vacío"}
	validate :maximum_date_inicio_date_termino
	validate :semestre

	def maximum_date_inicio_date_termino
       if (fechaTermino != nil && fechaInicio != nil)
           if (fechaTermino < fechaInicio)
              errors.add(:fechaInicio, "La fecha de termino debe ser mayor a la de inicio")
     	    end
        end
    end
    def semestre
    	if (fechaTermino - fechaInicio < 90)
    		errors.add(:fechaTermino, "La fecha de término debe se mayor a 3 meses.")
    	end
    end
end
