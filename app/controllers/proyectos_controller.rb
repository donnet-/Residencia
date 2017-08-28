class ProyectosController < ApplicationController
   	helper_method :sort_column, :sort_direction
    before_action :authenticate_usuario!
    load_and_authorize_resource :except => :create
    #autocomplete :estudiante, :numControl, :display_value => :funky_method, :extra_data => [:nombre, :apPaterno, :apMaterno]
    #autocomplete :empresa, :nombreE, :display_value => :nombreE, :extra_data => [:nombreE]
    
    def index
		t = Time.now
		@anio = t.strftime("%Y")
		@mes = t.strftime("%m").to_i
		if @mes <= 7
			@periodo = 'FEBRERO-JUNIO/'+@anio.to_s
		else
			@periodo = 'AGOSTO-DICIEMBRE/'+@anio.to_s
		end
		
        #@proyectos = Proyecto.where('periodo LIKE ? ', @periodo).order(sort_column + ' ' + sort_direction).paginate( per_page: 10, page: params[:page])
		
		@proyectos = Proyecto.where(status: 'En proceso').order(sort_column + ' ' + sort_direction).paginate( per_page: 10, page: params[:page])
        
        if params[:search].present?
            busqueda = "%#{params[:search]}%"
            docent = Docente.find_by('nombreD LIKE ? OR apPaterno LIKE ? OR apMaterno LIKE ?', busqueda, busqueda, busqueda)
            tipoP = CatTipoExamenProyecto.find_by('nombreTipoP LIKE ? ', busqueda)
            if docent != nil
                @proyectos = @proyectos.where('asesorInterno LIKE ?', "%#{docent.id}%")
            elsif tipoP != nil
                @proyectos = @proyectos.where('cat_tipo_examen_proyecto_id LIKE ?', "%#{tipoP.id}%")
            else
               @proyectos = Proyecto.where('numProyecto LIKE ? OR nombreProyecto LIKE ? OR fechaInicio LIKE ? OR fechaTermino LIKE ? OR asesorExterno LIKE ? OR rfcEmpresa LIKE ? OR status LIKE ? ', busqueda, busqueda, busqueda, busqueda, busqueda, busqueda, busqueda).paginate(per_page: 10, page: params[:page])
            end
        end
		if params[:periodo].present? && params[:anio].present?
        	p = params[:periodo]+'/'+params[:anio]
            @proyectos = Proyecto.where('periodo LIKE ?', p).order(sort_column + ' ' + sort_direction).paginate( per_page: 10, page: params[:page])
        elsif params[:anio].present?
            @proyectos = Proyecto.where('periodo LIKE ? ', "%#{params[:anio]}%").order(sort_column + ' ' + sort_direction).paginate( per_page: 10, page: params[:page])
       	end
    end 

    def new
        @proyecto = Proyecto.new
        1.times {@proyecto.proyecto_estudiantes.build }
        1.times do
            docente = @proyecto.proyecto_docentes.build 
                docente.proyecto_docente_evidencias.build 
        end
    end

    def create
        @usuario = current_usuario
        
        @proyecto = Proyecto.create(proyecto_params)
        if @proyecto.save
            redirect_to proyecto_path(@proyecto)
        else 
            render :new
        end
    end

    def show
        @proyecto = Proyecto.find(params[:id])
        respond_to do |format|
            format.html
            format.pdf {
                render template: 'proyectos/oficios/pdfAsesorInterno', 
                pdf:'one', page_size: 'Letter', 
                margin: { left: 25, right: 25, bottom: 25 },
                header: { margin: { top: 25, bottom: 25 },
                    html: { template: 'layouts/cabeceraComision.html' },
                },
                footer: { html: { template: 'layouts/footerComision.html' } }
            }
        end
    end

    def edit
        @proyecto = Proyecto.find(params[:id])
    end

    def update      
        @proyecto = Proyecto.find(params[:id])
        if @proyecto.update(proyecto_params)
            redirect_to proyecto_path(@proyecto)
        else
            render :edit
        end     
    end
    
    #-------------------------------Oficios--------------------------------------
    def oficio_revisores
        @proyecto = Proyecto.find_by(params[:id])
        respond_to do |format|
            format.html
            format.pdf {
                render template: 'proyectos/oficios/pdfRevisor', 
                pdf:'one', page_size: 'Letter', 
                margin: { left: 25, right: 25, bottom: 25 },
                header: { margin: { top: 25, bottom: 25 },
                    html: { template: 'layouts/cabeceraComision.html' },
                },
                footer: { html: { template: 'layouts/footerComision.html' } }
            }
        end
    end
    
    def oficio_liberaciones
        @proyecto = Proyecto.find_by(params[:id])
        respond_to do |format|
            format.html
            format.pdf {
                render template: 'proyectos/oficios/pdfLiberacion', 
                pdf:'one', page_size: 'Letter', 
                margin: { left: 25, right: 25, bottom: 25 },
                header: { margin: { top: 25, bottom: 25 },
                    html: { template: 'layouts/cabeceraComision.html' },
                },
                footer: { html: { template: 'layouts/footerComision.html' } }
            }
        end
    end

    private
    def proyecto_params
        params.require(:proyecto).permit(:nombreProyecto, :numProyecto, :status, :asesorExterno, :usuario_id, :cat_tipo_examen_proyecto_id, :fechaInicio, :fechaTermino, :periodo, :descripcion, :rfcEmpresa,   proyecto_estudiantes_attributes: [:id, :numControl, :_destroy], proyecto_docentes_attributes: [:id, :docente_id, :cat_tipo_participacion_id, :_destroy, proyecto_docente_evidencias_attributes: [:id, :etiqueta, :pdfEvidencia, :_destroy]])    
    end
    
    def sort_column
        params[:sort] || "id"
    end
    
    def sort_direction
        params[:direction] || "desc"
    end
end
