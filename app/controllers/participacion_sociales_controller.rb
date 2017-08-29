class ParticipacionSocialesController < ApplicationController
  before_action :set_participacion_social, only: [:show, :edit, :update, :destroy]

  # GET /participacion_sociales
  # GET /participacion_sociales.json
  def index
    @participacion_sociales = ParticipacionSocial.all
  end

  # GET /participacion_sociales/1
  # GET /participacion_sociales/1.json
  def show
  end

  # GET /participacion_sociales/new
  def new
    @participacion_social = ParticipacionSocial.new
  end

  # GET /participacion_sociales/1/edit
  def edit
  end

  # POST /participacion_sociales
  # POST /participacion_sociales.json
  def create
    @participacion_social = ParticipacionSocial.new(participacion_social_params)

    respond_to do |format|
      if @participacion_social.save
        format.html { redirect_to new_comentario_egresado_path, notice: 'Participacion social was successfully created.' }
        format.json { render :show, status: :created, location: @participacion_social }
      else
        format.html { render :new }
        format.json { render json: @participacion_social.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /participacion_sociales/1
  # PATCH/PUT /participacion_sociales/1.json
  def update
    respond_to do |format|
      if @participacion_social.update(participacion_social_params)
        format.html { redirect_to @participacion_social, notice: 'Participacion social was successfully updated.' }
        format.json { render :show, status: :ok, location: @participacion_social }
      else
        format.html { render :edit }
        format.json { render json: @participacion_social.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /participacion_sociales/1
  # DELETE /participacion_sociales/1.json
  def destroy
    @participacion_social.destroy
    respond_to do |format|
      format.html { redirect_to participacion_sociales_url, notice: 'Participacion social was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_participacion_social
      @participacion_social = ParticipacionSocial.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def participacion_social_params
      params.require(:participacion_social).permit(:organizacion_social, :organismo_profesionistas, :asociacion_egresados, :describir)
    end
end
