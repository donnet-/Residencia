class CatViatico < ActiveRecord::Base
    has_and_belongs_to_many :actividades
    
    validates :nombreViatico, uniqueness: {message: "Ya existe ese tipo de viatico"}, presence: {message: "El nombre del viatico es requerido"}, length: {minimum: 5, maximum: 30, message: "Mínimo 5 caracteres, Máximo 30"}, format: {with: /\A[a-z[á,é,í,ó,ú,Á,É,Í,Ó,Ú]A-Z\s]+\z/, message: "Sólo se aceptan letras"}
    validates :estado, presence: {message: 'El estado del viatico es requerido'}
end