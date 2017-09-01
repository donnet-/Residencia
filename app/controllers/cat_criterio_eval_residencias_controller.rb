class CatCriterioEvalResidenciasController < ApplicationController
  before_action :set_cat_criterio_eval_residencia, only: [:show, :edit, :update, :destroy]

  # GET /cat_criterio_eval_residencias
  # GET /cat_criterio_eval_residencias.json
  def index
    @cat_criterio_eval_residencias = CatCriterioEvalResidencia.all
  end

  # GET /cat_criterio_eval_residencias/1
  # GET /cat_criterio_eval_residencias/1.json
  def show
  end

  # GET /cat_criterio_eval_residencias/new
  def new
    @cat_criterio_eval_residencia = CatCriterioEvalResidencia.new
  end

  # GET /cat_criterio_eval_residencias/1/edit
  def edit
  end

  # POST /cat_criterio_eval_residencias
  # POST /cat_criterio_eval_residencias.json
  def create
    @cat_criterio_eval_residencia = CatCriterioEvalResidencia.new(cat_criterio_eval_residencia_params)

    respond_to do |format|
      if @cat_criterio_eval_residencia.save
        format.html { redirect_to cat_criterio_eval_residencias_path, notice: 'Cat criterio eval residencia was successfully created.' }
        format.json { render :show, status: :created, location: @cat_criterio_eval_residencia }
      else
        format.html { render :new }
        format.json { render json: @cat_criterio_eval_residencia.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cat_criterio_eval_residencias/1
  # PATCH/PUT /cat_criterio_eval_residencias/1.json
  def update
    respond_to do |format|
      if @cat_criterio_eval_residencia.update(cat_criterio_eval_residencia_params)
        format.html { redirect_to cat_criterio_eval_residencias_path, notice: 'Cat criterio eval residencia was successfully updated.' }
        format.json { render :show, status: :ok, location: @cat_criterio_eval_residencia }
      else
        format.html { render :edit }
        format.json { render json: @cat_criterio_eval_residencia.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cat_criterio_eval_residencias/1
  # DELETE /cat_criterio_eval_residencias/1.json
  def destroy
    @cat_criterio_eval_residencia.destroy
    respond_to do |format|
      format.html { redirect_to cat_criterio_eval_residencias_url, notice: 'Cat criterio eval residencia was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cat_criterio_eval_residencia
      @cat_criterio_eval_residencia = CatCriterioEvalResidencia.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cat_criterio_eval_residencia_params
      params.require(:cat_criterio_eval_residencia).permit(:criterio_eval, :valor, :status)
    end
end
