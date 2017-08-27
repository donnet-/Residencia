class ActividadEvidenciasController < ApplicationController
    helper_method :sort_column, :sort_direction
    before_action :authenticate_usuario!
    load_and_authorize_resource :except => :create
    
    #autocomplete :docente, :nombreD, :display_value => :method_info, :extra_data => [:nombreD, :apPaterno, :apMaterno]
    
    def create
        @usuario = current_usuario
        @actividad = Actividad.find(params[:actividad_id])
		
        @actev = @actividad.actividad_evidencias.create(actev_params)
        redirect_to actividad_path(@actividad)
    end
    
    def edit
        @actividad = Actividad.find(params[:actividad_id])
        @evidencia = ActividadEvidencia.find(params[:id])
    end
    
    def update
        @actividad = Actividad.find(params[:actividad_id])
        @actev = @actividad.actividad_evidencias.find(params[:id])
        
        if @actev.update(actev_params)
            redirect_to actividad_path(@actividad)
        end
    end
    
    def destroy
        @actividad = Actividad.find(params[:actividad_id])
        @actev = @actividad.actividad_evidencias.find(params[:id])
        @actev.destroy
        redirect_to actividad_path(@actividad)
    end
    
    private
    
    def actev_params
        params.require(:actividad_evidencia).permit(:cat_evidencia_id, :pdfEvidencia, :fechaActualizacion, :estado, :usuario_id)
    end
    
    def sort_column
        params[:sort] || "id"
    end
    
    def sort_direction
        params[:direction] || "desc"
    end
end
