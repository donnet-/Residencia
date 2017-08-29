class Usuario < ActiveRecord::Base    
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable#, :invitable
    
    #validates :curp, format: { with: /\A[A-Z][AEIOUX][A-Z]{2}[0-9]{2}[0-1][0-9][0-3][0-9][MH][A-Z][BCDFGHJKLMNÑPQRSTVWXYZ]{4}[0-9A-Z][0-9]\z/i, message: 'No es un formato de CURP válido' }
    #validates :rfc, format: { with: /\A[A-ZÑ&]{3,4}[0-9]{2}[0-1][0-9][0-3][0-9]([A-Z0-9]{3})?\z/i, message: 'No es un formato de RFC válido'}
    #validates :numControl, numericality: { only_integer: true, message: "Sólo números" }, length: {maximum: 12, message: 'Maximo 12'} 
    #validates :rol, presence: {message: "El rol es requerido!!"}
    validate :valid_sign_up
    #validate :validate_user_igual
    validate :valid_user
    
    def valid_user
        @usuario = Usuario.all
        for user in @usuario
            if user.id != id
                if user.rol == 'admin' && rol == 'admin'
                    errors.add(:rol, "Ya existe un administrador")
                elsif user.rol == 'jefe_de_docencia' && rol == 'jefe_de_docencia'
                    errors.add(:rol, "Ya existe un jefe de docencia")
                elsif user.rol == 'jefe_de_investigacion' && rol == 'jefe_de_investigacion'
                    errors.add(:rol, "Ya existe un jefe de investigacion")
                elsif user.rol == 'presidente_reunion_academia' && rol == 'presidente_reunion_academia'
                    errors.add(:rol, "Ya existe un presidente de reunión de academia")
                end
            end
        end
    end
    
    def valid_sign_up
        if rol == 'docente'
            @docente = Docente.find_by(curp: curp)
            if @docente != nil
                if @docente.rfc == rfc
                    if @docente.email != email
                        errors.add(:message, "Esos datos aún no se encuentran en el sistema, ir con el administrador!!")
                    end
                else
                    errors.add(:message, "Esos datos aún no se encuentran en el sistema, ir con el administrador!!")
                end
            else
                errors.add(:message, "Esos datos aún no se encuentran en el sistema, ir con el administrador!!")
            end
        elsif rol == 'estudiante'
            @estudiante = Estudiante.find_by(curpEstudiante: curp)
            if @estudiante != nil
                if @estudiante.numControl == numControl
                    if @estudiante.email != email
                        errors.add(:message, "Esos datos aún no se encuentran en el sistema, ir con el administrador!!")
                    end
                else
                    errors.add(:message, "Esos datos aún no se encuentran en el sistema, ir con el administrador!!")
                end
            else
                errors.add(:message, "Esos datos aún no se encuentran en el sistema, ir con el administrador!!")
            end
        end
    end
        
    def validate_user_igual
        
        @usuario = Usuario.find_by(curp: curp)
        
        if @usuario != nil
            if @usuario.rfc == rfc || @usuario.numControl == numControl
                if @usuario.email == email
                    errors.add(:curp, "Ya existe un usuario con esos datos!!!")
                end
            end
        end
    end

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable#, :invitable
    
  #validates :curp, format: { with: /\A[A-Z][AEIOUX][A-Z]{2}[0-9]{2}[0-1][0-9][0-3][0-9][MH][A-Z][BCDFGHJKLMNÑPQRSTVWXYZ]{4}[0-9A-Z][0-9]\z/i, message: 'No es un formato de CURP válido' }
  #validates :rfc, format: { with: /\A[A-ZÑ&]{3,4}[0-9]{2}[0-1][0-9][0-3][0-9]([A-Z0-9]{3})?\z/i, message: 'No es un formato de RFC válido'}
  #validates :numControl, numericality: { only_integer: true, message: "Sólo números" }, length: {maximum: 12, message: 'Maximo 12'} 
  #validates :rol, presence: {message: "El rol es requerido!!"}
  validate :valid_sign_up
  #validate :validate_user_igual
  validate :valid_user
  
  def valid_user
    @usuario = Usuario.all
    for user in @usuario
      if user.id != id
        if user.rol == 'admin' && rol == 'admin'
          errors.add(:rol, "Ya existe un administrador")
        elsif user.rol == 'jefe_de_docencia' && rol == 'jefe_de_docencia'
          errors.add(:rol, "Ya existe un jefe de docencia")
        elsif user.rol == 'jefe_de_investigacion' && rol == 'jefe_de_investigacion'
          errors.add(:rol, "Ya existe un jefe de investigacion")
        elsif user.rol == 'presidente_reunion_academia' && rol == 'presidente_reunion_academia'
          errors.add(:rol, "Ya existe un presidente de reunión de academia")
        end
      end
    end
  end
  
  def valid_sign_up
    if rol == 'docente'
      @docente = Docente.find_by(curp: curp)
      if @docente != nil
        if @docente.rfc == rfc and @docente.email != email
          errors.add(:message, "Esos datos aún no se encuentran en el sistema, ir con el administrador!!")
        else
          errors.add(:message, "Esos datos aún no se encuentran en el sistema, ir con el administrador!!")
        end
      else
        errors.add(:message, "Esos datos aún no se encuentran en el sistema, ir con el administrador!!")
      end
      
      elsif rol == 'estudiante'
        @estudiante = Estudiante.find_by(curpEstudiante: curp)
        if @estudiante != nil
          if @estudiante.numControl == numControl and @estudiante.email != email
            errors.add(:message, "Esos datos aún no se encuentran en el sistema, ir con el administrador!!")
          else
            errors.add(:message, "Esos datos aún no se encuentran en el sistema, ir con el administrador!!")
          end
        else
          errors.add(:message, "Esos datos aún no se encuentran en el sistema, ir con el administrador!!")
        end
      
      elsif rol == 'empresa'
        @empresa = Empresa.find_by(rfcEmpresa: rfc)
        if @empresa != nil
          if @empresa.email != email
            errors.add(:message, "Esos datos aún no se encuentran en el sistema. Acuda con el Administrador.")
          end
        end
    end
  end
      
  def validate_user_igual
    @usuario = Usuario.find_by(curp: curp)
    if @usuario != nil
      if @usuario.rfc == rfc || @usuario.numControl == numControl
        if @usuario.email == email
          errors.add(:curp, "Ya existe un usuario con esos datos!!!")
        end
      end
    end
  end

end
