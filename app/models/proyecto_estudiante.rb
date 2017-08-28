class ProyectoEstudiante < ActiveRecord::Base
  belongs_to :proyecto
  has_and_belongs_to_many :anexos
	
	def method_info_est
        @est = Estudiante.find_by(numcontrol: numControl)
        #@dat = @plan.descripcion
        "#{@est.nombre} #{@est.apPaterno} #{@est.apMaterno}"
    end
end
