class ViajeGruposController < ApplicationController
    helper_method :sort_column, :sort_direction
    before_action :authenticate_usuario!
    load_and_authorize_resource :except => :create
    
    def create
        @usuario = current_usuario
        
        @actividad = Actividad.find(params[:actividad_id])
        @viajgrup = @actividad.viaje_grupos.create(viajgrup_params)   
            
            @visita = Visita.find_by(:actividad_id => @actividad.id)
            @vist = @visita.id        
            redirect_to actividad_visita_path(@actividad, @vist)                                    
    end
    
    def destroy
        @actividad = Actividad.find(params[:actividad_id])
        @viajgrup = @actividad.viaje_grupos.find(params[:id])
        @viajgrup.destroy
        @visita = Visita.find_by(:actividad_id => @actividad.id)
        redirect_to actividad_visita_path(@actividad, @visita.id)
    end
    
    private
    
    def viajgrup_params
        params.require(:viaje_grupo).permit(:curso_materia_id)
    end
    
    def sort_column
        params[:sort] || "id"
    end
    
    def sort_direction
        params[:direction] || "desc"
    end
end
