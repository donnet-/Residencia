class ComentarioEgresadosController < ApplicationController
  before_action :set_comentario_egresado, only: [:show, :edit, :update, :destroy]

  # GET /comentario_egresados
  # GET /comentario_egresados.json
  def index
    @comentario_egresados = ComentarioEgresado.all
  end

  # GET /comentario_egresados/1
  # GET /comentario_egresados/1.json
  def show
  end

  # GET /comentario_egresados/new
  def new
    @comentario_egresado = ComentarioEgresado.new
  end

  # GET /comentario_egresados/1/edit
  def edit
  end

  # POST /comentario_egresados
  # POST /comentario_egresados.json
  def create
    @comentario_egresado = ComentarioEgresado.new(comentario_egresado_params)

    respond_to do |format|
      if @comentario_egresado.save
        format.html { redirect_to @comentario_egresado, notice: 'Comentario egresado was successfully created.' }
        format.json { render :show, status: :created, location: @comentario_egresado }
      else
        format.html { render :new }
        format.json { render json: @comentario_egresado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comentario_egresados/1
  # PATCH/PUT /comentario_egresados/1.json
  def update
    respond_to do |format|
      if @comentario_egresado.update(comentario_egresado_params)
        format.html { redirect_to @comentario_egresado, notice: 'Comentario egresado was successfully updated.' }
        format.json { render :show, status: :ok, location: @comentario_egresado }
      else
        format.html { render :edit }
        format.json { render json: @comentario_egresado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comentario_egresados/1
  # DELETE /comentario_egresados/1.json
  def destroy
    @comentario_egresado.destroy
    respond_to do |format|
      format.html { redirect_to comentario_egresados_url, notice: 'Comentario egresado was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comentario_egresado
      @comentario_egresado = ComentarioEgresado.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comentario_egresado_params
      params.require(:comentario_egresado).permit(:opinion)
    end
end
