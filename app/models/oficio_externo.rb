class OficioExterno < ActiveRecord::Base
  belongs_to :oficio
  mount_uploader :pdf_oficio, ImagenUploader
  validates :etiqueta, presence: {message: "La etiqueta es requerida"}
  validates :pdf_oficio, presence: {message: "El documento es requerido"}
end
