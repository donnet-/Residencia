class CatEvidenciasController < ApplicationController
    helper_method :sort_column, :sort_direction
    before_action :authenticate_usuario!
    load_and_authorize_resource :except => :create
    
    def index
        @evidencias = CatEvidencia.order(sort_column + ' ' + sort_direction).paginate( per_page: 10, page: params[:page])
    end
    
    def show
        @evidencia = CatEvidencia.find(params[:id])
    end
    
    def new
        @evidencia = CatEvidencia.new
    end
    
    def create
        @usuario = current_usuario
        @evidencia = CatEvidencia.create(evidencia_params)
        
        if @evidencia.save
            redirect_to cat_evidencias_path
        else
            render :new
        end
    end
    
    def edit
        @evidencia = CatEvidencia.find(params[:id])
    end
    
    def update
        @evidencia = CatEvidencia.find(params[:id])
        
        if @evidencia.update(evidencia_params)
            redirect_to cat_evidencias_path
        else
            render :edit
        end
    end
    
    def destroy
        @evidencia = CatEvidencia.find(params[:id])
        @evidencia.destroy
        redirect_to cat_evidencias_path
    end
    
    private
    
    def evidencia_params
        params.require(:cat_evidencia).permit(:nombreEvidencia, :estado, :user_id, requisito_evidencias_attributes: [:id, :nombreRequisito, :_destroy])
    end    
    
    def sort_column
        params[:sort] || "id"
    end
    
    def sort_direction
        params[:direction] || "desc"
    end
end