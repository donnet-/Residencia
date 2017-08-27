class CatEspecialidad < ActiveRecord::Base
    belongs_to :user
    
    validates :nombreEsp, uniqueness: {message: "Ya está registrada"}, presence: {message: "El nombre de la carrera requerido"}, length: {minimum: 5, maximum: 60, message: "Mínimo 5 caracteres, Máximo 50"}, format: {with: /\A[a-z[á,é,í,ó,ú,Á,É,Í,Ó,Ú]A-Z\s]+\z/, message: "Sólo se aceptan letras"}
    validates :estado, presence: {message: 'El estado de la carrera es requerido'}
    validates :alias, uniqueness: {message: "Ya existe ese alías"}, presence: {message: "Es requerido de un alías"}, length: {minimum: 2, maximum: 6, message: "Mínimo 2 caracteres, máximo 6"}, format: {with: /\A[a-z[.,á,é,í,ó,ú,Á,É,Í,Ó,Ú]A-Z\s]+\z/, message: "Sólo se aceptan letras y puntos"}
end