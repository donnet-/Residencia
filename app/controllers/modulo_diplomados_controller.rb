class ModuloDiplomadosController < ApplicationController
    helper_method :sort_column, :sort_direction
    before_action :authenticate_usuario!
    load_and_authorize_resource :except => :create
    
    def create
        @usuario = current_usuario
        
        @actividad = Actividad.find(params[:actividad_id])
        
        @modulo = @actividad.modulo_diplomados.create(modulo_params)
        
        redirect_to actividad_path(@actividad)
    end
    
    def edit
        @actividad = Actividad.find(params[:actividad_id])
        @diplomado = ModuloDiplomado.find(params[:id])
    end
    
    def update
        @actividad = Actividad.find(params[:actividad_id])
        @diplomado = @actividad.modulo_diplomados.find(params[:id])
        
        if @diplomado.update(modulo_params)
            redirect_to actividad_path(@actividad)
        end
    end
    
    def destroy
        @actividad = Actividad.find(params[:actividad_id])
        @diplomado = @actividad.modulo_diplomados.find(params[:id])
        @diplomado.destroy
        redirect_to actividad_path(@actividad)
    end
    
    private
    
    def modulo_params
        params.require(:modulo_diplomado).permit(:nombreModulo, :fechaInicio, :fechaTermino, :duracion, actividad_docente_ids:[])
    end
    
    def sort_column
        params[:sort] || "id"
    end
    
    def sort_direction
        params[:direction] || "desc"
    end
end