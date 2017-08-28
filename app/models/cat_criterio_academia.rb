class CatCriterioAcademia < ActiveRecord::Base
    validates :numero, presence: {message: "El número de criterio es requerido"}, numericality: {only_integer: true, message: "Sólo números"}
    validates :criterio, uniqueness: {message: "El número debe ser único"}, length: {minimum: 5, maximum: 250, message: "Mínimo 5 caractares, máximo 250"}, presence: {message: "El criterio es requerido"}
    validates :estado, presence: {message: "El estado es requerido"}
end