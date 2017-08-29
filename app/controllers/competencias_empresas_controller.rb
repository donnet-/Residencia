class CompetenciasEmpresasController < ApplicationController
  before_action :set_competencias_empresa, only: [:show, :edit, :update, :destroy]

  # GET /competencias_empresas
  # GET /competencias_empresas.json
  def index
    @competencias_empresas = CompetenciasEmpresa.all
  end

  # GET /competencias_empresas/1
  # GET /competencias_empresas/1.json
  def show
  end

  # GET /competencias_empresas/new
  def new
    @competencias_empresa = CompetenciasEmpresa.new
  end

  # GET /competencias_empresas/1/edit
  def edit
  end

  # POST /competencias_empresas
  # POST /competencias_empresas.json
  def create
    @competencias_empresa = CompetenciasEmpresa.new(competencias_empresa_params)

    respond_to do |format|
      if @competencias_empresa.save
        format.html { redirect_to @competencias_empresa, notice: 'Competencias empresa was successfully created.' }
        format.json { render :show, status: :created, location: @competencias_empresa }
      else
        format.html { render :new }
        format.json { render json: @competencias_empresa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /competencias_empresas/1
  # PATCH/PUT /competencias_empresas/1.json
  def update
    respond_to do |format|
      if @competencias_empresa.update(competencias_empresa_params)
        format.html { redirect_to @competencias_empresa, notice: 'Competencias empresa was successfully updated.' }
        format.json { render :show, status: :ok, location: @competencias_empresa }
      else
        format.html { render :edit }
        format.json { render json: @competencias_empresa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /competencias_empresas/1
  # DELETE /competencias_empresas/1.json
  def destroy
    @competencias_empresa.destroy
    respond_to do |format|
      format.html { redirect_to competencias_empresas_url, notice: 'Competencias empresa was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_competencias_empresa
      @competencias_empresa = CompetenciasEmpresa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def competencias_empresa_params
      params.require(:competencias_empresa).permit(:habilidad, :orotografia, :mejora_procesos, :trabajo_equipo, :habilidad_tiempo, :seguridad_personal, :facilidad_palabra, :gestion_proyecto, :puntualidad, :cumplimiento, :integracion, :creatividad, :liderazgo, :adaptacion_cambios, :exelente, :muy_bueno, :bueno, :regular, :malo, :sugerencia_mejora, :comentario)
    end
end
