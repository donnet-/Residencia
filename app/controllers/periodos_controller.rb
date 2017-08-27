class PeriodosController < ApplicationController
    def index
		@periodos = Periodo.all
	end

	def new
		@periodo = Periodo.new
	end

	def create		
		@periodo= Periodo.create(periodo_params)
		if @periodo.save
			redirect_to periodo_path(@periodo)
		else
			render :new
		end
	end

	def show
		@periodo=Periodo.find(params[:id])
	end

	def edit
		@periodo=Periodo.find(params[:id])
	end

	def update
		@periodo=Periodo.find(params[:id])
		if @periodo.update(periodo_params)
			redirect_to periodo_path(@periodo)
		else
			render :edit
		end		
	end

	def destroy
		@periodo=Periodo.find[params[:id]]
		@periodo.destroy	
		redirect_to periodos_path	
	end

	private
	def periodo_params
		params.require(:periodo).permit(:periodo, :fechaInicio, :fechaTermino)		
	end
end