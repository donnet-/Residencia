class CatTipoParticipacionesController < ApplicationController
    helper_method :sort_column, :sort_direction
    before_action :authenticate_usuario!
    load_and_authorize_resource :except => :create
    
    def index
        @tipoParticipaciones =  CatTipoParticipacion.order(sort_column + ' ' + sort_direction).paginate( per_page: 10, page: params[:page])
    end
    
    def show
        @tipoParticipacion = CatTipoParticipacion.find(params[:id])
    end
    
    def new
        @tipoParticipacion = CatTipoParticipacion.new
    end
    
    def create
        @usuario = current_usuario
        @tipoParticipacion = CatTipoParticipacion.create(tipoParticipacion_params)
        
        if @tipoParticipacion.save
            redirect_to cat_tipo_participaciones_path
        else
            render :new
        end
    end
    
    def edit
        @tipoParticipacion = CatTipoParticipacion.find(params[:id])
    end
    
    def update
        @tipoParticipacion = CatTipoParticipacion.find(params[:id])
        
        if @tipoParticipacion.update(tipoParticipacion_params)
            redirect_to cat_tipo_participaciones_path
        else
            render :edit
        end
    end
    
    def destroy
        @tipoParticipacion = CatTipoParticipacion.find(params[:id])
        @tipoParticipacion.destroy
        redirect_to cat_tipo_participaciones_path
    end
    
    private
    
    def tipoParticipacion_params
        params.require(:cat_tipo_participacion).permit(:participacion, :estado, :user_id)
    end
    
    def sort_column
        params[:sort] || "id"
    end
    
    def sort_direction
        params[:direction] || "desc"
    end
end