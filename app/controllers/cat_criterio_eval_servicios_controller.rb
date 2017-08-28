class CatCriterioEvalServiciosController < ApplicationController
   helper_method :sort_column, :sort_direction
    before_action :authenticate_usuario!
    load_and_authorize_resource :except => :create
  before_action :set_cat_criterio_eval_servicio, only: [:show, :edit, :update, :destroy]

  # GET /cat_criterio_eval_servicios
  # GET /cat_criterio_eval_servicios.json
  def index
    @cat_criterio_eval_servicios = CatCriterioEvalServicio.all
     #   @planCursos = CatPlanCurso.order(sort_column + ' ' + sort_direction).paginate( per_page: 10, page: params[:page])
  end

  # GET /cat_criterio_eval_servicios/1
  # GET /cat_criterio_eval_servicios/1.json
  def show
  end

  # GET /cat_criterio_eval_servicios/new
  def new
    @cat_criterio_eval_servicio = CatCriterioEvalServicio.new
  end

  # GET /cat_criterio_eval_servicios/1/edit
  def edit
  end

  # POST /cat_criterio_eval_servicios
  # POST /cat_criterio_eval_servicios.json
  def create
    @cat_criterio_eval_servicio = CatCriterioEvalServicio.new(cat_criterio_eval_servicio_params)

    respond_to do |format|
      if @cat_criterio_eval_servicio.save
        format.html { redirect_to cat_criterio_eval_servicios_path, notice: 'Cat criterio eval servicio was successfully created.' }
        format.json { render :show, status: :created, location: @cat_criterio_eval_servicio }
      else
        format.html { render :new }
        format.json { render json: @cat_criterio_eval_servicio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cat_criterio_eval_servicios/1
  # PATCH/PUT /cat_criterio_eval_servicios/1.json
  def update
    respond_to do |format|
      if @cat_criterio_eval_servicio.update(cat_criterio_eval_servicio_params)
        format.html { redirect_to cat_criterio_eval_servicios_path, notice: 'Cat criterio eval servicio was successfully updated.' }
        format.json { render :show, status: :ok, location: @cat_criterio_eval_servicio }
      else
        format.html { render :edit }
        format.json { render json: @cat_criterio_eval_servicio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cat_criterio_eval_servicios/1
  # DELETE /cat_criterio_eval_servicios/1.json
  def destroy
    @cat_criterio_eval_servicio.destroy
    respond_to do |format|
      format.html { redirect_to cat_criterio_eval_servicios_url, notice: 'Cat criterio eval servicio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cat_criterio_eval_servicio
      @cat_criterio_eval_servicio = CatCriterioEvalServicio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cat_criterio_eval_servicio_params
      params.require(:cat_criterio_eval_servicio).permit(:nombre_criterio,:cal_A)
    end
end
