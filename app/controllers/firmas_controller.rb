class FirmasController < ApplicationController
	def index
		@firmas = Firma.all
	end

	def new
		@firma = Firma.new 
	end

	def create
		@firma = Firma.create(firma_params)
		if @firma.save 
			respond_to do |format|            
                format.html { redirect_to firmas_path }
                format.js
            end
		else
			respond_to do |format|            
                format.html { render :new }
                # format.js
            end
		end		
	end

	def show
		@firma = Firma.find(params[:id])
	end

	def edit 
		@firma = Firma.find(params[:id])	
	end
	def update
		@firma = Firma.find(params[:id])	
		@firma = Firma.update(firma_params)
		if @firma.save 
			redirect_to firmas_path			
		else
			render :new
		end
	end

	def destroy
	end

	private

	def firma_params
		params.require(:firma).permit(:cargo, :titular)
	end
end
