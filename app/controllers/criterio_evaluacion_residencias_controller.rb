class CriterioEvaluacionResidenciasController < ApplicationController
  before_action :set_criterio_evaluacion_residencia, only: [:show, :edit, :update, :destroy]

  # GET /criterio_evaluacion_residencias
  # GET /criterio_evaluacion_residencias.json
  def index
    @criterio_evaluacion_residencias = CriterioEvaluacionResidencia.all
  end

  # GET /criterio_evaluacion_residencias/1
  # GET /criterio_evaluacion_residencias/1.json
  def show
  end

  # GET /criterio_evaluacion_residencias/new
  def new
    @criterio_evaluacion_residencia = CriterioEvaluacionResidencia.new
  end

  # GET /criterio_evaluacion_residencias/1/edit
  def edit
  end

  # POST /criterio_evaluacion_residencias
  # POST /criterio_evaluacion_residencias.json
  def create
    @criterio_evaluacion_residencia = CriterioEvaluacionResidencia.new(criterio_evaluacion_residencia_params)

    respond_to do |format|
      if @criterio_evaluacion_residencia.save
        format.html { redirect_to banco_proyectos_path, notice: 'Criterio evaluacion residencia was successfully created.' }
        format.json { render :show, status: :created, location: @criterio_evaluacion_residencia }
      else
        format.html { render :new }
        format.json { render json: @criterio_evaluacion_residencia.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /criterio_evaluacion_residencias/1
  # PATCH/PUT /criterio_evaluacion_residencias/1.json
  def update
    respond_to do |format|
      if @criterio_evaluacion_residencia.update(criterio_evaluacion_residencia_params)
        format.html { redirect_to @criterio_evaluacion_residencia, notice: 'Criterio evaluacion residencia was successfully updated.' }
        format.json { render :show, status: :ok, location: @criterio_evaluacion_residencia }
      else
        format.html { render :edit }
        format.json { render json: @criterio_evaluacion_residencia.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /criterio_evaluacion_residencias/1
  # DELETE /criterio_evaluacion_residencias/1.json
  def destroy
    @criterio_evaluacion_residencia.destroy
    respond_to do |format|
      format.html { redirect_to criterio_evaluacion_residencias_url, notice: 'Criterio evaluacion residencia was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_criterio_evaluacion_residencia
      @criterio_evaluacion_residencia = CriterioEvaluacionResidencia.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def criterio_evaluacion_residencia_params
      params.require(:criterio_evaluacion_residencia).permit(:id_evaluacion, :id_cat_criterio_eva, :califiacion_criterio)
    end
end
