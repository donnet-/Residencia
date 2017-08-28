class Configuracion < ActiveRecord::Base
    mount_uploader :imagen, ImagenUploader
    validates :tipo, presence: {message: "Debe llenar este campo"}, uniqueness: {message: "Ya está registrado"}
end
