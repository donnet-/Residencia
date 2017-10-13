class SolicitudesController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_action :authenticate_usuario!
  load_and_authorize_resource :except => :create
   
  def show
    @solicitud = Solicitud.find(params[:id])
    if @solicitud.estado_secundario_revisor == "(recién asignado)" and @solicitud.rfc_docente_revisor == current_usuario.rfc
      @solicitud.estado_secundario_revisor = "()"
      @solicitud.save
    elsif @solicitud.estado_secundario == "(recién solicitado)"
      @solicitud.estado_secundario = "()"
      @solicitud.save
    end
    
    if current_usuario.rol == "docente"
      if @solicitud.estado_secundario_revisor == "(con correcciones)" and @solicitud.rfc_docente_revisor == current_usuario.rfc
        @solicitud.estado_secundario_revisor = "()"
      elsif @solicitud.estado_secundario == "(con correcciones)"
        @solicitud.estado_secundario = "()"
      end
      @solicitud.save
    end
    
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
      1.times do
        horario = @solicitud.solicitud_horarios.build 
      end
  end

  def edit
    @solicitud = Solicitud.find(params[:id])
  end
  
  def update
    @solicitud = Solicitud.find(params[:id])
    
    estado = @solicitud.estado
    revisor = @solicitud.rfc_docente_revisor
    
    if params[:solicitud][:solicitud_observaciones_attributes] != nil
      @solicitud_observaciones = SolicitudObservacion.new
      @solicitud_observaciones.rfc = params[:solicitud][:solicitud_observaciones_attributes][:"0"][:rfc]
      @solicitud_observaciones.observacion = params[:solicitud][:solicitud_observaciones_attributes][:"0"][:observacion ]
      @solicitud_observaciones.solicitud_id = params[:id]
      params[:solicitud][:solicitud_observaciones_attributes][:"0"][:observacion ] = nil
      if @solicitud_observaciones.observacion != ""
        @solicitud_observaciones.save
        if @solicitud_observaciones.rfc == @solicitud.rfc_docente_revisor
          @solicitud.estado_secundario_revisor = "(con observaciones)"
        else
          @solicitud.estado = "(con observaciones)"
        end
      end
    end
    
    @solicitud.update(solicitud_params)
    
    if @solicitud.save(:validate => false)
      if @solicitud.rfc_docente_revisor != revisor
        @solicitud.estado_secundario = "()"
        @solicitud.estado_secundario_revisor = "(recién asignado)"
        @solicitud.estado_revision_docente = "En revisión"
      end
      
      if @solicitud.estado_secundario == "(con observaciones)" and @solicitud.rfc == current_usuario.rfc
        @solicitud.estado_secundario = "(con correcciones)"
      end
      
      if @solicitud.estado_secundario_revisor == "(con observaciones)" and @solicitud.rfc == current_usuario.rfc
        @solicitud.estado_secundario_revisor = "(con correcciones)"
      end
    
      @solicitud.save
      
      if @solicitud.estado != estado && @solicitud.estado == "Aprobado"
        redirect_to new_banco_proyecto_path
      else
        redirect_to solicitud_path(@solicitud) 
      end
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
    
    if @solicitud.fechaini != nil
      t = @solicitud.fechaini
      @anio = t.strftime("%Y").to_i
      @mes = t.strftime("%m").to_i
    elsif @solicitud.fechater != nil
      t = @solicitud.fechater
      @anio = t.strftime("%Y").to_i
      @mes = t.strftime("%m").to_i
    else
      @anio = Date.current.year.to_i
      @mes = Date.current.month.to_i
      if @mes <= 7
        @mes = 8
      else
        @mes = 2
        @anio += 1
      end
    end
    
    if @mes <= 7
      @solicitud.periodo = 'FEBRERO-JUNIO/' + @anio.to_s
      @solicitud.clave_solicitud = 'FEJU' + @anio.to_s + id_nueva.to_s
    else
      @solicitud.periodo = 'AGOSTO-DICIEMBRE/' + @anio.to_s
      @solicitud.clave_solicitud = 'AGDI' + @anio.to_s + id_nueva.to_s
    end
    
    @solicitud.estado_secundario = "(recién solicitado)"
    @solicitud.estado_secundario_revisor = "()"
    @solicitud.estado = "En revisión"
    @solicitud.estado_revision_docente = "Revisor no asignado"
    
    respond_to do |format|
      if @solicitud.save
        format.html { redirect_to solicitudes_path, notice: 'La solicitud fue satisfactoriamente almacenada.' }
        format.json { render :show, status: :created, location: @solicitud }
      else
        format.html { render :new }
        format.json { render json: @solicitud.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
  def solicitud_params
    params.require(:solicitud).permit(:nombrep, :fechaini, :fechater, :aexterno, :telefono, :extension, :correo, :area,
    	:numresidentes, :carrera, :semestre, :ingles, :horaentrada, :horasalida, :desproyecto, :objetivo, :actividades, :pc,
       :tel_escritorio,:cuenta_correo, :lugar, :beca, :observacion, :estado, :rfc, :periodo, :rfc_docente_revisor,
       :estado_revision_docente, :clave_solicitud, :observacion, :estado_secundario, :estado_secundario_revisor,
        solicitud_observaciones_attributes: [:id, :rfc, :observacion, :_destroy],
        solicitud_horarios_attributes: [:id,:dia_inicio,:dia_termino, :hora_inicio, :hora_termino, :_destroy])
  end

  def sort_column
    params[:sort] || "id"
  end
    
  def sort_direction
    params[:direction] || "desc"
  end
end
