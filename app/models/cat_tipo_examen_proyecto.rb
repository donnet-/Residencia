class CatTipoExamenProyecto < ActiveRecord::Base
     validates :nombreTipoP, uniqueness: {message: "Ya existe ese tipo de proyecto"}, presence: {message: "El nombre del tipo de proyecto es requerido"}, length: {minimum: 5, maximum: 80, message: "Mínimo 5 caracteres, Máximo 80"}, format: {with: /\A[a-z[á,é,í,ó,ú,Á,É,Í,Ó,Ú]A-Z\s]+\z/, message: "Sólo se aceptan letras!"}
     validates :estado, presence: {message: 'El estado es requerido'}
end
