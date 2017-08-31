class SolicitudesController < ApplicationController
  def show
  	@date = params[:date] ? Date.parse(params[:date]) : Date.today
  	@solicitud = Solicitud.find(params[:id])
  	  respond_to do |format|
      format.html
      format.pdf{
        render template:'solicitudes/solicitud', pdf: 'Solicitud', layout:'solicitudpdf.html'}
    end
  end

  	#@date = params[:date] ? Date.parse(params[:date]) : Date.today
  def index
    busqueda = "%#{params[:search]}%"
    @solicitudes = Solicitud.all.order(sort_column + ' ' + sort_direction).paginate(per_page: 10, page: params[:page])
    
    if params[:search].present?
      @solicitudes = Solicitud.where('nombrep LIKE ? OR fechaini LIKE ? OR fechater LIKE ? OR aexterno LIKE ? OR telefono LIKE ? OR extension LIKE ? OR correo LIKE ? OR area LIKE ? OR numresidentes LIKE ? OR carrera LIKE ? OR semestre LIKE ? OR ingles LIKE ? OR horaentrada LIKE ? OR horasalida LIKE ? OR desproyecto LIKE ? OR objetivo LIKE ? OR actividades LIKE ? OR pc LIKE ? OR tel_escritorio LIKE ? OR lugar LIKE ? OR beca LIKE ? OR observacion LIKE ? OR estado LIKE ? OR rfc LIKE ? OR periodo LIKE ? OR rfc_docente_revisor LIKE ? OR estado_revision_docente LIKE ? OR clave_solicitud LIKE ?', busqueda, busqueda, busqueda, busqueda, busqueda, busqueda, busqueda, busqueda, busqueda, busqueda, busqueda, busqueda, busqueda, busqueda, busqueda, busqueda, busqueda, busqueda, busqueda, busqueda, busqueda, busqueda, busqueda, busqueda, busqueda, busqueda, busqueda, busqueda).paginate(per_page: 10, page: params[:page])
    end
    
    if params[:estado].present?
      p = "%#{params[:estado]}%"
      @solicitudes = Solicitud.where('estado LIKE ?', p).order(sort_column + ' ' + sort_direction).paginate( per_page: 10, page: params[:page])
    end
    
    if params[:periodo].present? && params[:anio].present?
      p = params[:periodo]+'/'+params[:anio]
      @solicitudes = Solicitud.where('periodo LIKE ?', p).order(sort_column + ' ' + sort_direction).paginate( per_page: 10, page: params[:page])
    elsif params[:anio].present?
      @solicitudes = Solicitud.where('periodo LIKE ? ', "%#{params[:anio]}%").order(sort_column + ' ' + sort_direction).paginate( per_page: 10, page: params[:page])
    end
  end

  def new
  	@solicitud = Solicitud.new
      1.times { @solicitud.solicitud_observaciones.build }
  end

  def edit
    @solicitud = Solicitud.find(params[:id])
  end
  
  def update
    @solicitud = Solicitud.find(params[:id])
    estado = @solicitud.estado
    
    if @solicitud.update(solicitud_params)
      if @solicitud.estado != estado && @solicitud.estado == "Aprobado"
        redirect_to new_banco_proyecto_path
      else
        redirect_to @solicitud
      end
    else
      :edit
    end
  end
  
  def create
    @solicitud = Solicitud.new(solicitud_params)
    
    ultima_solic = Solicitud.order("id DESC").first
    if ultima_solic != nil
      id_nueva = (ultima_solic.id + 1)
      if id_nueva < 10
        id_nueva = '0' + id_nueva.to_s
      end
    else
      id_nueva = '01'
    end
    
    t = @solicitud.fechaini
    @anio = t.strftime("%Y")
    @mes = t.strftime("%m").to_i
    if @mes <= 7
      @solicitud.periodo = 'FEBRERO-JUNIO/' + @anio.to_s
      @solicitud.clave_solicitud = 'FEJU' + @anio.to_s + id_nueva
    else
      @solicitud.periodo = 'AGOSTO-DICIEMBRE/' + @anio.to_s
      @solicitud.clave_solicitud = 'AGDI' + @anio.to_s + id_nueva
    end
    
    @solicitud.save
    redirect_to @solicitud 
  end
  
  private
  def solicitud_params
    params.require(:solicitud).permit(:nombrep, :fechaini, :fechater, :aexterno, :telefono, :extension, :correo, :area,
    	:numresidentes, :carrera, :semestre, :ingles, :horaentrada, :horasalida, :desproyecto, :objetivo, :actividades, :pc, :tel_escritorio, :lugar, :beca, :observacion, :estado, :rfc, :periodo, :rfc_docente_revisor, :estado_revision_docente, :clave_solicitud, solicitud_observaciones_attributes: [:id, :rfc, :observacion, :_destroy])
  end

  def sort_column
    params[:sort] || "id"
  end
    
  def sort_direction
    params[:direction] || "desc"
  end
end
