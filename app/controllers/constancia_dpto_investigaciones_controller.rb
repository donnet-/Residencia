class ConstanciaDptoInvestigacionesController < ApplicationController
    helper_method :sort_column, :sort_direction
    before_action :authenticate_usuario!
    load_and_authorize_resource :except => :create
    
    def index
        @constancias = ConstanciaDptoInvestigacion.all.order(sort_column + ' ' + sort_direction).paginate(per_page: 10, page: params[:page])
    end
    
    def show
        @constancia = ConstanciaDptoInvestigacion.find(params[:id])
    end
    
    def new
        @constancia = ConstanciaDptoInvestigacion.new
    end
    
    def create
        @constancia = ConstanciaDptoInvestigacion.create(constancia_params)
        if @constancia.save
            redirect_to constancia_dpto_investigacion_path(@constancia)
        else
            render :new
        end
    end
    
    def edit
        @constancia = ConstanciaDptoInvestigacion.find(params[:id])
    end
    
    def update
        @constancia = ConstanciaDptoInvestigacion.find(params[:id])
        
        if @constancia.update(constancia_params)
            redirect_to constancia_dpto_investigacion_path(@constancia)
        else
            render :edit
        end
    end
    
    def destroy
        @constancia = ConstanciaDptoInvestigacion.find(params[:id])
        @constancia.destroy()
        redirect_to constancia_dpto_investigaciones_path
    end
    
    private
    
    def constancia_params
        params.require(:constancia_dpto_investigacion).permit(:actividad_id, :fecha)
    end
    
    def sort_column
        params[:sort] || "id"
    end
    
    def sort_direction
        params[:direction] || "desc"
    end
end