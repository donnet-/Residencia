class EvaluacionResidencia < ActiveRecord::Base
	 has_many :criterio_evaluacion_residencias
	 accepts_nested_attributes_for :criterio_evaluacion_residencias, allow_destroy: true
	  mount_uploader :pdf, PdfUploader
	mount_uploader :pdf, PdfUploader
	 validate :image_size_validation3, :if => "pdf"
	 validates :pdf, presence: {menssage: "No debe estar vacío"}

	 def image_size_validation3
        if pdf.size > 1.megabytes 
            errors.add(:base, "El archivo PDF, debe pesar menos de un megabyte")
        end
    end
end
