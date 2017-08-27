class ProyInvDocumento < ActiveRecord::Base
  belongs_to :proyecto_investigacion
    
    validates :descripcion, presence: { messsage: "La descripción o nombre del documento es requerido"}
    #validates :documento, presence: {message: 'El documento es requerido'}
    mount_uploader :documento, PdfUploader
    validate :pdf_size_valid, :if => "documento?"
    
    def pdf_size_valid
        if documento.size > 1.megabytes
            errors.add(:documento, "La imagen debe pesar menos de 1MB")
        end
    end
end
