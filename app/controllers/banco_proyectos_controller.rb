class BancoProyectosController < ApplicationController
  before_action :set_banco_proyecto, only: [:show, :edit, :update, :destroy]
  # autocomplete :empresa, :rfcEmpresa
  
  # GET /banco_proyectos
  # GET /banco_proyectos.json
  def index
    @banco_proyectos = BancoProyecto.order(sort_column + ' ' + sort_direction).paginate( per_page: 10, page: params[:page] )
  end
  
  def sort_column
    params[:sort] || "id"
  end
    
  def sort_direction
    params[:direction] || "desc"
  end


  # GET /banco_proyectos/1
  # GET /banco_proyectos/1.json
  def show
  end

  # GET /banco_proyectos/new
  def new
    @banco_proyecto = BancoProyecto.new
      1.times { @banco_proyecto.banco_proyecto_estudiantes.build }
  end

  # GET /banco_proyectos/1/edit
  def edit
  end

  # POST /banco_proyectos
  # POST /banco_proyectos.json
  def create
    @banco_proyecto = BancoProyecto.new(banco_proyecto_params)

    respond_to do |format|
      if @banco_proyecto.save
        format.html { redirect_to solicitudes_path, notice: 'El proyecto fue satisfactoriamente almacenado en el banco.' }
        format.json { render :show, status: :created, location: @banco_proyecto }
      else
        format.html { render :new }
        format.json { render json: @banco_proyecto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /banco_proyectos/1
  # PATCH/PUT /banco_proyectos/1.json
  def update
    respond_to do |format|
      if @banco_proyecto.update(banco_proyecto_params)
        format.html { redirect_to @banco_proyecto, notice: 'Banco proyecto was successfully updated.' }
        format.json { render :show, status: :ok, location: @banco_proyecto }
      else
        format.html { render :edit }
        format.json { render json: @banco_proyecto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /banco_proyectos/1
  # DELETE /banco_proyectos/1.json
  def destroy
    @banco_proyecto.destroy
    respond_to do |format|
      format.html { redirect_to banco_proyectos_url, notice: 'Banco proyecto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_banco_proyecto
      @banco_proyecto = BancoProyecto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def banco_proyecto_params
      params.require(:banco_proyecto).permit(:clave, :fk_rfc_emp_inst, :nombre_proyecto_b, :descrip_proyecto_b, :tipo_proyecto_b, :tipo_proyecto_b, :fecha_inicio_proyecto_b, :fecha_termino_proyecto_b, :num_residentes, :objetivo_esperado, :pdf_solicitud, :asesor_externo,
        banco_proyecto_estudiantes_attributes: [:id, :numControl, :estado, :observacion, :_destroy])
    end
    
end
