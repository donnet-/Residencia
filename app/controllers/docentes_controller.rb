class DocentesController < ApplicationController
    helper_method :sort_column, :sort_direction
    before_action :authenticate_usuario!
    load_and_authorize_resource :except => :create
    
    def index
        busqueda = "%#{params[:search]}%"
        
        @docentes = Docente.order(sort_column + ' ' + sort_direction).paginate( per_page: 10, page: params[:page])
        
        if params[:search].present?
            @tipoDpto = CatDepartamento.find_by(nombreDpto: params[:search])
            if @tipoDpto != nil
                @docentes = @docentes.where('cat_departamento_id LIKE ?', "%#{@tipoDpto.id}%")
            else
                @docentes = Docente.where("tipoDocente LIKE ? OR nombreD LIKE ? OR apPaterno LIKE ? OR apMaterno LIKE ? OR curp LIKE ? OR rfc LIKE ? OR clavePresupuestal LIKE ? OR genero LIKE ? OR email LIKE ? OR estado LIKE ?", busqueda, busqueda, busqueda, busqueda, busqueda, busqueda, busqueda, busqueda, busqueda, busqueda).paginate( per_page: 10, page: params[:page])
            end
        end
    end
    
    def show
        #@docente = Docente.find(params[:id])
		if current_usuario.rol == 'admin'
        	@docente = Docente.find(params[:id])
		else
        	@d = Docente.find(params[:id])
			if @d.email == current_usuario.email
				@docente = Docente.find(params[:id])
			else
				redirect_to root_path
				flash[:alert] = "No tienes acceso a esos datos."
			end
		end
    end
    
    def import
        #@docente = Docente.import(params[:file])
        #redirect_to docentes_path, notice: "Importados."
    end
    
    def new
        @docente = Docente.new
        1.times { @docente.grado_estudios.build }
        #1.times { @docente.archivo_docentes.build }
    end
    
    def create
        @docente =Docente.create(docente_params)
        if @docente.save
            redirect_to docente_path(@docente)
        else
            render :new
        end
    end
    
    def edit
        #@docente = Docente.find(params[:id])
		@d = Docente.find(params[:id])
		if @d.email == current_usuario.email
			@docente = Docente.find(params[:id])
		else
			redirect_to root_path
			flash[:alert] = "No tienes acceso a esos datos."
		end
    end
    
    def update
        @docente = Docente.find(params[:id])
        if @docente.update(docente_params)
			binding.pry
            #@usuario = Usuario.find(@docente.usuario_id)
            redirect_to docente_path(@docente)
        else
            render :edit
        end
    end
    
    private
    
    def docente_params
        params.require(:docente).permit(:curp, :rfc, :clavePresupuestal, :nombreD, :apPaterno, :apMaterno, :genero, :email, :cat_departamento_id, :tipoDocente, :usuario_id, :estado, :rol, :pdfCurriculum, :contacto, :tipoCurriculum, :numCurriculum, :sni, :prodep, grado_estudios_attributes: [:id, :nombreGrado, :cat_tipo_grado_estudio_id, :institucion, :pdfEvidencia, :abrev, :_destroy], archivo_docentes_attributes: [:id, :tipoArchivo, :etiqueta, :archivoPdf, :_destroy], archivo_prodep_docentes_attributes: [:id, :tipoArchivo, :etiqueta, :archivoPdf, :_destroy])
    end
    
    def sort_column
        params[:sort] || "id"
    end
    
    def sort_direction
        params[:direction] || "desc"
    end
end