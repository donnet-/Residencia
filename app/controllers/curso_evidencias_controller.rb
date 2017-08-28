class CursoEvidenciasController < ApplicationController
    def index
		x  = Docente.find_by(email: current_usuario.email)
            if params[:periodo] != nil                 
                pe = params[:periodo] 
                pe = pe + params[:anio] 
                @archivo = PeriodoCursMateria.find_by(docente_id: x.id, periodo: pe)
                if @archivo != nil
                    @archivos = CursoEvidencia.where(periodo_curs_materia_id: @archivo.id)
                else
                   @archivos = []
                end
            else
               @archivo = PeriodoCursMateria.where(docente_id: x.id).last
       	       if @archivo != nil
                    @archivos = CursoEvidencia.where(periodo_curs_materia_id: @archivo.id)
                else
                    @archivos = []
                end
             end             
	end
 
	def new	
		@archivo = CursoEvidencia.new
		@periodo = PeriodoCursMateria.find(params[:periodo_curs_materia_id])
	end
	def create
		@archivo = CursoEvidencia.create(archivo_params)		
		@periodo = PeriodoCursMateria.find(archivo_params[:periodo_curs_materia_id])
		if @archivo.save
			redirect_to periodo_curs_materia_curso_evidencias_path(@periodo)
		else
			render :new
		end		
	end
	def show
		@archivo = CursoEvidencia.find(params[:id])
		@periodo = PeriodoCursMateria.find(params[:periodo_curs_materia_id])
	end
	def destroy		
		@archivo = CursoEvidencia.find(params[:id])
		@curso_materia = PeriodoCursMateria.find(@archivo.periodo_curs_materia_id)
        @archivo.destroy
        redirect_to periodo_curs_materia_curso_evidencias_path(@curso_materia)
	end
	def edit
		@archivo = CursoEvidencia.find(params[:id])
		@periodo = PeriodoCursMateria.find(@archivo.periodo_curs_materia_id)
	end
	def update
		@archivo = CursoEvidencia.find(params[:id])
		@periodo = PeriodoCursMateria.find(@archivo.periodo_curs_materia_id)
        if @archivo.update(archivo_params)
            redirect_to periodo_curs_materia_curso_evidencias_path(@periodo)
        else
            render :edit
        end
	end


	private
	def archivo_params
		params.require(:curso_evidencia).permit(:archivo, :etiqueta, :periodo_curs_materia_id, :curso_materia_id)
	end
end