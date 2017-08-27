class ProyectoDocenteEvidencia < ActiveRecord::Base
  belongs_to :proyecto_docente
    mount_uploader :pdfEvidencia, PdfUploader
    validate :image_size_valid, :if => "pdfEvidencia?"
    
    def image_size_valid
        if pdfEvidencia.size > 1.megabytes
            errors.add(:pdfEvidencia, "El PDF debe pesar menos de 1MB")
        end
    end
end
