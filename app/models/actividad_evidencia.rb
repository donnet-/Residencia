class ActividadEvidencia < ActiveRecord::Base
  belongs_to :cat_evidencia
  belongs_to :actividad
    
    validates :cat_evidencia_id, presence: {message: "Se requiere de evidencia"}
    mount_uploader :pdfEvidencia, PdfUploader
    validate :image_size_validation, :if => "pdfEvidencia?"
    #validate :valid_evidencia
    
    def image_size_validation
        if pdfEvidencia.size > 1.megabytes
            errors.add(:base, "La imagen debe pesar menos de 1MB")
        end
    end
    
    def valid_evidencia
        @catevi = Actividad.all
        
        for evi in @catevi
            if evi.actividad_id == actividad_id
                if evi.cat_evidencia_id == cat_evidencia_id
                    errors.add(:cat_evidencia_id, "Ya esta registrado esa evidencia!!")
                end
            end
        end
    end
end
