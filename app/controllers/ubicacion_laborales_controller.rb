class UbicacionLaboralesController < ApplicationController
  before_action :set_ubicacion_laboral, only: [:show, :edit, :update, :destroy]

  # GET /ubicacion_laborales
  # GET /ubicacion_laborales.json
  def index
    @ubicacion_laborales = UbicacionLaboral.all
  end

  # GET /ubicacion_laborales/1
  # GET /ubicacion_laborales/1.json
  def show
  end

  # GET /ubicacion_laborales/new
  def new
    @ubicacion_laboral = UbicacionLaboral.new
  end

  # GET /ubicacion_laborales/1/edit
  def edit
  end

  # POST /ubicacion_laborales
  # POST /ubicacion_laborales.json
  def create
    @ubicacion_laboral = UbicacionLaboral.new(ubicacion_laboral_params)

    respond_to do |format|
      if @ubicacion_laboral.save
        format.html { redirect_to @ubicacion_laboral, notice: 'Ubicacion laboral was successfully created.' }
        format.json { render :show, status: :created, location: @ubicacion_laboral }
      else
        format.html { render :new }
        format.json { render json: @ubicacion_laboral.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ubicacion_laborales/1
  # PATCH/PUT /ubicacion_laborales/1.json
  def update
    respond_to do |format|
      if @ubicacion_laboral.update(ubicacion_laboral_params)
        format.html { redirect_to @ubicacion_laboral, notice: 'Ubicacion laboral was successfully updated.' }
        format.json { render :show, status: :ok, location: @ubicacion_laboral }
      else
        format.html { render :edit }
        format.json { render json: @ubicacion_laboral.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ubicacion_laborales/1
  # DELETE /ubicacion_laborales/1.json
  def destroy
    @ubicacion_laboral.destroy
    respond_to do |format|
      format.html { redirect_to ubicacion_laborales_url, notice: 'Ubicacion laboral was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ubicacion_laboral
      @ubicacion_laboral = UbicacionLaboral.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ubicacion_laboral_params
      params.require(:ubicacion_laboral).permit(:act_dedica, :estudia, :especialidad_institucion, :tiempo_empleo, :medio_empleo, :requisitos_contratacion, :idioma_trabajo, :hablar_idioma, :escribir_idioma, :leer_idioma, :escuchar_idioma, :anti_empleo, :ano_ingreso, :ingreso, :nivel_jerarquico, :condicion, :relacion, :organismo, :giro, :razon_social, :domicilio, :ciudad, :municipio, :estado, :telefno, :ext, :fax, :email, :pagina_web, :sector_primario, :sector_secundario, :sector_terciario, :tam_empresa)
    end
end
