class CatMateria < ActiveRecord::Base
  belongs_to :cat_plan_curso
     
    validates :claveMateria, uniqueness: {message: "Ya existe esa clave de materia"}, presence: {message: "La clave de la materia es requerida"}, length: {minimum: 7, maximum: 10, message: "Mínimo 7 caractéres, Máximo 10"}
    validates :nombreMat, presence: {message: "El nombre de la materia es requerido"}, length: {minimum: 5, maximum: 40, message: "Mínimo 5 caracteres, Máximo 40"}, format: {with: /\A[a-z[á,é,í,ó,ú,Á,É,Í,Ó,Ú]A-Z\s]+\z/, message: "Sólo se aceptan letras"}
    validates :credito, presence: {message: "El número de créditos es requerido"}, length: {minimum:1, maximum:2, message: "Sólo se acepta 1 o 2 dígitos"}
    validates :estado, presence: {message: " El estado de la materia es requerido"}
    #validates :temario, presence: {message: "El temario es requerido!"}
    mount_uploader :temario, PdfUploader
    validate :image_size_validation, :if => "temario?"

    def image_size_validation
        if temario.size > 1.megabytes
            errors.add(:temario, "La imagen debe pesar menos de 1MB")
        end
    end
    
    def method_info_mat
        @plan = CatPlanCurso.find(cat_plan_curso_id)
        @dat = @plan.descripcion
        "#{self.claveMateria} #{self.nombreMat} #{@plan.descripcion}"
    end
end