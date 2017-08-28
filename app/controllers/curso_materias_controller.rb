class CursoMateriasController < ApplicationController
    helper_method :sort_column, :sort_direction
    before_action :authenticate_usuario!
    load_and_authorize_resource :except => :create
    
    #autocomplete :estudiante, :numControl, :display_value => :funky_method, :extra_data => [:nombre, :apPaterno, :apMaterno]
    
    #autocomplete :docente, :nombreD, :display_value => :method_info, :extra_data => [:nombreD, :apPaterno, :apMaterno]
    
    #autocomplete :cat_materia, :nombreMat, :display_value => :method_info_mat, :extra_data => [:claveMateria, :nombreMat, :cat_plan_curso_id]
    
    def index
        @cursos = CursoMateria.order(sort_column + ' ' + sort_direction).paginate( per_page: 10, page: params[:page])
        
        if current_usuario.rol == 'admin'
            if params[:search].present?
                busqueda = "%#{params[:search]}%"
                docent = Docente.find_by('nombreD LIKE ? OR apPaterno LIKE ? OR apMaterno LIKE ? OR curp LIKE ?', busqueda, busqueda, busqueda, busqueda)
                materi = CatMateria.find_by('nombreMat LIKE ? OR claveMateria LIKE ? ', busqueda, busqueda)
                if docent != nil
                    @cursos = @cursos.where('docente_id LIKE ?', "%#{docent.id}%")
                elsif materi != nil
                    @cursos = @cursos.where('cat_materia_id LIKE ?', "%#{materi.id}%")
                else
                   @cursos = CursoMateria.where('nombreGrupo LIKE ? OR aula LIKE ? OR periodo LIKE ?', busqueda, busqueda, busqueda).paginate(per_page: 10, page: params[:page])
                end
            end
        else
        end
    end  
    
    def show
        @curso = CursoMateria.find(params[:id])
    end
    
    def new
        @curso = CursoMateria.new
    end
    
    def create
        @usuario = current_usuario
        
        @curso = CursoMateria.create(curso_params)
        
        if @curso.save
            redirect_to curso_materias_path
        else
            render :new
        end
    end
    
    def edit
        @curso = CursoMateria.find(params[:id])
    end
    
    def update
        
        @curso = CursoMateria.find(params[:id])
        
        if @curso.update(curso_params)
            redirect_to curso_materia_path(@curso)
        else
            render :edit
        end
    end
    
    def destroy
        @curso = CursoMateria.find(params[:id])
        @curso.destroy
        redirect_to curso_materias_path
    end
    
    private
    
    def curso_params
        params.require(:curso_materia).permit(:nombreGrupo, :aula, :periodo, :docente_id, :cat_materia_id, :pdfInstrumentacion, curso_materia_estudiantes_attributes: [:id, :numControl, :_destroy])
    end
    
    def sort_column
        params[:sort] || "id"
    end
    
    def sort_direction
        params[:direction] || "desc"
    end
end