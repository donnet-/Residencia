class GrupoActComplementariasController < ApplicationController
    before_action :authenticate_usuario!
    load_and_authorize_resource :except => :create
    helper_method :sort_column, :sort_direction
    
  def index
  	@estudiantesC = GrupoActComplementaria.order(sort_column + ' ' + sort_direction).paginate( per_page: 10, page: params[:page])
  end
    
  def create     
     @complementaria = ActividadComplementaria.find(params[:actividad_complementaria_id])
     @estudiantesC = @complementaria.grupo_act_complementarias.create(grupoEstudiante_params)
      @actividad = Actividad.find_by(:id => @complementaria.actividad_id)
     redirect_to actividad_actividad_complementaria_path(@actividad, @complementaria)
  end
    
  def import
    #@actividad = Actividad.find(params[:actividad_id])
    
  	@complementaria = ActividadComplementaria.find(params[:actividad_complementaria_id])
  	GrupoActComplementaria.import(@complementaria,params[:file])
    
    @actividad = Actividad.find_by(:id => @complementaria.actividad_id)
    redirect_to actividad_actividad_complementaria_path(@actividad, @complementaria), notice: "Importados."
  end
    
  def destroy    
        #@actividad = Actividad.find(params[:actividad_id])
  		@estudiantesC = GrupoActComplementaria.find(params[:id])
  		@complementaria = ActividadComplementaria.find(@estudiantesC.actividad_complementaria_id)        
        @estudiantesC.destroy
        @actividad = Actividad.find_by(:id => @complementaria.actividad_id)
        redirect_to actividad_actividad_complementaria_path(@complementaria)
  end
    
     private
    
    def grupoEstudiante_params
        params.require(:grupo_act_complementaria).permit(:numControl, :nombre, :apPaterno, :apMaterno)
    end
    
    def sort_column
        params[:sort] || "id"
    end
    
    def sort_direction
        params[:direction] || "desc"
    end
end