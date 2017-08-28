class CatTipoActividadesController < ApplicationController
    helper_method :sort_column, :sort_direction
    before_action :authenticate_usuario!
    load_and_authorize_resource :except => :create
    
    def index
        @tipoActividades = CatTipoActividad.order(sort_column + ' ' + sort_direction).paginate( per_page: 10, page: params[:page])
    end
    
    def show
        @tipoActividad = CatTipoActividad.find(params[:id])
    end
    
    def new
        @tipoActividad = CatTipoActividad.new
    end
    
    def create
        @usuario = current_usuario
        
        @tipoActividad = CatTipoActividad.create(tipoAct_params)
        if @tipoActividad.save
            respond_to do |format|            
                format.html { redirect_to cat_tipo_actividades_path }
                format.js
            end
        else
            respond_to do |format|            
                format.html { render :new }
                # format.js
            end
        end
        #if @tipoActividad.save
         #   redirect_to cat_tipo_actividades_path
        #else 
        #    render :new
        #end
    end
    
    def edit
        @tipoActividad = CatTipoActividad.find(params[:id])
    end
    
    def update
        @tipoActividad = CatTipoActividad.find(params[:id])
        
        if @tipoActividad.update(tipoAct_params)
            redirect_to cat_tipo_actividades_path
        else
            render :edit
        end
    end
    
    def destroy
        @tipoActividad = CatTipoActividad.find(params[:id])
        @tipoActividad.destroy
        redirect_to cat_tipo_actividades_path
    end
    
    private
    
    def tipoAct_params
        params.require(:cat_tipo_actividad).permit(:nombreTipoAct, :estado, :user_id, :requiereOficio, :cabecera, :textoSugerido, cat_evidencia_ids:[], cat_tipo_participacion_ids:[])
    end
    
    def sort_column
        params[:sort] || "id"
    end
    
    def sort_direction
        params[:direction] || "desc"
    end
end
