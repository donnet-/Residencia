class ConvenioHonorariosController < ApplicationController
    helper_method :sort_column, :sort_direction
    before_action :authenticate_usuario!
    load_and_authorize_resource :except => :create
    
    def create
        @usuario = current_usuario
        @docente = Docente.find(params[:docente_id])
        @convenio = @docente.convenio_honorarios.create(convenio_params)
        redirect_to usuario_docente_path(@docente.usuario_id, @docente)
    end
    
    def edit
       @docente = Docente.find(params[:docente_id]);
       @convenio = ConvenioHonorario.find(params[:id]);
    end
    
    def update
        @docente = Docente.find(params[:docente_id]);
        @convenio = @docente.convenio_honorarios.find(params[:id]);
        if @convenio.update(convenio_params)
            redirect_to usuario_docente_path(@docente.usuario_id, @docente)
        else
            render :edit
        end
    end
    
    def destroy
        @docente = Docente.find(params[:docente_id])
        @convenio = @docente.convenio_honorarios.find(params[:id])
        @convenio.destroy
        redirect_to usuario_docente_path(@docente.usuario_id, @docente)
    end
    
    private
    
    def convenio_params
        params.require(:convenio_honorario).permit(:pdfConvenio, :fechaInicio, :fechaTermino, :estado, :usuario_id)
    end
    
    def sort_column
        params[:sort] || "id"
    end
    
    def sort_direction
        params[:direction] || "desc"
    end
end