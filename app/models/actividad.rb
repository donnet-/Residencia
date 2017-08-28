class Actividad < ActiveRecord::Base
  belongs_to :cat_tipo_actividad
    
    has_many :actividad_docentes, dependent: :destroy
    accepts_nested_attributes_for :actividad_docentes, allow_destroy: true
    has_many :actividad_evidencias, dependent: :destroy
    has_and_belongs_to_many :cat_viaticos
    #has_one :actualizacion_docente_profesional, dependent: :destroy
    has_one :visita, dependent: :destroy
    has_many :viaje_grupos, dependent: :destroy
    has_many :modulo_diplomados
	has_one :actualizacion
	accepts_nested_attributes_for :actualizacion, allow_destroy: true, reject_if: :all_blank
    
    validates :nombreActividad, uniqueness: {message: "El nombre de la actividad debe ser único"}, presence: {message: "El nombre de la actividad es requerido"}, length: {minimum: 5, maximum: 100, message: "Mínimo 5 caracteres, Máximo 100"}, format: {with: /\A[a-z[á,é,í,ó,ú,Á,É,Í,Ó,Ú]A-Z\s]{1,100}[\d]{0,6}+\z/, message: "El formato debe ser a menos una letra y despues números!"}
    validates :tipoComision, presence: {message: "El tipo de comisión es requerido"}, length: {minimum: 4, maximum: 20, message: "Mínimo 5 caracteres, Máximo 20"}
    validates :tipoEvidencia, presence: {message: "El tipo de evidencia es requerido"}, length: {minimum: 5, maximum: 20, message: "Mínimo 5 caracteres, Máximo 20"}
    validates :cat_tipo_actividad_id, presence: {message: "El tipo de la actividad es requerido"}
    validates :fechaInicio, presence: {message: "La fecha de inicio de la actividad es requerido"}
    validates :fechaTermino, presence: {message: "La fecha de término de la actividad es requerido"}
    validate :maximum_date_inicio_date_termino
    validate :equals_activity
    validate :valid_viatico
     
    def maximum_date_inicio_date_termino
        if (fechaTermino != nil && fechaInicio != nil)
            if (fechaTermino < fechaInicio)
                errors.add(:fechaInicio, "La fecha de termino debe ser mayor a la de término!!")
            end
        end
    end
    
    def equals_activity
        @act = Actividad.all
        
        for elem in @act
            if elem.id != id
                if elem.nombreActividad == nombreActividad && elem.cat_tipo_actividad_id == cat_tipo_actividad_id
                    if elem.fechaInicio == fechaInicio
                        if elem.fechaTermino == fechaTermino
                            errors.add(:nombreActividad, "Ese curso ya esta registrado!!")
                        end
                    else
                        errors.add(:nombreActividad, "Esa actividad ya esta registrada con esa fecha de inicio")
                    end
                end
            end
        end
    end
    
    def valid_viatico
        @tipoAct = CatTipoActividad.all
        
        for tipoAct in @tipoAct
            if tipoAct.id == cat_tipo_actividad_id
                if tipoAct.nombreTipoAct == 'Proyecto'
                    if tipoComision == 'Con Viaticos'
                        errors.add(:tipoComision, "El proyecto de residencia no requiere de Viaticos!")
                    end
                elsif tipoAct.nombreTipoAct == 'Curso Materia'
                    if tipoComision == 'Con Viaticos'
                        errors.add(:tipoComision, "La actividad de Curso Materia no requiere de Viaticos!")
                    end
				elsif tipoAct.nombreTipoAct == 'Examen profesional'
                    if tipoComision == 'Con Viaticos'
                        errors.add(:tipoComision, "La actividad de Examen profesional no requiere de Viaticos!")
                    end
                elsif tipoAct.nombreTipoAct == 'Aplicador CENEVAL'
                    if tipoComision == 'Con Viaticos'
                        errors.add(:tipoComision, "La actividad como Aplicador CENEVAL no requiere de Viaticos!")
                    end
                elsif tipoAct.nombreTipoAct == 'Tutoria'
                    if tipoComision == 'Con Viaticos'
                        errors.add(:tipoComision, "La actividad de Tutoria no requiere de Viaticos!")
                    end
                elsif tipoAct.nombreTipoAct == 'Asesoria'
                    if tipoComision == 'Con Viaticos'
                        errors.add(:tipoComision, "La actividad de Asesoria no requiere de Viaticos!")
                    end
                elsif tipoAct.nombreTipoAct == 'Publicacion Articulo'
                    if tipoComision == 'Con Viaticos'
                        errors.add(:tipoComision, "La actividad de Publicacion de artículo no requiere de Viaticos!")
                    end
                elsif tipoAct.nombreTipoAct == 'Proyecto de Investigacion'
                    if tipoComision == 'Con Viaticos'
                        errors.add(:tipoComision, "Proyecto de Investigacion no requiere de Viaticos!")
                    end
                elsif tipoAct.nombreTipoAct == 'Actividad Complementaria'
                    if tipoComision == 'Con Viaticos'
                        errors.add(:tipoComision, "La actividad complementaria no requiere de Viaticos!")
                    end
                end
            end
        end
    end
end