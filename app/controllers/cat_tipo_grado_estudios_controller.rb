class CatTipoGradoEstudiosController < ApplicationController
    helper_method :sort_column, :sort_direction
    before_action :authenticate_usuario!
    load_and_authorize_resource :except => :create
    
    def index
        @tipoGrados = CatTipoGradoEstudio.order(sort_column + ' ' + sort_direction).paginate( per_page: 10, page: params[:page])
    end
    
    def show 
        @tipoGrado = CatTipoGradoEstudio.find(params[:id])
    end
    
    def new
        @tipoGrado = CatTipoGradoEstudio.new
    end
    def create
        @usuario = current_usuario
        @tipoGrado = CatTipoGradoEstudio.create(tipoGrado_params)
        
        if @tipoGrado.save
            redirect_to cat_tipo_grado_estudios_path
        else
            render :new
        end
    end
    
    def edit
        @tipoGrado = CatTipoGradoEstudio.find(params[:id])
    end
    
    def update
        @tipoGrado = CatTipoGradoEstudio.find(params[:id])
        
        if @tipoGrado.update(tipoGrado_params)
            redirect_to cat_tipo_grado_estudios_path
        else
            render :edit
        end
    end
    
    def destroy
        @tipoGrado = CatTipoGradoEstudio.find(params[:id])
        @tipoGrado.destroy
        redirect_to cat_tipo_grado_estudios_path
    end
    
    private
    
    def tipoGrado_params
        params.require(:cat_tipo_grado_estudio).permit(:nombreTipoGrado, :estado, :user_id)
    end
    
    def sort_column
        params[:sort] || "id"
    end
    
    def sort_direction
        params[:direction] || "desc"
    end
end