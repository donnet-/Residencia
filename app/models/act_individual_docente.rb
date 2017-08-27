class ActIndividualDocente < ActiveRecord::Base
  belongs_to :cat_evidencia
  belongs_to :actividad_docente
    
    validates :cat_evidencia_id, presence: {message: "Se require de la evidencia"}
    mount_uploader :pdfEvidencia, PdfUploader
    validate :image_size_validation, :if => "pdfEvidencia?"
    validate :valid_evidencia
    
    def image_size_validation
        if pdfEvidencia.size > 1.megabytes
            errors.add(:base, "La imagen debe pesar menos de 1MB")
        end
    end
    
    def valid_evidencia
        @catevi = ActIndividualDocente.all
        
        for evi in @catevi
            if evi.actividad_docente_id == actividad_docente_id
                if evi.cat_evidencia_id == cat_evidencia_id
                    errors.add(:cat_evidencia_id, "Ya esta registrado esa evidencia!!")
                end
            end
        end
    end
end
