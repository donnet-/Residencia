class CatCriterioAcademiasController < ApplicationController
    before_action :authenticate_usuario!
    load_and_authorize_resource :except => :create
    helper_method :sort_column, :sort_direction
    
    def index
        @academias = CatCriterioAcademia.all.order(sort_column + ' ' + sort_direction).paginate(per_page: 10, page: params[:page])
    end
    
    def new
        @academia = CatCriterioAcademia.new
    end
    
    def create
        @usuario = current_usuario
        @academia = CatCriterioAcademia.create(academia_params)
        if @academia.save
            redirect_to cat_criterio_academias_path
        else
            render :new
        end
    end
    
    def edit
        @academia = CatCriterioAcademia.find(params[:id])
    end
    
    def update
        @academia = CatCriterioAcademia.find(params[:id])
        if @academia.update(academia_params)
            redirect_to cat_criterio_academias_path
        else
            render :edit
        end
    end
    
    private
    
    def academia_params
        params.require(:cat_criterio_academia).permit(:numero, :criterio, :estado)
    end
    
    def sort_column
        params[:sort] || "id"
    end
    
    def sort_direction
        params[:direction] || "desc"
    end
end