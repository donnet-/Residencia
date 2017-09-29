class SolicitudHorariosController < ApplicationController
  before_action :set_solicitud_horario, only: [:show, :edit, :update, :destroy]

  # GET /solicitud_horarios
  # GET /solicitud_horarios.json
  def index
    @solicitud_horarios = SolicitudHorario.all
  end

  # GET /solicitud_horarios/1
  # GET /solicitud_horarios/1.json
  def show
  end

  # GET /solicitud_horarios/new
  def new
    @solicitud_horario = SolicitudHorario.new
  end

  # GET /solicitud_horarios/1/edit
  def edit
  end

  # POST /solicitud_horarios
  # POST /solicitud_horarios.json
  def create
    @solicitud_horario = SolicitudHorario.new(solicitud_horario_params)

    respond_to do |format|
      if @solicitud_horario.save
        format.html { redirect_to @solicitud_horario, notice: 'Solicitud horario was successfully created.' }
        format.json { render :show, status: :created, location: @solicitud_horario }
      else
        format.html { render :new }
        format.json { render json: @solicitud_horario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /solicitud_horarios/1
  # PATCH/PUT /solicitud_horarios/1.json
  def update
    respond_to do |format|
      if @solicitud_horario.update(solicitud_horario_params)
        format.html { redirect_to @solicitud_horario, notice: 'Solicitud horario was successfully updated.' }
        format.json { render :show, status: :ok, location: @solicitud_horario }
      else
        format.html { render :edit }
        format.json { render json: @solicitud_horario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /solicitud_horarios/1
  # DELETE /solicitud_horarios/1.json
  def destroy
    @solicitud_horario.destroy
    respond_to do |format|
      format.html { redirect_to solicitud_horarios_url, notice: 'Solicitud horario was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_solicitud_horario
      @solicitud_horario = SolicitudHorario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def solicitud_horario_params
      params.require(:solicitud_horario).permit(:dia_inicio, :dia_termino, :hora_inicio, :hora_termino, :solicitud_id)
    end
end
