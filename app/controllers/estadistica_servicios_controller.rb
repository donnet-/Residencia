class EstadisticaServiciosController < ApplicationController
  before_action :set_estadistica_servicio, only: [:show, :edit, :update, :destroy]

  # GET /estadistica_servicios
  # GET /estadistica_servicios.json
  def index
    @estadistica_servicios = EstadisticaServicio.all
    if params[:periodo] !=nil || params[:anio] != nil
      a = params[:periodo]
      a = a+params[:anio]
      per = Periodo.find_by(periodo: a)
      if per != nil
        @servicios = ServicioSocial.where('fechaInicio >= ? and fechaTermino <= ?', per.fechaInicio, per.fechaTermino).order('nombreE')
      else 
        @servicios = [] 
      end
      #a = EvaluacionServicio.where(id_servicio_social: @servicios[0].id)      
    else
      @servicios = []
    end 
     data_array_1 = [2.5,1.0,4.00]
    data_array_2 = [3.29,3.57,3.86]
     @barv = Gchart.bar( 
            :size => '700x400',
            :bar_colors => 'FF0000,00FF00',
            :stacked => false,
            :title => "Gráfica de Promedios por bimestre", 
            :bg => 'EFEFEF', 
            :legend => ['Empresa 1', 'Empresa 2'],
            :bar_width_and_spacing => {:spacing => 100, :group_spacing => 150},
            :data => [data_array_2,data_array_1],
            :legend_position => 'bottom',
            :axis_with_labels => 'x,y,r',                
            :max_value => 4,
            :min_value => 0,            
            :axis_labels => [["Promedio Bimestral"],["0.00|1.00|1.50|2.50|3.50|4.0"],["|Insuficiente|Suficiente|Bueno|Notable|Excelente"]],
            )
     @bar = Gchart.bar(
              :size => '200x300', 
              :title => "example title",
              :bg => 'efefef',         
              :legend => ['label 1', 'label 2'],         
              :data => [10, 30])

  end

  # GET /estadistica_servicios/1
  # GET /estadistica_servicios/1.json
  def show
  end

  # GET /estadistica_servicios/new
  def new    
    @estadistica_servicio = EstadisticaServicio.new
    if params[:periodo] !=nil || params[:anio] != nil
      a = params[:periodo]
      a = a+params[:anio]
      per = Periodo.find_by(periodo: a)
      if per != nil
        @servicios = ServicioSocial.where('fechaInicio >= ? and fechaTermino <= ?', per.fechaInicio, per.fechaTermino)
      else 
        @servicios = nil 
      end
      #a = EvaluacionServicio.where(id_servicio_social: @servicios[0].id)      
    else
      @servicios = nil
    end
  end

  # GET /estadistica_servicios/1/edit
  def edit
  end

  # POST /estadistica_servicios
  # POST /estadistica_servicios.json
  def create
    @estadistica_servicio = EstadisticaServicio.new(estadistica_servicio_params)    
    respond_to do |format|
      if @estadistica_servicio.save
        format.html { redirect_to @estadistica_servicio, notice: 'Estadistica servicio was successfully created.' }
        format.json { render :show, status: :created, location: @estadistica_servicio }
      else
        format.html { render :new }
        format.json { render json: @estadistica_servicio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /estadistica_servicios/1
  # PATCH/PUT /estadistica_servicios/1.json
  def update
    respond_to do |format|
      if @estadistica_servicio.update(estadistica_servicio_params)
        format.html { redirect_to @estadistica_servicio, notice: 'Estadistica servicio was successfully updated.' }
        format.json { render :show, status: :ok, location: @estadistica_servicio }
      else
        format.html { render :edit }
        format.json { render json: @estadistica_servicio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estadistica_servicios/1
  # DELETE /estadistica_servicios/1.json
  def destroy
    @estadistica_servicio.destroy
    respond_to do |format|
      format.html { redirect_to estadistica_servicios_url, notice: 'Estadistica servicio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estadistica_servicio
      @estadistica_servicio = EstadisticaServicio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def estadistica_servicio_params
      params.require(:estadistica_servicio).permit(:periodo, :promedioB, :promedioFin, :desempeño)
    end
end
