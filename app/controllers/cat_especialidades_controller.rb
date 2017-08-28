class CatEspecialidadesController < ApplicationController
    helper_method :sort_column, :sort_direction
    before_action :authenticate_usuario!
    load_and_authorize_resource :except => :create
    
    def index
        @especialidades = CatEspecialidad.order(sort_column + ' ' + sort_direction).paginate( per_page: 10, page: params[:page])
    end
    
    def show
        @especialidad = CatEspecialidad.find(params[:id])
    end
    
    def new
        @especialidad = CatEspecialidad.new
    end
    
    def create
        @usuario = current_usuario
        @especialidad = CatEspecialidad.create(especialidad_params)
        
        if @especialidad.save
            redirect_to cat_especialidades_path
        else
            render :new
        end
    end
    
    def edit
        @especialidad = CatEspecialidad.find(params[:id])
    end
    
    def update
        @especialidad = CatEspecialidad.find(params[:id])
        
        if @especialidad.update(especialidad_params)
            redirect_to cat_especialidades_path
        else
            render :edit
        end
    end
    
    def destroy
        @especialidad = CatEspecialidad.find(params[:id])
        @especialidad.destroy
        redirect_to cat_especialidades_path
    end
    
    private
    
    def especialidad_params
        params.require(:cat_especialidad).permit(:nombreEsp, :alias, :estado, :user_id)
    end
    
    def sort_column
        params[:sort] || "id"
    end
    
    def sort_direction
        params[:direction] || "desc"
    end
end