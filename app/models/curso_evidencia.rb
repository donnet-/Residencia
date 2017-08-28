class CursoEvidencia < ActiveRecord::Base
  belongs_to :curso_materia
  belongs_to :periodo_curs_materia
    
    validates :etiqueta, presence: {message: "El campo es obligatorio."}
    validates :archivo, presence: {message: "Seleccione un archivo."}
    validates :curso_materia_id, presence: {message: "Elija una Grupo"}
    mount_uploader :archivo, PdfUploader
    validate :image_size_valid, :if => "archivo?"
  
    
    def image_size_valid
        if archivo.size > 1.megabytes
            errors.add(:archivo, "El PDF debe pesar menos de 1MB")       
        end
    end
end
