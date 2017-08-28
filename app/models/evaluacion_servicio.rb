class EvaluacionServicio < ActiveRecord::Base
	 belongs_to :servicio_social
	 #belongs_to :criterio_evaluacion_servicio
	 has_many :criterio_evaluacion_servicios
	 accepts_nested_attributes_for :criterio_evaluacion_servicios, allow_destroy: true
	 mount_uploader :pdf_eval_servicio, PdfUploader
	 validate :image_size_validation3, :if => "pdf_eval_servicio"
	 validates :pdf_eval_servicio, presence: {menssage: "No debe estar vacío"}

	 def image_size_validation3
        if pdf_eval_servicio.size > 1.megabytes 
            errors.add(:base, "El archivo PDF, debe pesar menos de un megabyte")
        end
    end


end
