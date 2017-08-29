class SolicitudObservacionesController < ApplicationController
  before_action :set_solicitud_observacion, only: [:show, :edit, :update, :destroy]

  # GET /solicitud_observaciones
  # GET /solicitud_observaciones.json
  
  def index
    busqueda = "%#{params[:search]}%"
    @solicitud_observaciones = SolicitudObservacion.all.order(sort_column + ' ' + sort_direction).paginate(per_page: 10, page: params[:page])
    
    if params[:search].present?
      @solicitud_observaciones = SolicitudObservacion.where('observacion LIKE ?', busqueda).paginate(per_page: 10, page: params[:page])
    end
  end

  # GET /solicitud_observaciones/1
  # GET /solicitud_observaciones/1.json
  def show
  end

  # GET /solicitud_observaciones/new
  def new
    @solicitud_observacion = SolicitudObservacion.new
  end

  # GET /solicitud_observaciones/1/edit
  def edit
  end

  # POST /solicitud_observaciones
  # POST /solicitud_observaciones.json
  def create
    @solicitud_observacion = SolicitudObservacion.new(solicitud_observacion_params)

    respond_to do |format|
      if @solicitud_observacion.save
        format.html { redirect_to @solicitud_observacion, notice: 'Solicitud observacion was successfully created.' }
        format.json { render :show, status: :created, location: @solicitud_observacion }
      else
        format.html { render :new }
        format.json { render json: @solicitud_observacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /solicitud_observaciones/1
  # PATCH/PUT /solicitud_observaciones/1.json
  def update
    respond_to do |format|
      if @solicitud_observacion.update(solicitud_observacion_params)
        format.html { redirect_to @solicitud_observacion, notice: 'Solicitud observacion was successfully updated.' }
        format.json { render :show, status: :ok, location: @solicitud_observacion }
      else
        format.html { render :edit }
        format.json { render json: @solicitud_observacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /solicitud_observaciones/1
  # DELETE /solicitud_observaciones/1.json
  def destroy
    @solicitud_observacion.destroy
    respond_to do |format|
      format.html { redirect_to solicitud_observaciones_url, notice: 'Solicitud observacion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_solicitud_observacion
      @solicitud_observacion = SolicitudObservacion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def solicitud_observacion_params
      params.require(:solicitud_observacion).permit(:rfc, :observacion, :solicitud_id)
    end
    
  def sort_column
    params[:sort] || "id"
  end
    
  def sort_direction
    params[:direction] || "desc"
  end
end
