class UbicacionEgresadosEmpresasController < ApplicationController
  before_action :set_ubicacion_egresados_empresa, only: [:show, :edit, :update, :destroy]

  # GET /ubicacion_egresados_empresas
  # GET /ubicacion_egresados_empresas.json
  def index
    @ubicacion_egresados_empresas = UbicacionEgresadosEmpresa.all
  end

  # GET /ubicacion_egresados_empresas/1
  # GET /ubicacion_egresados_empresas/1.json
  def show
  end

  # GET /ubicacion_egresados_empresas/new
  def new
    @ubicacion_egresados_empresa = UbicacionEgresadosEmpresa.new
  end

  # GET /ubicacion_egresados_empresas/1/edit
  def edit
  end

  # POST /ubicacion_egresados_empresas
  # POST /ubicacion_egresados_empresas.json
  def create
    @ubicacion_egresados_empresa = UbicacionEgresadosEmpresa.new(ubicacion_egresados_empresa_params)

    respond_to do |format|
      if @ubicacion_egresados_empresa.save
        format.html { redirect_to @ubicacion_egresados_empresa, notice: 'Ubicacion egresados empresa was successfully created.' }
        format.json { render :show, status: :created, location: @ubicacion_egresados_empresa }
      else
        format.html { render :new }
        format.json { render json: @ubicacion_egresados_empresa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ubicacion_egresados_empresas/1
  # PATCH/PUT /ubicacion_egresados_empresas/1.json
  def update
    respond_to do |format|
      if @ubicacion_egresados_empresa.update(ubicacion_egresados_empresa_params)
        format.html { redirect_to @ubicacion_egresados_empresa, notice: 'Ubicacion egresados empresa was successfully updated.' }
        format.json { render :show, status: :ok, location: @ubicacion_egresados_empresa }
      else
        format.html { render :edit }
        format.json { render json: @ubicacion_egresados_empresa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ubicacion_egresados_empresas/1
  # DELETE /ubicacion_egresados_empresas/1.json
  def destroy
    @ubicacion_egresados_empresa.destroy
    respond_to do |format|
      format.html { redirect_to ubicacion_egresados_empresas_url, notice: 'Ubicacion egresados empresa was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ubicacion_egresados_empresa
      @ubicacion_egresados_empresa = UbicacionEgresadosEmpresa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ubicacion_egresados_empresa_params
      params.require(:ubicacion_egresados_empresa).permit(:num_prof, :cant_mando_superior, :cant_mando_intermedio, :cant_mando_tecnico, :otro_esp, :otro_can, :completamente, :medianamente, :ligeramente, :ninguna_relacion, :requisitos, :carreras_demandan)
    end
end
