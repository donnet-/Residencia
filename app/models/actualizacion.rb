class Actualizacion < ActiveRecord::Base
  belongs_to :actividad
  has_many :horario_actualizaciones
  accepts_nested_attributes_for :horario_actualizaciones, allow_destroy: true, reject_if: :all_blank
	
	validates :tipoPeriodo, presence: {message: 'El periodo es requerido'}, length: {minimum: 12, maximum: 15, message: 'El mínimo de caracteres debe ser 12, máximo 15'}
    validates :tipoActualizacion, presence: {message: 'El tipo de actualizacion es requerido'}, length: {minimum: 7, maximum: 25, message: 'El mínimo de caracteres es 7, máximo 15'}
    validates :modalidad, presence: {message: 'La modalidad es requerida'}, length: {minimum: 6, maximum:12, message: 'El minimo de caracteres es 6, máximo 12'}
    validates :horasCapacitacion, presence: {message: 'El total de horas del curso es requerido'}, length: {minimum: 2, maximum: 10, message: 'Mínimo 2 caracteres, máximo 10'}
end
