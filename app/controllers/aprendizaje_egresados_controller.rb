class AprendizajeEgresadosController < ApplicationController
  before_action :set_aprendizaje_egresado, only: [:show, :edit, :update, :destroy]

  # GET /aprendizaje_egresados
  # GET /aprendizaje_egresados.json
  def index
    @aprendizaje_egresados = AprendizajeEgresado.all
  end

  # GET /aprendizaje_egresados/1
  # GET /aprendizaje_egresados/1.json
  def show
  end

  # GET /aprendizaje_egresados/new
  def new
    @aprendizaje_egresado = AprendizajeEgresado.new
  end

  # GET /aprendizaje_egresados/1/edit
  def edit
  end

  # POST /aprendizaje_egresados
  # POST /aprendizaje_egresados.json
  def create
    @aprendizaje_egresado = AprendizajeEgresado.new(aprendizaje_egresado_params)

    respond_to do |format|
      if @aprendizaje_egresado.save
        format.html { redirect_to new_ubicacion_laboral_path, notice: 'Aprendizaje egresado was successfully created.' }
        format.json { render :show, status: :created, location: @aprendizaje_egresado }
      else
        format.html { render :new }
        format.json { render json: @aprendizaje_egresado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aprendizaje_egresados/1
  # PATCH/PUT /aprendizaje_egresados/1.json
  def update
    respond_to do |format|
      if @aprendizaje_egresado.update(aprendizaje_egresado_params)
        format.html { redirect_to @aprendizaje_egresado, notice: 'Aprendizaje egresado was successfully updated.' }
        format.json { render :show, status: :ok, location: @aprendizaje_egresado }
      else
        format.html { render :edit }
        format.json { render json: @aprendizaje_egresado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aprendizaje_egresados/1
  # DELETE /aprendizaje_egresados/1.json
  def destroy
    @aprendizaje_egresado.destroy
    respond_to do |format|
      format.html { redirect_to aprendizaje_egresados_url, notice: 'Aprendizaje egresado was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aprendizaje_egresado
      @aprendizaje_egresado = AprendizajeEgresado.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aprendizaje_egresado_params
      params.require(:aprendizaje_egresado).permit(:calidad_docente, :plan_estudio, :proyecto_investigacion, :condiciones_estudio, :experiencia)
    end
end
