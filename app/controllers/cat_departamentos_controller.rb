class CatDepartamentosController < ApplicationController
    helper_method :sort_column, :sort_direction
    before_action :authenticate_usuario!
    load_and_authorize_resource :except => :create
    
    def index
        @departamentos = CatDepartamento.order(sort_column + ' ' + sort_direction).paginate( per_page: 10, page: params[:page])
    end
    
    def show
        @departamento = CatDepartamento.find(params[:id])
    end
    
    def new
        @departamento = CatDepartamento.new
    end
    
    def create
        @usuario = current_usuario
        @departamento = CatDepartamento.create(departamento_params)
        
        if @departamento.save
            redirect_to cat_departamentos_path
        else
            render :new
        end
    end
    
    def edit
        @departamento = CatDepartamento.find(params[:id])
    end
    
    def update
        @departamento = CatDepartamento.find(params[:id])
        
        if @departamento.update(departamento_params)
            redirect_to cat_departamentos_path
        else
            render :edit
        end
    end
    
    def destroy
        @departamento = CatDepartamento.find(params[:id])
        @departamento.destroy
        redirect_to cat_departamentos_path
    end
    
    private
    
    def departamento_params
        params.require(:cat_departamento).permit(:nombreDpto, :estado, :user_id, :encargado)
    end
    
    def sort_column
        params[:sort] || "id"
    end
    
    def sort_direction
        params[:direction] || "desc"
    end
end