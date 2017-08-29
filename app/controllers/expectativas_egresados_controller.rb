class ExpectativasEgresadosController < ApplicationController
  before_action :set_expectativas_egresado, only: [:show, :edit, :update, :destroy]

  # GET /expectativas_egresados
  # GET /expectativas_egresados.json
  def index
    @expectativas_egresados = ExpectativasEgresado.all
  end

  # GET /expectativas_egresados/1
  # GET /expectativas_egresados/1.json
  def show
  end

  # GET /expectativas_egresados/new
  def new
    @expectativas_egresado = ExpectativasEgresado.new
  end

  # GET /expectativas_egresados/1/edit
  def edit
  end

  # POST /expectativas_egresados
  # POST /expectativas_egresados.json
  def create
    @expectativas_egresado = ExpectativasEgresado.new(expectativas_egresado_params)

    respond_to do |format|
      if @expectativas_egresado.save
        format.html { redirect_to new_participacion_social_path, notice: 'Expectativas egresado was successfully created.' }
        format.json { render :show, status: :created, location: @expectativas_egresado }
      else
        format.html { render :new }
        format.json { render json: @expectativas_egresado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expectativas_egresados/1
  # PATCH/PUT /expectativas_egresados/1.json
  def update
    respond_to do |format|
      if @expectativas_egresado.update(expectativas_egresado_params)
        format.html { redirect_to @expectativas_egresado, notice: 'Expectativas egresado was successfully updated.' }
        format.json { render :show, status: :ok, location: @expectativas_egresado }
      else
        format.html { render :edit }
        format.json { render json: @expectativas_egresado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expectativas_egresados/1
  # DELETE /expectativas_egresados/1.json
  def destroy
    @expectativas_egresado.destroy
    respond_to do |format|
      format.html { redirect_to expectativas_egresados_url, notice: 'Expectativas egresado was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expectativas_egresado
      @expectativas_egresado = ExpectativasEgresado.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def expectativas_egresado_params
      params.require(:expectativas_egresado).permit(:cursos_actualizacion, :tomar_posgrado, :describir)
    end
end
