class GradoEstudio < ActiveRecord::Base
  belongs_to :cat_tipo_grado_estudio
  belongs_to :docente
    
    validates :nombreGrado, presence: {message: "El nombre del grado de estudio es requerido"}, length: {minimum: 5, maximum: 150, message: "Mínimo 5 caracteres, máximo 150"}, format: {with: /\A[a-z[.,á,é,í,ó,ú,Á,É,Í,Ó,Ú]A-Z\s]+\z/, message: "Sólo se aceptan letras!"}
    validates :cat_tipo_grado_estudio_id, presence: {message: "El Tipo de grado es requerido"}
    validates :abrev, presence: {message: "La abreviacion del grado es requerido"}, length: {minimum: 2, maximum: 8, message: "Mínimo 2 caracteres, máximo 8"}, format: {with: /\A[a-z[.]A-Z\s]+\z/, message: "Sólo se aceptan letras!"}
    validates :institucion, presence: {message: "La institucion es requerida"}, length: {minimum: 20, maximum: 150, message: "Mínimo 20 caracteres, máximo 150"}
    mount_uploader :pdfEvidencia, PdfUploader
    validate :image_size_validation, :if => "pdfEvidencia?" 
    
    def image_size_validation
        if pdfEvidencia.size > 1.megabytes
            errors.add(:base, "La imagen debe pesar menos de 1MB")
        end
    end
end