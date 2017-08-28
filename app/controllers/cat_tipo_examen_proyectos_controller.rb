class CatTipoExamenProyectosController < ApplicationController
    helper_method :sort_column, :sort_direction
    before_action :authenticate_usuario!
    load_and_authorize_resource :except => :create
    
   def index
        @tipoexproys = CatTipoExamenProyecto.order(sort_column + ' ' + sort_direction).paginate( per_page: 10, page: params[:page])
    end
    
    def show
        @tipoexproy = CatTipoExamenProyecto.find(params[:id])
    end
    
    def new
        @tipoexproy = CatTipoExamenProyecto.new
    end
    
    def create
        @usuario = current_usuario
        @tipoexproy = CatTipoExamenProyecto.create(tipoexproy_params)
        
        if @tipoexproy.save
            redirect_to cat_tipo_examen_proyectos_path
        else
            render :new
        end
    end
    
    def edit
        @tipoexproy = CatTipoExamenProyecto.find(params[:id])
    end
    
    def update
        @tipoexproy = CatTipoExamenProyecto.find(params[:id])
        
        if @tipoexproy.update(tipoexproy_params)
            redirect_to cat_tipo_examen_proyectos_path
        else
            render :edit
        end
    end
    
    def destroy
        @tipoexproy = CatTipoExamenProyecto.find(params[:id])
        @tipoexproy.destroy
        redirect_to cat_tipo_examen_proyectos_path
    end
    
    private
    
    def tipoexproy_params
        params.require(:cat_tipo_examen_proyecto).permit(:nombreTipoP, :estado, :user_id)
    end
    
    def sort_column
        params[:sort] || "id"
    end
    
    def sort_direction
        params[:direction] || "desc"
    end
end