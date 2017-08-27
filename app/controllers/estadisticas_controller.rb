class EstadisticasController < ApplicationController
    def index
		if params[:periodo_curs_materia_id] != nil			
			@archivos = Estadistica.where(periodo_curs_materia_id: params[:periodo_curs_materia_id])
		else
			@archivos = Estadistica.all
		end
	end
 
	def new	
		@archivo = Estadistica.new
		@periodo = CursoMateria.find(params[:curso_materia_id])
	end
	def create
		@archivo = Estadistica.create(archivo_params)		
		@periodo = CursoMateria.find(archivo_params[:curso_materia_id])
	
		if @archivo.save			
			redirect_to periodo_curs_materias_path, notice: "Se ha guardado"
		else
			render :new
		end		
	end
	def show
		@archivo = Estadistica.find(params[:id])
		@periodo = CursoMateria.find(params[:curso_materia_id])
	end
	def destroy		
		@archivo = Estadistica.find(params[:id])
		@curso_materia = PeriodoCursMateria.find(@archivo.periodo_curs_materia_id)
        @archivo.destroy
        redirect_to periodo_curs_materia_estadisticas_path(@curso_materia)
	end
	def edit
		@archivo = Estadistica.find(params[:id])
		@periodo = PeriodoCursMateria.find(@archivo.periodo_curs_materia_id)
	end
	def update
		@archivo = Estadistica.find(params[:id])
		@periodo = PeriodoCursMateria.find(@archivo.periodo_curs_materia_id)
        if @archivo.update(archivo_params)
            redirect_to periodo_curs_materia_estadisticas_path(@periodo)
        else
            render :edit
        end
	end


	private
	def archivo_params
		params.require(:estadistica).permit(:carrera, :ordinaria, :complementaria, :especial, :desertores, :reprobados, :periodo_curs_materia_id, :curso_materia_id)
	end
end