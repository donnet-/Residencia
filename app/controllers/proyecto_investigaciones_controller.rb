class ProyectoInvestigacionesController < ApplicationController
   helper_method :sort_column, :sort_direction
    before_action :authenticate_usuario!
    load_and_authorize_resource :except => :create
    #autocomplete :estudiante, :numControl, :display_value => :funky_method, :extra_data => [:nombre, :apPaterno, :apMaterno]
    
    def index
        @investigaciones = ProyectoInvestigacion.all.order(sort_column + ' ' + sort_direction).paginate(per_page: 10, page: params[:page])
        
        if params[:search].present?
            busqueda = "%#{params[:search]}%"
            docent = Docente.find_by('nombreD LIKE ? OR apPaterno LIKE ? OR apMaterno LIKE ?', busqueda, busqueda, busqueda)
            tipoP = CatTipoExamenProyecto.find_by('nombreTipoP LIKE ? ', busqueda)
            if docent != nil
                @investigaciones = @investigaciones.where('asesorInterno LIKE ?', "%#{docent.id}%")
            elsif tipoP != nil
                @investigaciones = @investigaciones.where('cat_tipo_examen_proyecto_id LIKE ?', "%#{tipoP.id}%")
            else
               @investigaciones = ProyectoInvestigacion.where('status LIKE ? OR numProyecto LIKE ? OR nombreProy LIKE ? OR fechaInicio LIKE ? OR fechaTermino LIKE ? ', busqueda, busqueda, busqueda, busqueda, busqueda).paginate(per_page: 10, page: params[:page])
            end
        end
		if params[:periodo].present? && params[:anio].present?
                p = params[:periodo]
                mes1 = (params[:anio].to_i-1).to_s+'-'+p.split[0]
                mes2 = params[:anio]+'-'+p.split[2]
          
                @investigaciones = @investigaciones.where('fechaInicio > ? AND fechaTermino < ?', mes1, mes2).paginate(per_page: 10, page: params[:page])
        elsif params[:anio].present?
                @investigaciones = @investigaciones.where('fechaInicio LIKE ? OR fechaTermino LIKE ?', "%#{params[:anio]}%", "%#{params[:anio]}%").paginate(per_page: 10, page: params[:page])
       	end
    end
    
    def show
        @investigacion = ProyectoInvestigacion.find(params[:id])
    end
    
    def new
        @investigacion = ProyectoInvestigacion.new
        @investigacion.proy_inv_documentos.build 
        @investigacion.proy_inv_docentes.build 
        @investigacion.proyecto_inv_estudiantes.build
    end 
    
    def create
        @investigacion = ProyectoInvestigacion.create(investigacion_params)
        
        if @investigacion.save
            redirect_to proyecto_investigacion_path(@investigacion)
        else
            render :new
        end
    end
    
    def edit
        @investigacion = ProyectoInvestigacion.find(params[:id])
    end
    
    def update
        @investigacion = ProyectoInvestigacion.find(params[:id])
        if @investigacion.update(investigacion_params)
            redirect_to proyecto_investigacion_path(@investigacion)
        else
            render :edit
        end
    end
    
    def destroy
        @investigacion = ProyectoInvestigacion.find(params[:id])
        @investigacion.destroy
        redirect_to proyecto_investigaciones_path
    end
	
    def todos
        @todos = ProyectoInvestigacion.all.order(sort_column + ' ' + sort_direction).paginate(per_page: 10, page: params[:page])
        
        if params[:search].present?
            busqueda = "%#{params[:search]}%"
            docent = Docente.find_by('nombreD LIKE ? OR apPaterno LIKE ? OR apMaterno LIKE ?', busqueda, busqueda, busqueda)
            tipoP = CatTipoExamenProyecto.find_by('nombreTipoP LIKE ? ', busqueda)
            if docent != nil
                @todos = @todos.where('asesorExterno LIKE ?', "%#{docent.id}%")
            elsif tipoP != nil
                @todos = @todos.where('cat_tipo_examen_proyecto_id LIKE ?', "%#{tipoP.id}%")
            else
               @todos = ProyectoInvestigacion.where('status LIKE ? OR numProyecto LIKE ? OR nombreProy LIKE ? OR fechaInicio LIKE ? OR fechaTermino LIKE ? ', busqueda, busqueda, busqueda, busqueda, busqueda).paginate(per_page: 10, page: params[:page])
				#('numProyecto LIKE ? OR nombreProy LIKE ? OR fechaInicio LIKE ? OR fechaTermino ? OR asesorExterno LIKE ? OR status LIKE ?', busqueda, busqueda, busqueda, busqueda, busqueda, busqueda).paginate(per_page: 10, page: params[:page])
            end
        end
		if params[:periodo].present? && params[:anio].present?
        	p = params[:periodo]
                mes1 = (params[:anio].to_i-1).to_s+'-'+p.split[0]
                mes2 = params[:anio]+'-'+p.split[2]
                
            @todos = ProyectoInvestigacion.where('fechaInicio > ? AND fechaTermino < ?', mes1, mes2).paginate(per_page: 10, page: params[:page])
        elsif params[:anio].present?
            @todos = ProyectoInvestigacion.where('fechaInicio LIKE ? OR fechaTermino LIKE ?', "%#{params[:anio]}%", "%#{params[:anio]}%").paginate(per_page: 10, page: params[:page])
       	end
    end
    
    private
    
    def investigacion_params
        params.require(:proyecto_investigacion).permit(:numProyecto, :nombreProy, :cat_tipo_examen_proyecto_id, :asesorExterno, :fechaInicio, :fechaTermino, :status, proy_inv_documentos_attributes: [:id, :descripcion, :documento, :fechaPublicacion, :_destroy], proyecto_inv_estudiantes_attributes: [:id, :numControl, :_destroy], proy_inv_docentes_attributes: [ :id, :docente_id, :_destroy])
    end
    
    def sort_column
        params[:sort] || "id"
    end
    
    def sort_direction
        params[:direction] || "desc"
    end
end