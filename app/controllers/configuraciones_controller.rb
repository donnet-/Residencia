class ConfiguracionesController < ApplicationController
    	def index
		@configuraciones = Configuracion.all
	end
	def new
		@configuracion = Configuracion.new
	end
	def create
		@configuracion = Configuracion.create(params_config)
		if @configuracion.save
			redirect_to configuraciones_path
		else
			redirect_to @configuracion
		end
	end
	def show
		@configuracion = Configuracion.find(params[:id])
	end
	def edit
		@configuracion = Configuracion.find(params[:id])
	end
	def update
		@configuracion = Configuracion.find(params[:id])
		if @configuracion.update(params_config)
			redirect_to configuraciones_path
		else
			render :edit
		end
	end

	private
	def params_config
		params.require(:configuracion).permit(:tipo, :contenido, :imagen)
	end
end