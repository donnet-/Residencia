class Estudiante < ActiveRecord::Base
    require 'csv'
    belongs_to :cat_especialidad 
    has_many :servicio_sociales, dependent: :destroy 
    has_many :curso_materia_estudiantes
    has_many :grupo_act_complementarias
    
    validates :curpEstudiante, presence: {message: " La CURP es requerida"}, length: {is: 18, message: "Sólo debe tener 18 caracteres"}, format: { with: /\A[A-Z][AEIOUX][A-Z]{2}[0-9]{2}[0-1][0-9][0-3][0-9][MH][A-Z][BCDFGHJKLMNÑPQRSTVWXYZ]{4}[0-9A-Z][0-9]\z/i, message: 'No es un formato de CURP válido' }, uniqueness: {message: "La CURP ya se encuentra registrada"}
    validates :numControl, presence: {message: "El número de control es requerido"}, numericality: { only_integer: true, message: "Sólo números" }, length: {minimum: 8, maximum: 12, message: 'Mínimo 8 digitos, Maximo 12'}, uniqueness: {message: "El número ya se encuentra registrado"}
    validates :nombre, presence: {message: " El nombre es requerido"}, length: {maximum: 30}, format: {with: /\A[a-z[á,é,í,ó,ú,Á,É,Í,Ó,Ú]A-Z\s]+\z/, message: "Sólo se aceptan letras!"}
    validates :apPaterno, presence: {message: " El apellido es requerido"}, length: {maximum: 20}, format: {with: /\A[a-z[á,é,í,ó,ú,Á,É,Í,Ó,Ú]A-Z\s]+\z/, message: "Sólo se aceptan letras!"}
    validates :apMaterno, length: {maximum: 20}, format: {with: /\A[a-zA-Z\s]+\z/, message: "Sólo se aceptan letras!"}
    validates :genero, presence: true, length: {is: 1}
    validates :email, uniqueness: {message: "Ese correo ya existe" }, presence: {message: " El correo electrónico es requerido"}, length: {maximum: 80}, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: 'Cuenta de correo inválida'}
    validates :cat_especialidad_id, presence: {message: "La especialidad para el estudiante es requerido"}
    validates :rol, presence: {message: 'El rol es requerido!'}
    validates :email_adicional, length: {maximum: 80}, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: 'Cuenta de correo inválida'}
    validates :contacto, presence: {message: "Se requiere de un número telefónico"}, uniqueness: {message: "Ese contacto ya existe"}, length: {minimum: 9, maximum: 17, message: "Mínimo 9 digitos, máximo 17"}
	validate :valid_curp_estudiante
    
    def funky_method
        "#{self.numControl} #{self.nombre} #{self.apPaterno} #{self.apMaterno}"
    end

    def estudiante_numControl
        estudiante.numControl if estudiante
    end

    def estudiante_numControl=(numControl)
        self.estudiante = Estudiante.find_by_numControl(numControl)
    end
    
	def valid_curp_estudiante
		#if Estudiante.find_by(curpEstudiante: curpEstudiante) == nil		
		#	n1 = nombre.upcase.gsub(/\s?(DE|LA|LOS)\s/," ").split(//)[0]
		#	@n2 = nil
		#	if nombre.upcase.gsub(/\s?(DE|LA|LOS)\s/," ").split()[1] != nil
		#		@n2 = nombre.upcase.gsub(/\s?(DE|LA|LOS)\s/," ").split()[1].split(//)[0]
		#	end

		#	ap = apPaterno.upcase.split(//)[0,2]
		#	am = apMaterno.upcase.split(//)[0]
		#	cp = curpEstudiante.split(//)[0,2]
		#	cm = curpEstudiante.split(//)[2]
		#	cn = curpEstudiante.split(//)[3]

			#if n1 != cn && ap != cp && am != cm || @n2 != cn && ap != cp && am != cm
			#	errors.add(:curpEstudiante, "La curp que ha insertado es incorrecta, no coincide con algunos datos de su nombre.")
			#end
         #   if n1 != cn || ap != cp || am != cm || @n2 != cn
         #      errors.add(:curpEstudiante, "La curp que ha insertado es incorrecta, no coincide con algunos datos de su nombre.")
         #   end
		#end
        n1 = nombre.upcase.gsub(/\s?(DE|LA|LOS)\s/," ").split(//)[0]
                @n2 = nil
                if nombre.upcase.gsub(/\s?(DE|LA|LOS)\s/," ").split()[1] != nil
                    @n2 = nombre.upcase.gsub(/\s?(DE|LA|LOS)\s/," ").split()[1].split(//)[0]
                end
                ap = apPaterno.upcase.split(//)[0,2]
                am = apMaterno.upcase.split(//)[0]
                cp = curpEstudiante.split(//)[0,2]
                cm = curpEstudiante.split(//)[2]
                cn = curpEstudiante.split(//)[3]
                
                if n1 != cn && ap != cp && am != cm || @n2 != cn && ap != cp && am != cm
                    errors.add(:curp, "La curp que ha insertado es incorrecta, no coinde con algunos datos de su nombre.")
                end
	end
	
    def self.import(file)
        CSV.foreach(file.path, headers: true, encoding: 'iso-8859-1:utf-8') do |row|
            Estudiante.create! row.to_hash
        end
    end
end
