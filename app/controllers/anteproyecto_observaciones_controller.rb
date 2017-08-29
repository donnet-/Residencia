class AnteproyectoObservacionesController < ApplicationController
  before_action :set_anteproyecto_observacion, only: [:show, :edit, :update, :destroy]

  # GET /anteproyecto_observaciones
  # GET /anteproyecto_observaciones.json
  def index
    @anteproyecto_observaciones = AnteproyectoObservacion.all
  end

  # GET /anteproyecto_observaciones/1
  # GET /anteproyecto_observaciones/1.json
  def show
  end

  # GET /anteproyecto_observaciones/new
  def new
    @anteproyecto_observacion = AnteproyectoObservacion.new
  end

  # GET /anteproyecto_observaciones/1/edit
  def edit
  end

  # POST /anteproyecto_observaciones
  # POST /anteproyecto_observaciones.json
  def create
    @anteproyecto_observacion = AnteproyectoObservacion.new(anteproyecto_observacion_params)

    respond_to do |format|
      if @anteproyecto_observacion.save
        format.html { redirect_to @anteproyecto_observacion, notice: 'Anteproyecto observacion was successfully created.' }
        format.json { render :show, status: :created, location: @anteproyecto_observacion }
      else
        format.html { render :new }
        format.json { render json: @anteproyecto_observacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /anteproyecto_observaciones/1
  # PATCH/PUT /anteproyecto_observaciones/1.json
  def update
    respond_to do |format|
      if @anteproyecto_observacion.update(anteproyecto_observacion_params)
        format.html { redirect_to @anteproyecto_observacion, notice: 'Anteproyecto observacion was successfully updated.' }
        format.json { render :show, status: :ok, location: @anteproyecto_observacion }
      else
        format.html { render :edit }
        format.json { render json: @anteproyecto_observacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /anteproyecto_observaciones/1
  # DELETE /anteproyecto_observaciones/1.json
  def destroy
    @anteproyecto_observacion.destroy
    respond_to do |format|
      format.html { redirect_to anteproyecto_observaciones_url, notice: 'Anteproyecto observacion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_anteproyecto_observacion
      @anteproyecto_observacion = AnteproyectoObservacion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def anteproyecto_observacion_params
      params.require(:anteproyecto_observacion).permit(:identificador, :observacion, :solicitud_id)
    end
end
