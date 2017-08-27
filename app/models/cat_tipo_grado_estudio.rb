class CatTipoGradoEstudio < ActiveRecord::Base
    validates :nombreTipoGrado, uniqueness: {message: "Ya existe ese tipo de grado"}, presence: {message: "El nombre del grado es requerido"}, length: {minimum: 5, maximum: 30, message: "Mínimo 5 caracteres, Máximo 30"}, format: {with: /\A[a-z[á,é,í,ó,ú,Á,É,Í,Ó,Ú]A-Z\s]+\z/, message: "Sólo se aceptan letras!"}
    validates :estado, presence: {message: 'El estado del tipo de grado es requerido'}
end