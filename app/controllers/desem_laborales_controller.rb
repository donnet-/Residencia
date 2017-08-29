class DesemLaboralesController < ApplicationController
  before_action :set_desem_laboral, only: [:show, :edit, :update, :destroy]

  # GET /desem_laborales
  # GET /desem_laborales.json
  def index
    @desem_laborales = DesemLaboral.all
  end

  # GET /desem_laborales/1
  # GET /desem_laborales/1.json
  def show
  end

  # GET /desem_laborales/new
  def new
    @desem_laboral = DesemLaboral.new
  end

  # GET /desem_laborales/1/edit
  def edit
  end

  # POST /desem_laborales
  # POST /desem_laborales.json
  def create
    @desem_laboral = DesemLaboral.new(desem_laboral_params)

    respond_to do |format|
      if @desem_laboral.save
        format.html { redirect_to new_expectativas_egresado_path, notice: 'Desem laboral was successfully created.' }
        format.json { render :show, status: :created, location: @desem_laboral }
      else
        format.html { render :new }
        format.json { render json: @desem_laboral.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /desem_laborales/1
  # PATCH/PUT /desem_laborales/1.json
  def update
    respond_to do |format|
      if @desem_laboral.update(desem_laboral_params)
        format.html { redirect_to @desem_laboral, notice: 'Desem laboral was successfully updated.' }
        format.json { render :show, status: :ok, location: @desem_laboral }
      else
        format.html { render :edit }
        format.json { render json: @desem_laboral.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /desem_laborales/1
  # DELETE /desem_laborales/1.json
  def destroy
    @desem_laboral.destroy
    respond_to do |format|
      format.html { redirect_to desem_laborales_url, notice: 'Desem laboral was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_desem_laboral
      @desem_laboral = DesemLaboral.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def desem_laboral_params
      params.require(:desem_laboral).permit(:eficincia, :calificacion_academica, :utilidad_residencia, :area_estudio, :titulacion, :experiencia_laboral, :competencia_laboral, :posicionamiento, :conocimiento_idioma, :recomendaciones, :personalidad_actitud, :otros)
    end
end
