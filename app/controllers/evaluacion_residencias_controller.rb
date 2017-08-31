class EvaluacionResidenciasController < ApplicationController
  before_action :set_evaluacion_residencia, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_usuario!
  # GET /evaluacion_residencias
  # GET /evaluacion_residencias.json
  def index
    @evaluacion_residencias = EvaluacionResidencia.all
  end

  # GET /evaluacion_residencias/1
  # GET /evaluacion_residencias/1.json
  def show
  end

  # GET /evaluacion_residencias/new
  def new
    @evaluacion_residencia = EvaluacionResidencia.new
    @evaluacion_residencia.criterio_evaluacion_residencias.build
  end

  # GET /evaluacion_residencias/1/edit
  def edit
  end

  # POST /evaluacion_residencias
  # POST /evaluacion_residencias.json
  def create
    @evaluacion_residencia = EvaluacionResidencia.new(evaluacion_residencia_params)

    respond_to do |format|
      if @evaluacion_residencia.save
        format.html { redirect_to  banco_proyectos_path, notice: 'Evaluacion residencia was successfully created.' }
        format.json { render :show, status: :created, location: @evaluacion_residencia }
      else
        format.html { render :new }
        format.json { render json: @evaluacion_residencia.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /evaluacion_residencias/1
  # PATCH/PUT /evaluacion_residencias/1.json
  def update
    respond_to do |format|
      if @evaluacion_residencia.update(evaluacion_residencia_params)
        format.html { redirect_to banco_proyectos_path, notice: 'Evaluacion residencia was successfully updated.' }
        format.json { render :show, status: :ok, location: @evaluacion_residencia }
      else
        format.html { render :edit }
        format.json { render json: @evaluacion_residencia.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /evaluacion_residencias/1
  # DELETE /evaluacion_residencias/1.json
  def destroy
    @evaluacion_residencia.destroy
    respond_to do |format|
      format.html { redirect_to evaluacion_residencias_url, notice: 'Evaluacion residencia was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evaluacion_residencia
      @evaluacion_residencia = EvaluacionResidencia.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def evaluacion_residencia_params
      params.require(:evaluacion_residencia).permit(:id_residencia, :num_reporte, 
                    :fecha_registro,:pdf, criterio_evaluacion_residencias_attributes:
                    [:id,:id_cat_criterio_eva, :calificacion_criterio, :_destroy ]  )
    end
end
