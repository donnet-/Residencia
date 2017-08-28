class CatTipoPuestosController < ApplicationController
    helper_method :sort_column, :sort_direction
    before_action :authenticate_usuario!
    load_and_authorize_resource :except => :create
    
    def index
        @tipoPuestos =  CatTipoPuesto.order(sort_column + ' ' + sort_direction).paginate( per_page: 10, page: params[:page])
    end
    
    def show
        @tipoPuesto = CatTipoPuesto.find(params[:id])
    end
    
    def new
        @tipoPuesto = CatTipoPuesto.new
    end
    
    def create
        @usuario = current_usuario
        @tipoPuesto = CatTipoPuesto.create(tipoPuesto_params)
        
        if @tipoPuesto.save
            redirect_to cat_tipo_puestos_path
        else
            render :new
        end
    end
    
    def edit
        @tipoPuesto = CatTipoPuesto.find(params[:id])
    end
    
    def update
        @tipoPuesto = CatTipoPuesto.find(params[:id])
        
        if @tipoPuesto.update(tipoPuesto_params)
            redirect_to cat_tipo_puestos_path
        else
            render :edit
        end
    end
    
    def destroy
        @tipoPuesto = CatTipoPuesto.find(params[:id])
        @tipoPuesto.destroy
        redirect_to cat_tipo_puestos_path
    end
    
    private
    
    def tipoPuesto_params
        params.require(:cat_tipo_puesto).permit(:nombrePuesto, :estado, :user_id, :alterno)
    end
    
    def sort_column
        params[:sort] || "id"
    end
    
    def sort_direction
        params[:direction] || "desc"
    end
end