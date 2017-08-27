class ActividadesController < ApplicationController
    
    helper_method :sort_column, :sort_direction
    before_action :authenticate_usuario!
    load_and_authorize_resource :except => :create
	respond_to :docx
    def index
        if current_usuario.rol == 'admin'
            @actividades = Actividad.all.order(sort_column + ' ' + sort_direction).paginate(per_page: 10, page: params[:page])

            @actividades_ca = @actividades.group_by(&:fechaInicio)
            @date = params[:date] ? Date.parse(params[:date]) : Date.today
            
            if params[:search].present?
                @tipoAct = CatTipoActividad.find_by('nombreTipoAct LIKE ?', "%#{params[:search]}%")
                if @tipoAct != nil
                    @actividades = @actividades.where(cat_tipo_actividad_id: @tipoAct.id)
                else
                    busqueda = "%#{params[:search]}%"
                    @actividades = @actividades.where('nombreActividad LIKE ? OR fechaInicio LIKE ? OR fechaTermino LIKE ? OR tipoComision LIKE ? OR tipoEvidencia LIKE ? OR lugar LIKE ? ', busqueda, busqueda, busqueda, busqueda, busqueda, busqueda).paginate(per_page: 10, page: params[:page])
                end
            end
            if params[:periodo].present? && params[:anio].present?
                p = params[:periodo]
                mes1 = params[:anio]+'-'+p.split[0]
                mes2 = params[:anio]+'-'+p.split[2]
                
                @actividades = @actividades.where('fechaInicio > ? AND fechaTermino < ?', mes1, mes2).paginate(per_page: 10, page: params[:page])
            elsif params[:anio].present?
                @actividades = @actividades.where('fechaInicio LIKE ? OR fechaTermino LIKE ?', "%#{params[:anio]}%", "%#{params[:anio]}%").paginate(per_page: 10, page: params[:page])
            end
        end
    end
	
	def control_actividad_investigaciones
        @tipoAct = CatTipoActividad.where('nombreTipoAct LIKE ? OR nombreTipoAct LIKE ? OR nombreTipoAct LIKE ? OR nombreTipoAct LIKE ?', 'articulo', 'ponencias', 'revistas', 'congreso')
        @actividad_investigaciones = Actividad.where(cat_tipo_actividad_id: @tipoAct).order(sort_column_fecha + ' ' + sort_direction).paginate(per_page: 10, page: params[:page])
        
        if params[:tipo_act].present?
            @tipoAct = CatTipoActividad.find_by('nombreTipoAct LIKE ?', "%#{params[:tipo_act]}%")
            if @tipoAct != nil
                @actividad_investigaciones = Actividad.where(cat_tipo_actividad_id: @tipoAct.id).paginate(per_page: 10, page: params[:page])
            end
        end
        if params[:periodo].present? && params[:anio].present?
            p = params[:periodo]
            mes1 = params[:anio]+'-'+p.split[0]
            mes2 = params[:anio]+'-'+p.split[2]
             
            @actividad_investigaciones = @actividad_investigaciones.where('fechaInicio > ? AND fechaTermino < ?', mes1, mes2).paginate(per_page: 10, page: params[:page])
            
        elsif params[:anio].present?
            @actividad_investigaciones = @actividad_investigaciones.where('fechaInicio LIKE ? OR fechaTermino LIKE ?', "%#{params[:anio]}%", "%#{params[:anio]}%").paginate(per_page: 10, page: params[:page])
        end

        respond_to do |format|
            format.html
            format.pdf {
                render template: 'actividades/depto_investigacion/pdfControlActividades', 
                pdf:'one', page_size: 'Letter', 
                margin: { left: 10, right: 10, bottom: 10 }
                }
			format.xlsx {
				render xlsx: 'control_actividad_investigaciones'
			}
        end
    end
	
	def actividades_recientes
        if current_usuario.rol == 'admin'
            actual = Date.today
            @recientes = Actividad.where('fechaTermino > ?', actual).order(sort_column + ' ' + sort_direction).paginate(per_page: 10, page: params[:page])

            @actividades_ca = @recientes.group_by(&:fechaInicio)
            @date = params[:date] ? Date.parse(params[:date]) : Date.today
            
            if params[:search].present?
                @tipoAct = CatTipoActividad.find_by('nombreTipoAct LIKE ?', "%#{params[:search]}%")
                if @tipoAct != nil
                    @recientes = @recientes.where(cat_tipo_actividad_id: @tipoAct.id)
                else
                    busqueda = "%#{params[:search]}%"
                    @recientes = @recientes.where('nombreActividad LIKE ? OR fechaInicio LIKE ? OR fechaTermino LIKE ? OR tipoComision LIKE ? OR tipoEvidencia LIKE ? OR lugar LIKE ? ', busqueda, busqueda, busqueda, busqueda, busqueda, busqueda).paginate(per_page: 10, page: params[:page])
                end
            end
        end
    end
	
    def docente_actividades
        if current_usuario.rol == 'docente'
            
            usuario = Docente.find_by(email: current_usuario.email)
            actdoc = ActividadDocente.where(docente_id: usuario.id)
            @ac = []
            for ad in actdoc 
                actividad = Actividad.find(ad.actividad_id)
                @ac.push(actividad)
            end
            
            @docente_actividades = @ac.sort! { |a, b|  a.nombreActividad <=> b.nombreActividad }
            @docente_actividades = @ac.sort! { |a, b|  a.cat_tipo_actividad_id <=> b.cat_tipo_actividad_id }
            
            
            @actividades_ca = @docente_actividades.group_by(&:fechaInicio)
            @date = params[:date] ? Date.parse(params[:date]) : Date.today
            
            if params[:search].present?
                @tipoAct = CatTipoActividad.find_by('nombreTipoAct LIKE ?', "%#{params[:search]}%")
                if @tipoAct != nil
                    x = 0
                    ac = []
                    @docente_actividades.each do|tipo| 
                        if (@docente_actividades[x].cat_tipo_actividad_id == @tipoAct.id)
                            ac.push(tipo)
                        end
                        x = x +1
                    end
                    @docente_actividades = ac.sort! { |a, b|  a.id <=> b.id }
                else
                    busqueda = "%#{params[:search]}%"
                    @docente_acti = Actividad.where('nombreActividad LIKE ? OR fechaInicio LIKE ? OR fechaTermino LIKE ? OR tipoComision LIKE ? OR tipoEvidencia LIKE ? OR lugar LIKE ? ', busqueda, busqueda, busqueda, busqueda, busqueda, busqueda)
                    
                    x = 0
                    @ac = []
                    @docente_acti.order(:id)
                    @docente_actividades.sort! { |a, b|  a.id <=> b.id }
                    @docente_acti.each do |d|
                        @docente_actividades.each do |a|
                            if a.id == d.id
                                @ac.push(d)
                            end
                        end
                    end
                    @docente_actividades = @ac
                end
            end
            
            if params[:periodo].present? && params[:anio].present?
                p = params[:periodo]
                mes1 = params[:anio]+'-'+p.split[0]
                mes2 = params[:anio]+'-'+p.split[2]
                
                @docente_acti = Actividad.where('fechaInicio > ? AND fechaTermino < ?', mes1, mes2)
                
                x = 0
                @ac = []
                @docente_acti.order(:id)
                @docente_actividades.sort! { |a, b|  a.id <=> b.id }
                @docente_acti.each do |d|
                    @docente_actividades.each do |a|
                        if a.id == d.id
                            @ac.push(d)
                        end
                    end
                end
                @docente_actividades = @ac
                
            elsif params[:anio].present?
                @docente_acti = Actividad.where('fechaInicio LIKE ? OR fechaTermino LIKE ?', "%#{params[:anio]}%", "%#{params[:anio]}%")
                x = 0
                @ac = []
                @docente_acti.order(:id)
                @docente_actividades.sort! { |a, b|  a.id <=> b.id }
                @docente_acti.each do |d|
                    @docente_actividades.each do |a|
                        if a.id == d.id
                            @ac.push(d)
                        end
                    end
                end
                @docente_actividades = @ac
            end
            
        end 
    end
    
    def docente_actividad_recientes
        if current_usuario.rol == 'docente'
            actual = Date.today
            usuario = Docente.find_by(email: current_usuario.email)
            
            @docente_actividad_recientes = Actividad.where('fechaTermino > ?', actual).order(sort_column + ' ' + sort_direction).paginate(per_page: 10, page: params[:page])
            
            @act = []
            @docente_actividad_recientes.each do |doc|
                a = ActividadDocente.find_by(actividad_id: doc.id, docente_id: usuario.id)
                if a != nil 
                    @act.push(doc)
                end
            end
            
            @docente_actividad_recientes = @act
            if @docente_actividad_recientes != nil
                @actividades_ca = @docente_actividad_recientes.group_by(&:fechaInicio)
                @date = params[:date] ? Date.parse(params[:date]) : Date.today
            else
            end
            if  @docente_actividad_recientes != nil
                 @docente_actividad_recientes.sort! { |a, b|  a.nombreActividad <=> b.nombreActividad }
                 @docente_actividad_recientes.sort! { |a, b|  a.cat_tipo_actividad_id <=> b.cat_tipo_actividad_id }

                if params[:search].present?
                    @tipoAct = CatTipoActividad.find_by('nombreTipoAct LIKE ?', "%#{params[:search]}%")
                    if @tipoAct != nil
                        x = 0
                        ac = []
                         @docente_actividad_recientes.each do|tipo| 
                            if ( @docente_actividad_recientes[x].cat_tipo_actividad_id == @tipoAct.id)
                                ac.push(tipo)
                            end
                            x = x +1
                        end
                         @docente_actividad_recientes = ac.sort! { |a, b|  a.id <=> b.id }
                    else
                        busqueda = "%#{params[:search]}%"
                        @docente_acti = Actividad.where('nombreActividad LIKE ? OR fechaInicio LIKE ? OR fechaTermino LIKE ? OR tipoComision LIKE ? OR tipoEvidencia LIKE ? OR lugar LIKE ? ', busqueda, busqueda, busqueda, busqueda, busqueda, busqueda)

                        x = 0
                        @ac = []
                        @docente_acti.order(:id)
                         @docente_actividad_recientes.sort! { |a, b|  a.id <=> b.id }
                        @docente_acti.each do |d|
                             @docente_actividad_recientes.each do |a|
                                if a.id == d.id
                                    @ac.push(d)
                                end
                            end
                        end
                         @docente_actividad_recientes = @ac
                    end
                end
            end
        end
    end
    
    def show
        @actividad = Actividad.find(params[:id])
        if @actividad.tipoComision == 'Con Viaticos'
            if CatTipoActividad.find(@actividad.cat_tipo_actividad_id).nombreTipoAct == 'Diplomado'
                respond_to do |format|
                    format.html
                    format.pdf {
                        render template: 'actividades/diplomado/pdfComision', 
                        pdf:'one', page_size: 'Letter', 
                        margin: { left: 25, right: 25, bottom: 25 },
                        header: { margin: { top: 10, bottom: 10 },
                                  html: { template: 'layouts/cabeceraComision.html' },
                                },
                        footer: { 
                                  html: { template: 'layouts/footerComision.html' }
                                }
                        }                    
                end
            else
                respond_to do |format|
                    format.html
                    format.pdf {
                        render template: 'actividades/archivoAct/pdfComisionActCV', 
                        pdf:'one', page_size: 'Letter', 
                        margin: { left: 25, right: 25, bottom: 25 },
                        header: { margin: { top: 10, bottom: 10 },
                                  html: { template: 'layouts/cabeceraComision.html' },
                                },
                        footer: { 
                                  html: { template: 'layouts/footerComision.html' }
                                }
                        }
                end
            end
        elsif @actividad.tipoComision == "Sin Viaticos"
            if CatTipoActividad.find(@actividad.cat_tipo_actividad_id).nombreTipoAct == 'Diplomado'
                respond_to do |format|
                    format.html
                    format.pdf {
                        render template: 'actividades/diplomado/pdfComisionSV', 
                        pdf:'one', page_size: 'Letter', 
                        margin: { left: 25, right: 25, bottom: 25 },
                        header: { margin: { top: 10, bottom: 10 },
                                  html: { template: 'layouts/cabeceraComision.html' },
                                },
                        footer: { 
                                  html: { template: 'layouts/footerComision.html' }
                                }
                        }
                end
            else
                respond_to do |format|
                    format.html
                    format.pdf {
                        render template: 'actividades/archivoAct/pdfComisionAct', 
                        pdf:'one', page_size: 'Letter', 
                        margin: { left: 25, right: 25, bottom: 25 },
                        header: { margin: { top: 10, bottom: 10 },
                                  html: { template: 'layouts/cabeceraComision.html' },
                                },
                        footer: { 
                                  html: { template: 'layouts/footerComision.html' }
                                }
                        }
                end
            end
        end
    end
    
    def new
		@participaciones = []
        @actividad = Actividad.new
        1.times { @actividad.actividad_docentes.build }
		#1.times { @actividad.build_actualizacion }
		1.times do
			actualizacion = @actividad.build_actualizacion
			1.times { actualizacion.horario_actualizaciones.build }
		end
    end
	
	def mapa
        @valor = params[:valor_id]
		@participaciones = CatTipoActividad.find(params[:cat_tipo_actividad_id]).cat_tipo_participaciones 
		@sugeridos = CatTipoActividad.find(params[:cat_tipo_actividad_id]).textoSugerido 
		respond_to do |format|
			format.js
		end
	end
	
	def mapa_descripcion
        @mapa_descrpcion = CatTipoActividad.find(params[:cat_tipo_actividad_id])
		respond_to do |format|
			format.js
		end
	end

    def create		
        @usuario = current_usuario
        @actividad = Actividad.create(actividad_params)
            
        if @actividad.save
			if CatTipoActividad.find(params[:actividad][:cat_tipo_actividad_id]).nombreTipoAct == "Examen profesional"                            
                @users = @actividad.actividad_docentes
                ModelMailer.profesionales(@users, @actividad).deliver_now 
            end
			@nombre = CatTipoActividad.find(@actividad.cat_tipo_actividad_id)
            if @nombre.nombreTipoAct == 'Viaje de Practicas'
                redirect_to new_actividad_visita_path(@actividad) 
            else
                redirect_to @actividad 
            end
			
        else
            @participaciones = CatTipoActividad.find(params[:actividad][:cat_tipo_actividad_id]).cat_tipo_participaciones
            render :new
        end
    end
    
    def edit
        @actividad = Actividad.find(params[:id])
    end
    
    def update
        comparacion = actividad_params[:actividad_docentes_attributes]        
        comparacion.each do |c| 
            if c[1][:_destroy] == "1"            
                actdoc = ActividadDocente.find_by(actividad_id: params[:id], docente_id: c[1][:docente_id])
                busca = Oficio.find_by(actividad_id: params[:id], actividad_docente_id: actdoc.id)                
                if busca != nil 
                    busca.destroy
                end
            end
        end        
                
        @actividad = Actividad.find(params[:id])        
        if @actividad.update(actividad_params)
            @nombre = CatTipoActividad.find(@actividad.cat_tipo_actividad_id)
            if @nombre.nombreTipoAct == 'Viaje de Practicas'
                @visita = Visita.find_by(:actividad_id => @actividad.id)
                if @visita == nil
                    redirect_to new_actividad_visita_path(@actividad, @visita)
                else
                    redirect_to actividad_visita_path(@actividad, @visita)
                end
            else
                redirect_to @actividad
            end
        else
            render :edit
        end
    end
    
    def destroy
        @actividad = Actividad.find(params[:id])
        @actividad.destroy
        
        redirect_to actividades_path
    end
    
    #----------------------PDF----------------------------    
    def orden_ministracion_viaticos
        @actividad = Actividad.find(params[:id])
        if CatTipoActividad.find(@actividad.cat_tipo_actividad_id).nombreTipoAct == 'Diplomado'
            respond_to do |format|
                format.html
                format.pdf {
                    render template: 'actividades/diplomado/pdfOMVI', 
                    pdf:'one',
                    header: {
                        margin: { top: 10, bottom:10 },
                        html: { template: 'layouts/cabeceraOMVI.html' },
                    },
                    page_size: 'Letter', 
                    margin: { left: 10, right: 10 }
                }
            end
        else
            respond_to do |format|
                format.html
                format.pdf {
                    render template: 'actividades/archivoAct/pdfOMVIAct', 
                    pdf:'one',
                    header: {
                        margin: { top: 10, bottom:10 },
                        html: { template: 'layouts/cabeceraOMVI.html' },
                    },
                    page_size: 'Letter', 
                    margin: { left: 10, right: 10 }
                }
            end
        end
    end
    
    def orden_servicio_pasajes
        @actividad = Actividad.find(params[:id])
        if CatTipoActividad.find(@actividad.cat_tipo_actividad_id).nombreTipoAct == 'Diplomado'
            respond_to do |format|
                format.html
                format.pdf {
                    render template: 'actividades/diplomado/pdfPasaje', 
                    pdf:'one',
                    header: {
                        margin: { top: 10, bottom:0 },
                        html: { template: 'layouts/cabeceraOMVI.html' },
                    },
                    page_size: 'Letter', 
                    margin: { left: 10, right: 10 }
                }
            end
        else
            respond_to do |format|
                format.html
                format.pdf {
                    render template: 'actividades/archivoAct/pdfPasajeAct', 
                    pdf:'one',
                    header: {
                        margin: { top: 10, bottom:10 },
                        html: { template: 'layouts/cabeceraOMVI.html' },
                    },
                    page_size: 'Letter', 
                    margin: { left: 10, right: 10 }
                }
            end
        end
    end
    
    def liquidacion_de_viaticos
        @actividad = Actividad.find(params[:id])
        if CatTipoActividad.find(@actividad.cat_tipo_actividad_id).nombreTipoAct == 'Diplomado'
            respond_to do |format|
                format.html
                format.pdf {
                    render template: 'actividades/diplomado/pdfLiquidacion', 
                    pdf:'one',
                    orientation: 'Landscape',
                    header: {
                        margin: { top: 5, bottom: 5 },
                        html: { template: 'layouts/cabeceraLiquidacion.html' },
                    },
                    page_size: 'Letter', 
                    margin: { left: 20, right: 20 }
                }
            end
        else
            respond_to do |format|
                format.html
                format.pdf {
                    render template: 'actividades/archivoAct/pdfLiquidacionAct', 
                    pdf:'one',
                    orientation: 'Landscape',
                    header: {
                        margin: { top: 20, bottom:20 },
                        html: { template: 'layouts/cabeceraLiquidacion.html' },
                    },
                    page_size: 'Letter', 
                    margin: { left: 20, right: 20 }
                }
            end
        end
    end
    
    def informe_comisiones
        @actividad = Actividad.find(params[:id])
        if CatTipoActividad.find(@actividad.cat_tipo_actividad_id).nombreTipoAct == 'Diplomado'
            respond_to do |format|
                format.html { }
                format.pdf {
                    render template: 'actividades/diplomado/informe', 
                    pdf:'one',
                    header: {
                        margin: { top: 20, bottom:20 },
                        html: { template: 'layouts/cabeceraComision.html' },
                    },
                    page_size: 'Letter', 
                    margin: { left: 20, right: 20 }
                }
            end
        else
            respond_to do |format|
                format.html
                format.pdf {
                    render template: 'actividades/archivoAct/pdfInformeComision', 
                    pdf:'one',
                    header: {
                        margin: { top: 20, bottom:20 },
                        html: { template: 'layouts/cabeceraComision.html' },
                    },
                    page_size: 'Letter', 
                    margin: { left: 20, right: 20 }
                }
            end
        end
    end
    
    def docentes
        @actividad = Actividad.find(params[:id])
        respond_to do |format|
            format.html
            format.pdf {
                render template: 'actividades/depto_investigacion/pdfListaDocente', 
                pdf:'Lista_docente_actividad', page_size: 'Letter', 
                margin: { left: 25, right: 25, bottom: 25, top: 25 }
            }
			format.xlsx {
				render xlsx: 'docentes'#, filename: "/actividades/control_actividad_investigaciones.xlsx"
			}
        end
    end
    
    private
    
    def actividad_params
        params.require(:actividad).permit(:nombreActividad, :tipoComision, :tipoEvidencia, 
            :cat_tipo_actividad_id, :fechaInicio, :fechaTermino, :descripcion, :lugar, 
            :usuario_id, :proyecto_id, :hora, :tipoexamen, 
            actividad_docentes_attributes: [:id, :docente_id, :cat_tipo_participacion_id, :_destroy], 
            actualizacion_attributes: [:id, :tipoPeriodo, :tipoActualizacion, :modalidad, :horasCapacitacion, :_destroy, 
                    horario_actualizaciones_attributes: [:id, :dia, :hora_inicio, :hora_fin, :_destroy]] ,cat_viatico_ids:[])
    end
    
    def sort_column
        params[:sort] || "id"
    end
	
	def sort_column_fecha
		params[:sort] || "fechaTermino"
	end
    
    def sort_direction
        params[:direction] || "desc"
    end
end