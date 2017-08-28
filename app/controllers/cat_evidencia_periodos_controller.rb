class CatEvidenciaPeriodosController < ApplicationController
	    helper_method :sort_column, :sort_direction
    before_action :authenticate_usuario!
    load_and_authorize_resource :except => :create
    
    def index
        #@evidencias = CatEvidenciaPeriodo.order(sort_column + ' ' + sort_direction).paginate( per_page: 10, page: params[:page])
        @evidencias = CatEvidenciaPeriodo.all
    end
    
    def show
        @evidencia = CatEvidenciaPeriodo.find(params[:id])
    end
    
    def new
        @evidencia = CatEvidenciaPeriodo.new
    end
    
    def create
        @usuario = current_usuario
        @evidencia = CatEvidenciaPeriodo.create(evidencia_params)
        
        if @evidencia.save
            redirect_to cat_evidencia_periodos_path
        else
            render :new
        end
    end
    
    def edit
        @evidencia = CatEvidenciaPeriodo.find(params[:id])
    end
    
    def update
        @evidencia = CatEvidenciaPeriodo.find(params[:id])
        
        if @evidencia.update(evidencia_params)
            redirect_to cat_evidencia_periodos_path
        else
            render :edit
        end
    end
    
    def destroy
        @evidencia = CatEvidenciaPeriodo.find(params[:id])
        @evidencia.destroy
        redirect_to cat_evidencia_periodos_path
    end
    
    private
    
    def evidencia_params
        params.require(:cat_evidencia_periodo).permit(:etiqueta, :tipo, :user_id)
    end 
end

