class BancoProyectoEstudiantesController < ApplicationController
  before_action :set_banco_proyecto_estudiante, only: [:show, :edit, :update, :destroy]

  def index
    @banco_proyecto_estudiantes = BancoProyectoEstudiante.all
  end

  def show
  end

  def new
    @banco_proyecto_estudiante = BancoProyectoEstudiante.new(
      :numControl => current_usuario.numControl, :estado => "En revisión", :banco_proyecto_id => params[:banco_proyecto_id])
    
    
    respond_to do |format|
      if @banco_proyecto_estudiante.save

        format.html { redirect_to banco_proyecto_path(params[:banco_proyecto_id]), notice: 'Su solicitud fue satisfactoriamente enviada.' }
        format.json { render :show, status: :created, location: @banco_proyecto_estudiante }
      else
        format.html { render :new }
        format.json { render json: @banco_proyecto_estudiante.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def create
  end

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

  def destroy
    # @banco_proyecto_estudiante.destroy
    @banco = BancoProyectoEstudiante.find(params[:id])
    execute_statement("delete from banco_proyecto_estudiantes where id = " + params[:id])
    respond_to do |format|
      format.html { redirect_to banco_proyecto_path(@banco.banco_proyecto_id), notice: 'Su solicitud ha sido satisfactoriamente eliminada.' }
      format.json { head :no_content }
    end
  end
  
  private
    def set_banco_proyecto_estudiante
      @banco_proyecto_estudiante = BancoProyectoEstudiante.find(params[:id])
    end

    def banco_proyecto_estudiante_params
      params.require(:banco_proyecto_estudiante).permit(:numControl, :estado, :observacion, :banco_proyecto_id)
    end
end
