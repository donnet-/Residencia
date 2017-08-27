class CursoMateriaEstudiantesController < ApplicationController
    before_action :authenticate_usuario!
    load_and_authorize_resource :except => :create
    helper_method :sort_column, :sort_direction
    
  def index
  	@estudiantesC = CursoMateriaEstudiante.order(sort_column + ' ' + sort_direction).paginate( per_page: 10, page: params[:page])
  end
    
  def create     
     @curso = CursoMateria.find(params[:curso_materia_id])
     @estudiantesC = @curso.curso_materia_estudiantes.create(cursoEstudiante_params)
     redirect_to curso_materia_path(@curso)
  end

  def import
  	@curso = CursoMateria.find(params[:curso_materia_id])
  	CursoMateriaEstudiante.import(@curso,params[:file])
    redirect_to curso_materia_path(@curso), notice: "Importados."
  end
    
  def destroy          		
      @estudiantesC = CursoMateriaEstudiante.find(params[:id])
      @curso = CursoMateria.find(@estudiantesC.curso_materia_id)        
      @estudiantesC.destroy
      redirect_to curso_materia_path(@curso)
  end
    
    private

    def cursoEstudiante_params
        params.require(:curso_materia_estudiante).permit(:numControl, :nombre, :apellidoPaterno, :apellidoMaterno)
    end
    
    def sort_column
        params[:sort] || "id"
    end
    
    def sort_direction
        params[:direction] || "desc"
    end
end
