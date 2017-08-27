class ActividadDocentesController < ApplicationController
    helper_method :sort_column, :sort_direction
    
    def show
		@actDoc = ActividadDocente.find(params[:id])
		@actividad = Actividad.find(params[:actividad_id])
	end
    
    private
    
    def sort_column
        params[:sort] || "id"
    end
    
    def sort_direction
        params[:direction] || "desc"
    end
end