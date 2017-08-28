class CriterioEvalucionServiciosController < ApplicationController
  before_action :set_criterio_evalucion_servicio, only: [:show, :edit, :update, :destroy]

  # GET /criterio_evalucion_servicios
  # GET /criterio_evalucion_servicios.json
  def index
    @criterio_evalucion_servicios = CriterioEvalucionServicio.all
  end

  # GET /criterio_evalucion_servicios/1
  # GET /criterio_evalucion_servicios/1.json
  def show
  end

  # GET /criterio_evalucion_servicios/new
  def new
    @criterio_evalucion_servicio = CriterioEvalucionServicio.new
    #@curso_materia = PeriodoCursMateria.new
    #1.times { @curso_materia.curso_materias.build }
    

  end

  # GET /criterio_evalucion_servicios/1/edit
  def edit
  end

  # POST /criterio_evalucion_servicios
  # POST /criterio_evalucion_servicios.json
  def create
    @criterio_evalucion_servicio = CriterioEvalucionServicio.new(criterio_evalucion_servicio_params)

    respond_to do |format|
      if @criterio_evalucion_servicio.save

        format.html { redirect_to @criterio_evalucion_servicio, notice: 'Criterio evalucion servicio was successfully created.' }
        format.json { render :show, status: :created, location: @criterio_evalucion_servicio }
      else
        format.html { render :new }
        format.json { render json: @criterio_evalucion_servicio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /criterio_evalucion_servicios/1
  # PATCH/PUT /criterio_evalucion_servicios/1.json
  def update
    respond_to do |format|
      if @criterio_evalucion_servicio.update(criterio_evalucion_servicio_params)
        format.html { redirect_to @criterio_evalucion_servicio, notice: 'Criterio evalucion servicio was successfully updated.' }
        format.json { render :show, status: :ok, location: @criterio_evalucion_servicio }
      else
        format.html { render :edit }
        format.json { render json: @criterio_evalucion_servicio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /criterio_evalucion_servicios/1
  # DELETE /criterio_evalucion_servicios/1.json
  def destroy
    @criterio_evalucion_servicio.destroy
    respond_to do |format|
      format.html { redirect_to criterio_evalucion_servicios_url, notice: 'Criterio evalucion servicio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_criterio_evalucion_servicio
      @criterio_evalucion_servicio = CriterioEvalucionServicio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def criterio_evalucion_servicio_params
      params.require(:criterio_evalucion_servicio).permit(:id_evalucion, :id_cat_criterio_eval, :calificacion_criterio)
    end
end
