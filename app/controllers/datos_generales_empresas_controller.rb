class DatosGeneralesEmpresasController < ApplicationController
  before_action :set_datos_generales_empresa, only: [:show, :edit, :update, :destroy]

  # GET /datos_generales_empresas
  # GET /datos_generales_empresas.json
  def index
    @datos_generales_empresas = DatosGeneralesEmpresa.all
  end

  # GET /datos_generales_empresas/1
  # GET /datos_generales_empresas/1.json
  def show
  end

  # GET /datos_generales_empresas/new
  def new
    @datos_generales_empresa = DatosGeneralesEmpresa.new
  end

  # GET /datos_generales_empresas/1/edit
  def edit
  end

  # POST /datos_generales_empresas
  # POST /datos_generales_empresas.json
  def create
    @datos_generales_empresa = DatosGeneralesEmpresa.new(datos_generales_empresa_params)

    respond_to do |format|
      if @datos_generales_empresa.save
        format.html { redirect_to new_ubicacion_egresados_empresa_path, notice: 'Datos generales empresa de la empresa, guardados.' }
        format.json { render :show, status: :created, location: @datos_generales_empresa }
      else
        format.html { render :new }
        format.json { render json: @datos_generales_empresa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /datos_generales_empresas/1
  # PATCH/PUT /datos_generales_empresas/1.json
  def update
    respond_to do |format|
      if @datos_generales_empresa.update(datos_generales_empresa_params)
        format.html { redirect_to @datos_generales_empresa, notice: 'Datos generales empresa was successfully updated.' }
        format.json { render :show, status: :ok, location: @datos_generales_empresa }
      else
        format.html { render :edit }
        format.json { render json: @datos_generales_empresa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /datos_generales_empresas/1
  # DELETE /datos_generales_empresas/1.json
  def destroy
    @datos_generales_empresa.destroy
    respond_to do |format|
      format.html { redirect_to datos_generales_empresas_url, notice: 'Datos generales empresa was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_datos_generales_empresa
      @datos_generales_empresa = DatosGeneralesEmpresa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def datos_generales_empresa_params
      params.require(:datos_generales_empresa).permit(:nombre_empresa, :calle, :numero, :colonia, :cp, :ciudad, :estado, :municipio, :telefono, :correo, :tipo_empresa, :tam_empresa, :actividad_economica)
    end
end
