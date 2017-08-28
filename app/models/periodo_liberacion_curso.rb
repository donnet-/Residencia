class PeriodoLiberacionCurso < ActiveRecord::Base
   has_many :lib_curso_docentes, :dependent => :destroy
    accepts_nested_attributes_for :lib_curso_docentes, allow_destroy: true
    validates :periodo, uniqueness: {message: "Ese periodo ya ha sido dado de alta"}
	validates :notaAbajo, presence: {message: "Se requiere la descripción de una nota, necesaria para la generación del oficio!"}
	mount_uploader :cabeceraPeriodo, ImagenUploader
end