class ProyectoInvestigacion < ActiveRecord::Base
    has_many :proy_inv_documentos, :dependent => :destroy
    accepts_nested_attributes_for :proy_inv_documentos, :allow_destroy => true
    has_many :proyecto_inv_estudiantes, :dependent => :destroy
    accepts_nested_attributes_for :proyecto_inv_estudiantes, :allow_destroy => true
    has_many :proy_inv_docentes, :dependent => :destroy
    accepts_nested_attributes_for :proy_inv_docentes, :allow_destroy => true
    
    validates :numProyecto, presence: {message: "El número de proyecto es requerido"}, length: {minimum: 2, maximum: 10, message: "Minímo 2 digitos, máximo 10"}, uniqueness: {message: "Ese número de proyecto ya existe"}
    validates :nombreProy, presence: {message: "El nombre del proyecto es requerido"}, length: {minimum: 10, maximum: 250, message: "Minímo 0 caracteres, máximo 250"}, uniqueness: {message: "El nombre del proyecto debe ser único."}, format: {with: /\A[a-z[á,é,í,ó,ú,Á,É,Í,Ó,Ú]A-Z\s]+\z/, message: "Sólo se aceptan letras!"}
    validates :cat_tipo_examen_proyecto_id, presence: {message: "El tipo de proyecto es requerido"}
    validates :fechaInicio, presence: {message: "La fecha de inicio es requerido"}
    validates :fechaTermino, presence: {message: "La fecha de término es requerido"}
    validate :valid_dates
    validate :valid_date_proy
	
    def valid_dates
        if fechaInicio > fechaTermino
            errors.add(:fechaInicio, "La fecha de inicio debe ser mayor a la de término!!")
        end
    end
	
	def valid_date_proy
		mi = fechaInicio.strftime("%m").to_i
		mf = fechaTermino.strftime("%m").to_i
		ai = fechaInicio.strftime("%Y")
		af = fechaTermino.strftime("%Y")
		
		if ai == af
			if(mf-mi) < 6
				errors.add(:fechaTermino, "El proyecto debe ser mayor o igual a seis meses!!")
			end
		else
			if af > ai
				if ((mi-12)+(mf)) < 6
					errors.add(:fechaTermino, "El proyecto debe ser mayor o igual a seis meses!!")
				end
			end
		end
	end
end