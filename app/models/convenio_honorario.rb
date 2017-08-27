class ConvenioHonorario < ActiveRecord::Base
  belongs_to :docente
    
    mount_uploader :pdfConvenio, PdfUploader
    validates :fechaInicio, presence: {message: "La fecha es requerida"}
    validates :fechaTermino, presence: {message: "La fecha es requerida"}
    validates :estado, presence: {message: 'El estado del convenio es requerido'}
    validate :image_size_validation, :if => "pdfConvenio?"
    validate :maximum_date_inicio_date_termino
    validate :valid_date_convenio
    
    def image_size_validation
        if pdfConvenio.size > 1.megabytes
            errors.add(:base, "La imagen debe pesar menos de 1MB")
        end
    end
        
    def maximum_date_inicio_date_termino
        if fechaInicio > fechaTermino
            errors.add(:fechaTermino, "La fecha término es menor a la de inicio")
        end
    end
    
    def valid_date_convenio
        @con = ConvenioHonorario.all
        for elem in @con
            if elem.docente_id == docente_id
                if fechaInicio > elem.fechaTermino
                    errors.add(:fechaInicio, "Cada convenio se registra semestralmente")
                end
            end
        end
    end
end