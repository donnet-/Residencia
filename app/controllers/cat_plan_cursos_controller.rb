class CatPlanCursosController < ApplicationController
    helper_method :sort_column, :sort_direction
    before_action :authenticate_usuario!
    load_and_authorize_resource :except => :create
    
    def index
        @planCursos = CatPlanCurso.order(sort_column + ' ' + sort_direction).paginate( per_page: 10, page: params[:page])
    end
    
    def show
        @planCurso = CatPlanCurso.find(params[:id])
    end
    
    def new
        @planCurso = CatPlanCurso.new
        #1.times { @actividad.actividad_docentes.build }
        1.times { @planCurso.cat_materias.build }
    end
    
    def create
        @usuario = current_usuario
        @planCurso = CatPlanCurso.create(plancurso_params)
        
        if @planCurso.save
            redirect_to cat_plan_curso_path(@planCurso)
        else
            render :new
        end
    end
    
    def edit
        @planCurso = CatPlanCurso.find(params[:id])
    end
    
    def update
        @planCurso = CatPlanCurso.find(params[:id])
        
        if @planCurso.update(plancurso_params)
            redirect_to cat_plan_curso_path(@planCurso)#cat_plan_cursos_path
        else
            render :edit
        end
    end
    
    def destroy
        @planCurso = CatPlanCurso.find(params[:id])
        @planCurso.destroy
        redirect_to cat_plan_cursos_path
    end
    
    private 
    
    def plancurso_params
        params.require(:cat_plan_curso).permit(:descripcion, :estado, :user_id, cat_materias_attributes: [:id, :claveMateria, :nombreMat, :credito, :temario, :estado, :user_id, :_destroy])
    end
    
    def sort_column
        params[:sort] || "id"
    end
    
    def sort_direction
        params[:direction] || "desc"
    end
end