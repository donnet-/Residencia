class Empresa < ActiveRecord::Base
    has_many :viaje_itinerario_empresas
    has_one :servicio_social
    has_many :criterio_evalucion_servicios

    validates :rfcEmpresa, presence: {message: " El rfc es requerido"}, uniqueness: true, length: {is: 12,  message: "El rfc debe tener 12 caracteres"}, format: { with: /\A[A-ZÑ&]{3,4}[0-9]{2}[0-1][0-9][0-3][0-9]([A-Z0-9]{3})?\z/i, message: 'No es un formato de RFC válido'}
    validates :nombreE, presence: {message: " El nombre es requerido"}, length: {maximum: 250, message: "Maximo de caracteres 60"}, format: {with: /\A[a-z[-,á,é,í,ó,ú,Á,É,Í,Ó,Ú]A-Z\s]+\z/, message: "Sólo se aceptan letras y guiones!"}
    mount_uploader :pdfConvenio, PdfUploader
    validates :email, presence: {message: " El correo electrónico es requerido"}, length: {maximum: 80, message: "Limite 80 caracteres"}, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: 'Cuenta de correo inválida'}
    validates :contacto, presence: {message: " El contacto es requerido"}, length: {maximum: 60, message: "Maximo 60 caracteres"}, format: {with: /\A[a-z[.,á,é,í,ó,ú,Á,É,Í,Ó,Ú]A-Z\s]+\z/, message: "Sólo se aceptan letras!"}
    validates :telefono, presence: {message: " El telefono es requerido"}, length: {maximum: 30, message: "Maximo 30 caracteres"}
    validates :estado, presence: true, length: {maximum: 40, message: "Limite 40 caracteres"}
    validates :calle, presence: {message: " El nombre de la calle es requerido"}, length: {maximum: 60, message: "Limite 40 caracteres"}, format: {with: /\A[a-zA-Z\s]+\z/, message: "Sólo se aceptan letras!"}
    validates :colonia, length: {maximum: 60, message: "Limite 40 caracteres"}, format: {with: /\A[a-zA-Z\s]+\z/, message: "Sólo se aceptan letras!"}
    validates :numInterior, presence: {message: " El número es requerido"}, length: {minimum:1, maximum: 20, message: 'Mínimo un caracter, máximo: 20'}
    validates :numExterior, length: {maximum: 20, message: 'Máximo: 20'}
    validate :image_size_validation, :if => "pdfConvenio?"
    
    def image_size_validation
        if pdfConvenio.size > 1.megabytes
            errors.add(:base, "El pdf debe pesar menos de 1MB")
        end
    end
    
    def method_info_empresa
        " #{self.rfcEmpresa} #{self.nombreE}"
    end
end