class ServicioSocialesController < ApplicationController
    helper_method :sort_column, :sort_direction
    before_action :authenticate_usuario!
    load_and_authorize_resource :except => :create
    
    def index
		@servicios = ServicioSocial.all.order(sort_column + ' ' + sort_direction).paginate( per_page: 10, page: params[:page])
    end

    def new
        @servicio = ServicioSocial.new
    end

    def show
		if current_usuario.rol == 'admin'
			@servicio = ServicioSocial.find(params[:id])
			respond_to do |format|
				format.html
				format.pdf {render template: 'servicio_sociales/terminacionSS', pdf:'one', page_size: 'Letter', margin: {left: 25, right: 25}, font_name: 'Arial'}
			end
		else
			@s = ServicioSocial.find(params[:id]).estudiante_id
			@e = Estudiante.find_by(email: current_usuario.email).id
			
			if @s == @e
				@servicio = ServicioSocial.find(params[:id])
			else
				redirect_to servicio_sociales_path
				flash[:alert] = "No tienes acceso a ese servicio social."
			end
		end
    end
    
    def aceptacion
        @servicio = ServicioSocial.find(params[:id])
        respond_to do |format|
            format.html
            format.pdf { render template: 'servicio_sociales/aceptacion', pdf:'one', page_size: 'Letter', margin: {left: 25, right: 25}, font_name: 'Arial', footer: { margin: {bottom:20 }, html: { template: 'layouts/footerComision.html' } } }
        end
    end

    def create
		@usuario = current_usuario
        @servicio = ServicioSocial.create(servicio_s_params)
        if @servicio.save
			redirect_to servicio_sociales_path
        else
			render :new
        end
        
    end
    
    def edit        
        #@servicio= ServicioSocial.find(params[:id])
		@s = ServicioSocial.find(params[:id]).estudiante_id
		@e = Estudiante.find_by(email: current_usuario.email).id
			
		if @s == @e
			@servicio = ServicioSocial.find(params[:id])
		else
			redirect_to servicio_sociales_path
			flash[:alert] = "No tienes acceso a ese servicio social."
		end
    end

    def update
        @servicio= ServicioSocial.find(params[:id])
        if @servicio.update(servicio_s_params)
            redirect_to servicio_sociales_path            
        else
            render :edit
        end          
    end 
    
    private
    
    def servicio_s_params
        params.require(:servicio_social).permit(:estudiante_id, :calificacion, :fechaInicio, :fechaTermino, :horas, :nombreE, :pdfLiberacion, :observaciones, :estado, :pdfAceptacion, :pdfPresentacion)
    end
    
    def sort_column
        params[:sort] || "fechaInicio"
    end
    
    def sort_direction
        params[:direction] || "desc"
    end
end