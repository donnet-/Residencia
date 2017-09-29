class AnteproyectosController < ApplicationController
  before_action :set_anteproyecto, only: [:show, :edit, :update, :destroy]
  #autocomplete :estudiante, :numControl, :display_value => :funky_method, :extra_data => [:nombre, :apPaterno, :apMaterno]

  # GET /anteproyectos
  # GET /anteproyectos.json
  def index
    @anteproyectos = Anteproyecto.order(sort_column + ' ' + sort_direction).paginate( per_page: 10, page: params[:page])
  end
  
  def sort_column
    params[:sort] || "id"
  end
    
  def sort_direction
    params[:direction] || "desc"
  end

  # GET /anteproyectos/1
  # GET /anteproyectos/1.json
  def show
  end

  def new
    @anteproyecto = Anteproyecto.new
      1.times { @anteproyecto.anteproyecto_estudiantes.build }
      1.times { @anteproyecto.anteproyecto_observaciones.build }
  end

  # GET /anteproyectos/1/edit
  def edit
    @anteproyecto= Anteproyecto.find(params[:id])
  end

  # POST /anteproyectos
  # POST /anteproyectos.json
  def create
    @anteproyecto = Anteproyecto.new(anteproyecto_params)
    respond_to do |format|
      if @anteproyecto.save
        format.html { redirect_to @anteproyecto, notice: 'El anteproyecto fue  satisfactoriamente creado.' }
        format.json { render :show, status: :created, location: @anteproyecto }
      else
        format.html { render :new }
        format.json { render json: @anteproyecto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /anteproyectos/1
  # PATCH/PUT /anteproyectos/1.json
  def update
    respond_to do |format|
      if @anteproyecto.update(anteproyecto_params)
        format.html { redirect_to @anteproyecto, notice: 'El Anteproyecto fue satisfactoriamente actualizado.' }
        format.json { render :show, status: :ok, location: @anteproyecto }
      else
        format.html { render :edit }
        format.json { render json: @anteproyecto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /anteproyectos/1
  # DELETE /anteproyectos/1.json
  def destroy
    @anteproyecto.destroy
    respond_to do |format|
      format.html { redirect_to anteproyectos_url, notice: 'El anteproyecto fue satisfactoriamente eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_anteproyecto
      @anteproyecto = Anteproyecto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def anteproyecto_params
      params.require(:anteproyecto).permit(:fk_id_proyecto_b, :nombre_anteproy, :asesor_externo, :status_anteproy, :revisor, :clave, :status_anteproy_revisor,
        anteproyecto_estudiantes_attributes: [:id, :numControl, :_destroy],
        anteproyecto_observaciones_attributes: [:id, :identificador, :observacion, :_destroy])
    end
end
