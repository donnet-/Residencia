class ActIndividualDocentesController < ApplicationController
    
    helper_method :sort_column, :sort_direction
    before_action :authenticate_usuario!
    load_and_authorize_resource :except => :create
    
    def create
        @usuario = current_usuario
        @actdoc = ActividadDocente.find(params[:actividad_docente_id])
        @actividad = Actividad.find(@actdoc.actividad_id)
        @individual = @actdoc.act_individual_docentes.create(actdoc_params)
        
        redirect_to actividad_actividad_docente_path(@actividad, @actdoc)
         
     end
     
     def edit
         @actdoc = ActividadDocente.find(params[:actividad_docente_id])
         @individual = ActIndividual.find(params[:id])
     end
    def update
         @actdoc = ActividadDocente.find(params[:actividad_docente_id])
         @individual = @actdoc.act_individual_docentes.find(params[:id])
         
         if @actdoc.update(actdoc_params)
             redirect_to actividad_actividad_docente_act_individual_docente_path(@actdoc)
         else
             render :edit
         end
     end
     
     private
     
     def actdoc_params
         params.require(:act_individual_docente).permit(:cat_evidencia_id, :pdfEvidencia, :actividad_docente_id)
     end
    
    def sort_column
        params[:sort] || "id"
    end
    
    def sort_direction
        params[:direction] || "desc"
    end
end