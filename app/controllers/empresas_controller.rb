class EmpresasController < ApplicationController
    helper_method :sort_column, :sort_direction
    before_action :authenticate_usuario!
    load_and_authorize_resource :except => :create
    
    def index
        @empresas = Empresa.order(sort_column + ' ' + sort_direction).paginate( per_page: 10, page: params[:page])
    end
    
    def show
        @empresa = Empresa.find(params[:id])
    end
    
    def new
        @empresa = Empresa.new
    end
    
    def create
        @usuario = current_usuario
        @empresa = Empresa.create(empresa_params)
        
        if @empresa.save
            redirect_to empresas_path
        else
            render :new
        end
    end
    
    def edit
        @empresa = Empresa.find(params[:id])
    end
    
    def update
        @empresa = Empresa.find(params[:id])
        
        if @empresa.update(empresa_params)
            redirect_to empresas_path
        else
            render :edit
        end
    end
    
    def destroy
        @empresa = Empresa.find(params[:id])
        @empresa.destroy
        redirect_to empresas_path
    end
    
    private
    
    def empresa_params
        params.require(:empresa).permit(:rfcEmpresa, :nombreE, :pdfConvenio, :email, :contacto, :telefono, :estado, :calle, :colonia, :numInterior, :numExterior, :estadoEmp, :usuario_id)
    end
    
    def sort_column
        params[:sort] || "id"
    end
    
    def sort_direction
        params[:direction] || "desc"
    end
end