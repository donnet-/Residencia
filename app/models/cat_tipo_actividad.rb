class CatTipoActividad < ActiveRecord::Base
    has_and_belongs_to_many :cat_tipo_participaciones
    has_and_belongs_to_many :cat_evidencias
    
    validates :nombreTipoAct, uniqueness: {message: "Ya existe ese tipo de actividad"}, presence: {message: "El nombre del tipo de actividad es requerido"}, length: {minimum: 5, maximum: 60, message: "Mínimo 5 caracteres, Máximo 60"}, format: {with: /\A[a-z[á,é,í,ó,ú,Á,É,Í,Ó,Ú]A-Z\s]+\z/, message: "Sólo se aceptan letras"}
	mount_uploader :cabecera, ImagenUploader
end