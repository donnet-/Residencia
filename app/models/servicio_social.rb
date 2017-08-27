class ServicioSocial < ActiveRecord::Base
  belongs_to :estudiante
  belongs_to :empresa
    
  validates :fechaInicio, presence: {message: "La fecha de inicio es requerida"}
  validates :fechaTermino, presence: {message: "La fecha de término es requerida"}
  validates :nombreE, presence: {message: "La empresa es requerida"}
  validates :horas, numericality: {message: "Sólo números"}
  validate :maximo_calificacion
  mount_uploader :pdfLiberacion, PdfUploader
  mount_uploader :pdfAceptacion, PdfUploader
  mount_uploader :pdfPresentacion, PdfUploader
  validate :maximo_horas
  validate :maximum_date_inicio_date_termino
  validate :image_size_validation, :if => "pdfLiberacion?"
  validate :image_size_validation2, :if => "pdfAceptacion?"
  validate :image_size_validation3, :if => "pdfPresentacion"
  
  def image_size_validation
        if pdfLiberacion.size > 1.megabytes 
            errors.add(:base, "El archivo PDF, debe pesar menos de un megabyte")
        end
    end
  
  def image_size_validation2
        if pdfAceptacion.size > 1.megabytes 
            errors.add(:base, "El archivo PDF, debe pesar menos de un megabyte")
        end
    end
  
  def image_size_validation3
        if pdfPresentacion.size > 1.megabytes 
            errors.add(:base, "El archivo PDF, debe pesar menos de un megabyte")
        end
    end
    
    def maximum_date_inicio_date_termino
        if fechaInicio > fechaTermino
            errors.add(:fechaTermino, "La fecha término es menor a la de inicio")
        end
    end
    def maximo_calificacion
      if calificacion.to_i < 0 || calificacion.to_i > 100
        errors.add(:calificacion, "La calificacion debe estar dentro de un rango de 0 a 100")
      end
    end

    def maximo_horas
      if horas.to_i < 0 || horas.to_i > 500
        errors.add(:horas, "Rango de 1 a 500 horas")
      end
    end
end
