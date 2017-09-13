class BancoProyectoEstudiantesController < ApplicationController
  before_action :set_banco_proyecto_estudiante, only: [:show, :edit, :update, :destroy]

  # GET /banco_proyecto_estudiantes
  # GET /banco_proyecto_estudiantes.json
  def index
    @banco_proyecto_estudiantes = BancoProyectoEstudiante.all
  end

  # GET /banco_proyecto_estudiantes/1
  # GET /banco_proyecto_estudiantes/1.json
  def show
  end

  # GET /banco_proyecto_estudiantes/new
  def new
    @banco_proyecto_estudiante = BancoProyectoEstudiante.new
  end

  # GET /banco_proyecto_estudiantes/1/edit
  def edit
  end

  # POST /banco_proyecto_estudiantes
  # POST /banco_proyecto_estudiantes.json
  def create
    @banco_proyecto_estudiante = BancoProyectoEstudiante.new(banco_proyecto_estudiante_params)

    respond_to do |format|
      if @banco_proyecto_estudiante.save
        format.html { redirect_to @banco_proyecto_estudiante, notice: 'Banco proyecto estudiante was successfully created.' }
        format.json { render :show, status: :created, location: @banco_proyecto_estudiante }
      else
        format.html { render :new }
        format.json { render json: @banco_proyecto_estudiante.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /banco_proyecto_estudiantes/1
  # PATCH/PUT /banco_proyecto_estudiantes/1.json
  def update
    respond_to do |format|
      if @banco_proyecto_estudiante.update(banco_proyecto_estudiante_params)
        format.html { redirect_to @banco_proyecto_estudiante, notice: 'Banco proyecto estudiante was successfully updated.' }
        format.json { render :show, status: :ok, location: @banco_proyecto_estudiante }
      else
        format.html { render :edit }
        format.json { render json: @banco_proyecto_estudiante.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /banco_proyecto_estudiantes/1
  # DELETE /banco_proyecto_estudiantes/1.json
  def destroy
    @banco_proyecto_estudiante.destroy
    respond_to do |format|
      format.html { redirect_to banco_proyecto_estudiantes_url, notice: 'Banco proyecto estudiante was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_banco_proyecto_estudiante
      @banco_proyecto_estudiante = BancoProyectoEstudiante.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def banco_proyecto_estudiante_params
      params.require(:banco_proyecto_estudiante).permit(:numControl, :estado, :observacion, :banco_proyecto_id)
    end
end
