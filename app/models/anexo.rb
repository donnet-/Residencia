class Anexo < ActiveRecord::Base
  belongs_to :proyecto
  belongs_to :reunion
  has_and_belongs_to_many :proyecto_estudiantes
    
    mount_uploader :pdfAnexo, PdfUploader

    #validates :proyecto_id, presence: {message: "Debe elegir un proyecto"}
end