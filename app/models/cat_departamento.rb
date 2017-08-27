class CatDepartamento < ActiveRecord::Base
    
    belongs_to :user
    
    validates :nombreDpto, uniqueness: {message: "Ya existe ese departamento"}, presence: {message: "El nombre del departamento es requerido"}, length: {minimum: 5, maximum: 60, message: "Mínimo 5 caracteres, Máximo 60"}, format: {with: /\A[a-z[.,á,é,í,ó,ú,Á,É,Í,Ó,Ú]A-Z\s]+\z/, message: "Sólo se aceptan letras!"}
    validates :estado, presence: {message: "El estado del departamento es requerido!"}
    validates :encargado, presence: {message: "Es requerido el titular a cargo del departamento!!"}, length: {minimum: 15, maximum: 60, message: "Mínimo 15 caracteres, Máximo 60"}, format: {with: /\A[a-z[.,á,é,í,ó,ú,Á,É,Í,Ó,Ú]A-Z\s]+\z/, message: "Sólo se aceptan letras!"}
end