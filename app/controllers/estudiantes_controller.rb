class EstudiantesController < ApplicationController
    helper_method :sort_column, :sort_direction
    before_action :authenticate_usuario!
    load_and_authorize_resource :except => :create
    
    def index
        busqueda = "%#{params[:search]}%"
        @estudiantes = Estudiante.all.order(sort_column + ' ' + sort_direction).paginate(per_page: 10, page: params[:page])
        
        if params[:search].present?
            @estudiantes = Estudiante.where('curpEstudiante LIKE ? OR numControl LIKE ? OR nombre LIKE ? OR apPaterno LIKE ? OR apMaterno LIKE ? OR genero LIKE ? OR estado LIKE ? OR email LIKE ?', busqueda, busqueda, busqueda, busqueda, busqueda, busqueda, busqueda, busqueda).paginate(per_page: 10, page: params[:page])
        end
    end
    
    def import
        Estudiante.import(params[:file])
        redirect_to estudiantes_path, notice: "Lista de estudiantes importados!"
    end
    
    def show
		if current_usuario.rol == 'admin'
        	@estudiante = Estudiante.find(params[:id])
		else
        	@e = Estudiante.find(params[:id])
						
			if @e.email == current_usuario.email
				@estudiante = Estudiante.find(params[:id])
			else
				redirect_to root_path
				flash[:alert] = "No tienes acceso a esos datos."
			end
		end
    end
    
    def new
        #@usuario = Usuario.find(params[:usuario_id])
        #@estudiante = @usuario.build_estudiante
        @estudiante = Estudiante.new
    end
    
    def create
        @usuario = current_usuario
        
        #@usuario = Usuario.find(params[:usuario_id])
        #@estudiante = @usuario.create_estudiante(estudiante_params)
        #redirect_to usuario_estudiante_path(@usuario, @estudiante)
        @estudiante = Estudiante.create(estudiante_params)
		
        if @estudiante.save
            redirect_to estudiante_path(@estudiante)
        else
            render :new
        end
    end
    
    def edit
        #@estudiante = Estudiante.find(params[:id])
		@e = Estudiante.find(params[:id])
		if @e.email == current_usuario.email
			@estudiante = Estudiante.find(params[:id])
		else
			redirect_to root_path
			flash[:alert] = "No tienes acceso a esos datos."
		end
    end
    
    def update
        @estudiante = Estudiante.find(params[:id])
        
        if @estudiante.update(estudiante_params)
            redirect_to @estudiante
        else
            render :edit
        end
    end
    
    def  edita_multiple
      if params[:estudiantes_ids] != nil
        @estudiantes = Estudiante.find(params[:estudiantes_ids])
      else
        redirect_to estudiantes_path   
      end
    end
      
    def  update_multiple
      @estudiantes = Estudiante.find(params[:estudiantes_ids])
      @estudinates.each do |est|
        est.update_attributes!(params[:estudiante].reject { |k,v| v.blank? })
      end
      flash[:notice] = "Updated products!"
      redirect_to estudiantes_path
    end

    private
    
    def estudiante_params
        params.require(:estudiante).permit(:curpEstudiante, :numControl, :nombre, :apPaterno, :apMaterno, :genero, :email, :cat_especialidad_id, :estado, :usuario_id, :rol, :email_adicional, :contacto)
    end
    
    def sort_column
        params[:sort] || "id"
    end
    
    def sort_direction
        params[:direction] || "desc"
    end
end