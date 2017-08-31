class EvaluacionServiciosController < ApplicationController
  before_action :set_evaluacion_servicio, only: [:show, :edit, :update, :destroy]
  helper_method :execute_statement
   helper_method :sort_column, :sort_direction
    before_action :authenticate_usuario!
    load_and_authorize_resource :except => :create
  # GET /evaluacion_servicios
  # GET /evaluacion_servicios.json
  def index
    @evaluacion_servicios = EvaluacionServicio.all
  end

  # GET /evaluacion_servicios/1
  # GET /evaluacion_servicios/1.json
  def show
    @evaluacion_servicios = EvaluacionServicio.find(params[:id])
  end

  # GET /evaluacion_servicios/new
  def new
    @evaluacion_servicio = EvaluacionServicio.new
    @evaluacion_servicio.criterio_evaluacion_servicios.build
  end

  # GET /evaluacion_servicios/1/edit
  def edit
  end

  # POST /evaluacion_servicios
  # POST /evaluacion_servicios.json
  def create
    @evaluacion_servicio = EvaluacionServicio.new(evaluacion_servicio_params)
    
    respond_to do |format|
      if @evaluacion_servicio.save
        format.html { redirect_to servicio_sociales_path, notice: 'Evaluacion servicio was successfully created.' }
        format.json { render :show, status: :created, location: @evaluacion_servicio }
      else
        format.html { render :new }
        format.json { render json: @evaluacion_servicio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /evaluacion_servicios/1
  # PATCH/PUT /evaluacion_servicios/1.json
  def update
    respond_to do |format|
      if @evaluacion_servicio.update(evaluacion_servicio_params)
        format.html { redirect_to @evaluacion_servicio, notice: 'Evaluacion servicio was successfully updated.' }
        format.json { render :show, status: :ok, location: @evaluacion_servicio }
      else
        format.html { render :edit }
        format.json { render json: @evaluacion_servicio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /evaluacion_servicios/1
  # DELETE /evaluacion_servicios/1.json
  def destroy
    @evaluacion_servicio.destroy
    respond_to do |format|
      format.html { redirect_to evaluacion_servicios_url, notice: 'Evaluacion servicio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def execute_statement(sql)
    result = ActiveRecord::Base.connection.execute(sql)
    if result present?
      return result
    else 
      return result    
  end
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evaluacion_servicio
      @evaluacion_servicio = EvaluacionServicio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def evaluacion_servicio_params
      params.require(:evaluacion_servicio).permit(:id_servicio_social, :num_reporte, :pdf_eval_servicio, 
                                    :fecha_registro_servicio, criterio_evaluacion_servicios_attributes:
                                    [:id,:id_cat_criterio_eva, :califiacion_criterio, :_destroy ])      
    end
end
