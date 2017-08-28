class CursoMateria < ActiveRecord::Base
  belongs_to :docente
  belongs_to :cat_materia
  belongs_to :periodo_curs_materia
    
    has_many :viaje_grupos
    has_many :curso_evidencia
    has_many :estadisticas
    
    #has_many :curso_materia_estudiantes, dependent: :destroy
    #accepts_nested_attributes_for :curso_materia_estudiantes, allow_destroy: true
    
    validates :nombreGrupo, presence: {message: "El nombre del grupo es requerido"}, length: {minimum: 3, maximum: 10, message: 'El mínimo de caracteres es de 3, máximo de 10'}, format: {with: /\A[a-z[á,é,í,ó,ú,Á,É,Í,Ó,Ú]A-Z\s]+\z/, message: "Sólo se aceptan letras!"}
    validates :aula, length: {minimum: 2, maximum: 30, message: 'Mínimo de caracteres 2, máximo: 30'}
    validates :cat_materia_id, presence: {message: "La materia es requerida"}
    validates :total, presence: {message: "El total de estudiantes es requerido"}, numericality: {only_integer: true, greater_than: 9, less_than: 56}
    
#    def image_size_valid
#        if pdfInstrumentacion.size > 1.megabytes
#            errors.add(:pdfInstrumentacion, "El PDF debe pesar menos de 1MB")
#        elsif pdfActa.size > 1.megabytes
#            errors.add(:pdfActa, "El PDF debe pesar menos de 1MB")
#        elsif pdfCalifParcial.size > 1.megabytes
#            errors.add(:pdfCalifParcial, "El PDF debe pesar menos de 1MB")
#        elsif muestraPortafolio.size > 1.megabytes
#            errors.add(:muestraPortafolio, "El PDF debe pesar menos de 1MB")
#        end
#    end
#    
#    def repit_course_mat?
#        @curs = CursoMateria.all
#        for matcu in @curs
#            if matcu.id != id
#                if matcu.cat_materia_id == cat_materia_id
#                    if matcu.periodo == periodo && matcu.nombreGrupo == nombreGrupo
#                        errors.add(:nombreGrupo, "Ya se encuentra registrada esa materia en ese grupo!")
#                    end
#                end
#            end
#        end
#    end
#    
    def information_course
        @mat = CatMateria.find(cat_materia_id)
        @mate = @mat.nombreMat
        
        "#{nombreGrupo} #{@mate} #{@doce}"
    end
end
