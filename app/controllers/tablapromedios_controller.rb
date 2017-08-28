class TablapromediosController < ApplicationController
  before_action :set_tablapromedio, only: [:show, :edit, :update, :destroy]

  # GET /tablapromedios
  # GET /tablapromedios.json
  def index
    @tablapromedio = Tablapromedio.all
  end

  # GET /tablapromedios/1
  # GET /tablapromedios/1.json
  def show
  end

  # GET /tablapromedios/new
  def new
    @tablapromedio = Tablapromedio.new
  end

  # GET /tablapromedios/1/edit
  def edit
  end

  # POST /tablapromedios
  # POST /tablapromedios.json
  def create
    @tablapromedio = Tablapromedio.new(tablapromedio_params)

    respond_to do |format|
      if @tablapromedio.save
        format.html { redirect_to @tablapromedio, notice: 'Tablapromedio was successfully created.' }
        format.json { render :show, status: :created, location: @tablapromedio }
      else
        format.html { render :new }
        format.json { render json: @tablapromedio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tablapromedios/1
  # PATCH/PUT /tablapromedios/1.json
  def update
    respond_to do |format|
      if @tablapromedio.update(tablapromedio_params)
        format.html { redirect_to @tablapromedio, notice: 'Tablapromedio was successfully updated.' }
        format.json { render :show, status: :ok, location: @tablapromedio }
      else
        format.html { render :edit }
        format.json { render json: @tablapromedio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tablapromedios/1
  # DELETE /tablapromedios/1.json
  def destroy
    @tablapromedio.destroy
    respond_to do |format|
      format.html { redirect_to tablapromedios_url, notice: 'Tablapromedio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tablapromedio
      @tablapromedio = Tablapromedio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tablapromedio_params
      params.require(:tablapromedio).permit(:nivel_desem, :valor_min, :valor_max)
    end
end
