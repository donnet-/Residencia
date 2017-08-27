class ExamenProfesionalesController < ApplicationController
    helper_method :sort_column, :sort_direction
    before_action :authenticate_usuario!
    load_and_authorize_resource :except => :create
    
    #autocomplete :estudiante, :numControl, full: true, :extra_data => [:nombre]

	def new			
		@actividad = Actividad.find(params[:actividad_id])
		@examen = @actividad.build_examen_profesional
		2.times {@examen.egresados.build }	
	end


	def create
        @usuario = current_usuario
		@actividad = Actividad.find(params[:actividad_id])
		@examen = @actividad.create_examen_profesional(examen_params)	
		redirect_to actividad_examen_profesional_path(@actividad, @examen)
		#redirect_to proyecto_path(@actividad)
	end

	def show
		@examen= ExamenProfesional.find_by(params[:id])
        @actividad = Actividad.find(params[:actividad_id])
	end

	def edit		
		@actividad = Actividad.find(params[:actividad_id])
		@examen = ExamenProfesional.find(params[:id])
	end

	def update		
		@examen = ExamenProfesional.find(params[:id])
		if @examen.update(examen_params)
			@actividad = Actividad.find(@examen.actividad_id)
			redirect_to actividad_examen_profesional_path(@actividad, @examen)
		else
			redirect_to edit_actividad_examen_profesional_path(@actividad, @examen)
		end		
	end

	private
	def examen_params
		params.require(:examen_profesional).permit(:hora, :catTipoExamenProyecto_id, :fecha, :estado, egresados_attributes: [:id, :numControl, :cat_plan_curso_id, :opcion, :_destroy])		
	end
    
    def sort_column
        params[:sort] || "id"
    end
    
    def sort_direction
        params[:direction] || "desc"
    end
end