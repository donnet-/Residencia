class Docente < ActiveRecord::Base
  #require 'csv'
  belongs_to :cat_departamento
  belongs_to :usuario
    
    has_many :curso_materias
    has_many :actividad_docentes
    has_many :grado_estudios, dependent: :destroy
    accepts_nested_attributes_for :grado_estudios, allow_destroy: true
    has_many :convenio_honorarios, dependent: :destroy
    has_many :puestos, dependent: :destroy
    has_many :archivo_docentes, dependent: :destroy
    accepts_nested_attributes_for :archivo_docentes, allow_destroy: true
    has_many :archivo_prodep_docentes, dependent: :destroy
    accepts_nested_attributes_for :archivo_prodep_docentes, allow_destroy: true
    
    validates :curp, presence: {message: " La CURP es requerida"}, length: {is: 18, message: "Sólo debe tener 18 caracteres"}, uniqueness: {message: "Ya existe alguien con esa CURP"}, format: { with: /\A[A-Z][AEIOUX][A-Z]{2}[0-9]{2}[0-1][0-9][0-3][0-9][MH][A-Z][BCDFGHJKLMNÑPQRSTVWXYZ]{4}[0-9A-Z][0-9]\z/i, message: 'No es un formato de CURP válido' }
    validates :rfc, length: {is: 13, message: "Sólo debe tener 13 caracteres"}, uniqueness: {message: "Ya ha existe alguien con ese RFC"}, format: { with: /\A[A-ZÑ&]{3,4}[0-9]{2}[0-1][0-9][0-3][0-9]([A-Z0-9]{3})?\z/i, message: 'No es un formato de RFC válido'}
    validates :nombreD, presence: {message: " El nombre es requerido"}, length: {maximum: 30}, format: {with: /\A[a-z[á,é,í,ó,ú,Á,É,Í,Ó,Ú]A-Z\s]+\z/, message: "Sólo se aceptan letras!"}
    validates :apPaterno, presence: {message: " El apellido es requerido"}, length: {maximum: 20}, format: {with: /\A[a-z[á,é,í,ó,ú,Á,É,Í,Ó,Ú]A-Z\s]+\z/, message: "Sólo se aceptan letras!"}
    validates :apMaterno, length: {maximum: 20}, format: {with: /\A[a-z[á,é,í,ó,ú,Á,É,Í,Ó,Ú]A-Z\s]+\z/, message: "Sólo se aceptan letras!"}
    validates :genero, presence: true, length: {is: 1}
    validates :email, presence: {message: " El correo electrónico es requerido"}, length: {maximum: 80}, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: 'Cuenta de correo inválida'}, uniqueness: {message: "Ya está registrado el correo"}
    validates :cat_departamento_id, presence: {message: " El departamento es requerido"}
    validates :tipoDocente, presence: {message: 'El tipo de Docente es requeido'}, length: {maximum: 10}
    validates :estado, presence: {message: 'El estado del docente es requerido'}
    validates :rol, presence: {message: 'El rol es requerido!'}
    mount_uploader :pdfCurriculum, PdfUploader
    validate :image_size_valid, :if => "pdfCurriculum?"
    validates :contacto, presence: {message: "Se requiere de un número telefónico"}, uniqueness: {message: "Ese contacto ya existe"}, length: {minimum: 9, maximum: 17, message: "Mínimo 9 digitos, máximo 17"}
    validates :tipoCurriculum, presence: {message: "El tipo de curriculum es requerido"}
    validates :numCurriculum, uniqueness: {message: "Ese número de curriculum ya existe"}, length: {minimum: 2, maximum: 5, message: "Mínimo 2 caracteres, máximo 5!"}
	validate :valid_curp
	validate :valid_rfc
    
    def image_size_valid
        if pdfCurriculum.size > 1.megabytes
            errors.add(:pdfCurriculum, "El PDf debe pesar menos de 1MB")
        end
    end
    
    def method_info
        "#{self.nombreD} #{self.apPaterno} #{self.apMaterno}"
    end
	
	def valid_curp
        #d = Docente.all
        
        #bandera = false
        #for doc in d
         #   if doc.curp == curp && doc.rfc == rfc
          #      bandera = true
          #  end
        #end        
        #if bandera == true
            n1 = nombreD.upcase.gsub(/\s?(DE|LA|LOS)\s/," ").split(//)[0]
                @n2 = nil
                if nombreD.upcase.gsub(/\s?(DE|LA|LOS)\s/," ").split()[1] != nil
                    @n2 = nombreD.upcase.gsub(/\s?(DE|LA|LOS)\s/," ").split()[1].split(//)[0]
                end
                ap = apPaterno.upcase.split(//)[0,2]
                am = apMaterno.upcase.split(//)[0]
                cp = curp.split(//)[0,2]
                cm = curp.split(//)[2]
                cn = curp.split(//)[3]
                
                if n1 != cn && ap != cp && am != cm || @n2 != cn && ap != cp && am != cm
                    errors.add(:curp, "La curp que ha insertado es incorrecta, no coinde con algunos datos de su nombre.")
                end
        #end
    end
    
    def valid_rfc
        if Docente.find_by(curp: curp, rfc: rfc) != nil
        else
            c = curp.split(//)[0,10]
            r = rfc.split(//)[0,10]
            if c != r
                errors.add(:rfc, "El RFC no coincide con algunos datos de la CURP")
            end
        end
    end
    
#    def self.import(file)
#        CSV.foreach(file.path, headers: true, encoding: 'iso-8859-1:utf-8') do |row|
#            parameters = ActionController::Parameters.new(row.to_hash)
#            Docente.create(parameters.permit(:curp, :rfc, :nombreD, :apPaterno, :apMaterno, :genero, :email, :cat_departamento_id, :tipodocente, :estado))
#        end
#    end
end