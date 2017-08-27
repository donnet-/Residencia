class Reunion < ActiveRecord::Base
    has_many :anexos
	accepts_nested_attributes_for :anexos, allow_destroy: true
	
	#validates :numActa, uniqueness: {message: "Ya existe ese número de acta/reunión"}, numericality: {only_integer: true}
	mount_uploader :pdfActa, PdfUploader
    validates :fecha, presence: {message: "La fecha es requerida!"}
    validates :hora, presence: {message: "La hora de la reunión es requerida!"}
end