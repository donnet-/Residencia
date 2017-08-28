class Proyecto < ActiveRecord::Base
  belongs_to :actividad
  belongs_to :cat_tipo_examen_proyecto
  has_one :anexo
  has_many :proyecto_estudiantes
  accepts_nested_attributes_for :proyecto_estudiantes, allow_destroy: true
  has_many :proyecto_docentes
  accepts_nested_attributes_for :proyecto_docentes, allow_destroy: true
    
  validates :numProyecto, presence: {message: "El número no debe estar en blanco"}, uniqueness: {message: "El número de proyecto ya existe"}, length: {minimum: 8, maximum: 80, message: "Minimo 8 caracteres, máximo 80"}, format: {with: /\A[A-Za-z0-9\s]+\z/, message: "El número de proyecto debe ser alfanúmerico"}
  validates :nombreProyecto, presence: {message: "El nombre no debe estar en blanco"}, uniqueness: {message: "El nombre del proyecto ya existe"}, length: {minimum: 5, maximum: 250}, format: {with: /\A[a-z[á,é,í,ó,ú,Á,É,Í,Ó,Ú]A-Z\s]+\z/, message: "Sólo se aceptan letras!"}
  validates :status, presence: {message: "debe tener un estado"}, length: {maximum: 20}
  validates :asesorExterno, length: {minimum: 0, maximum: 80, message: "Máximo 80 caracteres!!"}
  validates :fechaInicio, presence: {message: "La fecha de inicio es requerida!"}
  validates :fechaTermino, presence: {message: "La fecha de término es requerida!"}
  validates :periodo, presence: {message: "El periodo es requerido! "}
  validates :rfcEmpresa, presence: {message: "La empresa es requerida!"}
  validate :maximum_date_inicio_date_termino
    
  def maximum_date_inicio_date_termino
        if (fechaTermino != nil && fechaInicio != nil)
            if (fechaTermino < fechaInicio)
                errors.add(:fechaInicio, "La fecha de termino debe ser mayor a la de término!!")
            end
        end
    end
end
