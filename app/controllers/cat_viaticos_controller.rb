class CatViaticosController < ApplicationController
    before_action :authenticate_usuario!
    load_and_authorize_resource :except => :create
    helper_method :sort_column, :sort_direction
    
    def index
        @viaticos = CatViatico.order(sort_column + ' ' + sort_direction).paginate( per_page: 10, page: params[:page])
    end
    
    def show
        @viatico = CatViatico.find(params[:id])
    end
    
    def new
        @viatico = CatViatico.new
    end
    
    def create
        @usuario = current_usuario
        @viatico = CatViatico.create(viatico_params)
        
        if @viatico.save
            redirect_to cat_viaticos_path
        else
            render :new
        end
    end
    
    def edit
        @viatico = CatViatico.find(params[:id])
    end
    
    def update
        @viatico = CatViatico.find(params[:id])
        
        if @viatico.update(viatico_params)
            redirect_to cat_viaticos_path
        else
            render :edit
        end
    end
    
    def destroy
        @viatico = CatViatico.find(params[:id])
        @viatico.destroy
        redirect_to cat_viaticos_path
    end
    
    private
    
    def viatico_params
        params.require(:cat_viatico).permit(:nombreViatico, :estado, :user_id)
    end
    
    def sort_column
        params[:sort] || "id"
    end
    
    def sort_direction
        params[:direction] || "desc"
    end
end