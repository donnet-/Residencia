class RequisitoEvidencia < ActiveRecord::Base
  belongs_to :cat_evidencia
    
    #validates :nombreRequisito, presence: {message: "EL nombre del módulo es requerido"}, length: {minimum: 5, maximum: 250, message: "Minímo 20 caracteres, máximo 250"}, uniqueness: {message: "El nombre del módulo debe ser único."}, format: {with: /\A[a-z[á,é,í,ó,ú,Á,É,Í,Ó,Ú]A-Z\s]+\z/, message: "Sólo se aceptan letras!"}
end
