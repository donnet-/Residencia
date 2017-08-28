class CatCriterioEvaluacionDocentesController < ApplicationController
    before_action :authenticate_usuario!
    load_and_authorize_resource :except => :create
    helper_method :sort_column, :sort_direction
    
    def index
        @evaluaciones = CatCriterioEvaluacionDocente.all.order(sort_column + ' ' + sort_direction).paginate(per_page: 10, page: params[:page])
    end
    
    def new
        @evaluacion = CatCriterioEvaluacionDocente.new
    end
    
    def create
        @usuario = current_usuario
        @evaluacion = CatCriterioEvaluacionDocente.create(evaluacion_params)
        if @evaluacion.save
            redirect_to cat_criterio_evaluacion_docentes_path
        else
            render :new
        end
    end
    
    def edit
        @evaluacion = CatCriterioEvaluacionDocente.find(params[:id])
    end
    
    def update
        @evaluacion = CatCriterioEvaluacionDocente.find(params[:id])
        if @evaluacion.update(evaluacion_params)
            redirect_to cat_criterio_evaluacion_docentes_path
        else
            render :edit
        end
    end
    
    private
    
    def evaluacion_params
        params.require(:cat_criterio_evaluacion_docente).permit(:numero, :criterio, :estado)
    end
    
    def sort_column
        params[:sort] || "id"
    end
    
    def sort_direction
        params[:direction] || "desc"
    end
end