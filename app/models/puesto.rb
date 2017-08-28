class Puesto < ActiveRecord::Base
  belongs_to :cat_tipo_puesto
  belongs_to :docente
    
    validates :fechaInicio, presence: {message: "La fecha de inicio es requerida"}
    validates :fechaTermino, presence: {message: "La fecha de termino es requerida"}
    mount_uploader :pdfNombramiento, PdfUploader
    validates :cat_tipo_puesto_id, presence: {message: "El puesto es requerido"}
    validate :image_size_validation, :if => "pdfNombramiento?"
    validate :maximum_date_inicio_date_termino
    validate :repit_puesto
    
    def image_size_validation
        if pdfNombramiento.size > 1.megabytes
            errors.add(:pdfNombramiento, "El PDF debe pesar menos de 1MB")
        end
    end
    
    def maximum_date_inicio_date_termino
        if fechaTermino != nil
            if fechaInicio > fechaTermino
                errors.add(:fechaTermino, "La fecha término es menor a la de inicio")
            end
        end
    end
    
    def repit_puesto
        @docp = Puesto.all
        for elem in @docp
            if elem.id != id
                if elem.docente_id == docente_id
                    if elem.cat_tipo_puesto_id == cat_tipo_puesto_id
                        if elem.estado == 'Inactivo'
                            if elem.fechaInicio <= fechaInicio
                                if fechaTermino !=  nil
                                    if elem.fechaTermino <= fechaTermino
                                        errors.add(:cat_tipo_puesto_id, "El docenta ya tiene registrado ese puesto!!!")
                                    else
                                        errors.add(:fechaTermino, "El docenta ya tiene registrado ese puesto!!!")
                                    end
                                end
                            end
                        else
                            if elem.fechaInicio <= fechaInicio
                                if fechaTermino != nil
                                if elem.fechaTermino <= fechaTermino
                                    errors.add(:cat_tipo_puesto_id, "El docente no puede tener dos cargos en el mismo periodo!!!")
                                else
                                    errors.add(:fechaTermino, "El docenta ya tiene registrado ese puesto!!!")
                                end
                                end
                            end
                        end
                    else
                    end
                else
                    if elem.cat_tipo_puesto_id == cat_tipo_puesto_id
                        if elem.estado == "Activo"
                            errors.add(:cat_tipo_puesto_id, "Un docente ya esta a cargo de ese puesto!!!")
                        end
                    end
                end
            end
        end
    end
end