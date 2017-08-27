class PuestosController < ApplicationController
    helper_method :sort_column, :sort_direction
    before_action :authenticate_usuario!
    load_and_authorize_resource :except => :create
    
    def create
        @usuario = current_usuario
        @docente = Docente.find(params[:docente_id])
        @puesto = @docente.puestos.create(puesto_params)
        redirect_to docente_path(@docente)
    end
    
    def edit
       @docente = Docente.find(params[:docente_id])
       @puesto = Puesto.find(params[:id]);
    end
    
    def update
        @docente = Docente.find(params[:docente_id])
        @puesto = @docente.puestos.find(params[:id])
        if @puesto.update(puesto_params)
            redirect_to docente_path(@docente)
        else
            render :edit
        end
    end
    
    def destroy
        @docente = Docente.find(params[:docente_id])
        @puesto = @docente.puestos.find(params[:id])
        @puesto.destroy
        redirect_to docente_path(@docente)
    end
    
    private
    
    def puesto_params
        params.require(:puesto).permit(:fechaInicio, :fechaTermino, :pdfNombramiento, :cat_tipo_puesto_id, :estado, :usuario_id)
    end
    
    def sort_column
        params[:sort] || "id"
    end
    
    def sort_direction
        params[:direction] || "desc"
    end
end