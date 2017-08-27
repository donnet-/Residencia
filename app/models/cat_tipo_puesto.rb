class CatTipoPuesto < ActiveRecord::Base
    validates :nombrePuesto, uniqueness: {message: "Ya existe ese tipo de puesto"}, presence: {message: "El nombre del puesto es requerido"}, length: {minimum: 15, maximum: 80, message: "Mínimo 15 caracteres, Máximo 80"}, format: {with: /\A[a-z[á,é,í,ó,ú,Á,É,Í,Ó,Ú]A-Z\s]+\z/, message: "Sólo se aceptan letras!"}
    validates :alterno, uniqueness: {message: "Ya existe ese tipo de puesto alterno"}, presence: {message: "El nombre del puesto alterno es requerido"}, length: {minimum: 5, maximum: 80, message: "Mínimo 5 caracteres, Máximo 80"}, format: {with: /\A[a-z[á,é,í,ó,ú,Á,É,Í,Ó,Ú]A-Z\s]+\z/, message: "Sólo se aceptan letras!"}
    validates :estado, presence: {message: 'El estado del tipo nde Puesto es requerido'}
end