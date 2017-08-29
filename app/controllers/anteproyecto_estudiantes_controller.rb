class AnteproyectoEstudiantesController < ApplicationController
  before_action :set_anteproyecto_estudiante, only: [:show, :edit, :update, :destroy]

  # GET /anteproyecto_estudiantes
  # GET /anteproyecto_estudiantes.json
  def index
    @anteproyecto_estudiantes = AnteproyectoEstudiante.all
  end

  # GET /anteproyecto_estudiantes/1
  # GET /anteproyecto_estudiantes/1.json
  def show
  end

  # GET /anteproyecto_estudiantes/new
  def new
    @anteproyecto_estudiante = AnteproyectoEstudiante.new
  end

  # GET /anteproyecto_estudiantes/1/edit
  def edit
  end

  # POST /anteproyecto_estudiantes
  # POST /anteproyecto_estudiantes.json
  def create
    @anteproyecto_estudiante = AnteproyectoEstudiante.new(anteproyecto_estudiante_params)

    respond_to do |format|
      if @anteproyecto_estudiante.save
        format.html { redirect_to @anteproyecto_estudiante, notice: 'Anteproyecto estudiante was successfully created.' }
        format.json { render :show, status: :created, location: @anteproyecto_estudiante }
      else
        format.html { render :new }
        format.json { render json: @anteproyecto_estudiante.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /anteproyecto_estudiantes/1
  # PATCH/PUT /anteproyecto_estudiantes/1.json
  def update
    respond_to do |format|
      if @anteproyecto_estudiante.update(anteproyecto_estudiante_params)
        format.html { redirect_to @anteproyecto_estudiante, notice: 'Anteproyecto estudiante was successfully updated.' }
        format.json { render :show, status: :ok, location: @anteproyecto_estudiante }
      else
        format.html { render :edit }
        format.json { render json: @anteproyecto_estudiante.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /anteproyecto_estudiantes/1
  # DELETE /anteproyecto_estudiantes/1.json
  def destroy
    @anteproyecto_estudiante.destroy
    respond_to do |format|
      format.html { redirect_to anteproyecto_estudiantes_url, notice: 'Anteproyecto estudiante was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_anteproyecto_estudiante
      @anteproyecto_estudiante = AnteproyectoEstudiante.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def anteproyecto_estudiante_params
      params.fetch(:anteproyecto_estudiante, {})
    end
end
