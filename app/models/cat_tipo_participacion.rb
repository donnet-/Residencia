class CatTipoParticipacion < ActiveRecord::Base
    has_and_belongs_to_many :cat_tipo_actividades
    
    validates :participacion, presence: {message: 'El tipo de participación es requerido'}, uniqueness: {message: 'Ese tipo de participación ya existe.'}, length: {minimum: 5, maximum: 80, message: 'Mínimo: 5 caracteres, Máximo: 20'}, format: {with: /\A[a-z[á,é,í,ó,ú,Á,É,Í,Ó,Ú]A-Z\s]+\z/, message: "Sólo se aceptan letras"}
    validates :estado, presence: {message: 'El estado del tipo de particpación es requerido'}
end