class LiberacionCursosController < ApplicationController
    helper_method :sort_column, :sort_direction
    before_action :authenticate_usuario!
    load_and_authorize_resource :except => :create
    
    def index
        @liberaciones = LiberacionCurso.all.order(sort_column + ' ' + sort_direction).paginate(per_page: 10, page: params[:page])
    end
    
    def show
        @liberacion = LiberacionCurso.find(params[:id])
        respond_to do |format|
            format.html
            format.pdf {
                render template: 'liberacion_cursos/liberacion', 
                pdf:'one', page_size: 'Letter', 
                margin: { left: 25, right: 25, bottom: 25 },
                header: { margin: { top: 25, bottom: 25 },
                    html: { template: 'layouts/cabeceraComision.html' },
                    },
                footer: { 
                    html: { template: 'layouts/footerComision.html' }
                    }
            }
        end
    end
    
    def new
        @liberacion = LiberacionCurso.new
        #numD = Docente.all.count
        1.times { @liberacion.liberacio_docente_cursos.build }
    end
    
     def create
        @usuario = current_usuario
        @liberacion = LiberacionCurso.create(liberacion_params)
        if @liberacion.save
            redirect_to @liberacion
        else
            render :new
        end
    end
    
    def edit
        @liberacion = LiberacionCurso.find(params[:id])
    end
    
    def update
        @liberacion = LiberacionCurso.find(params[:id])
        
        if @liberacion.update(liberacion_params)
           redirect_to @liberacion
        else
            render :edit
        end
    end
    
    def destroy
        @liberacion = LiberacionCurso.find(params[:id])
        @liberacion.destroy
        
        redirect_to liberacion_cursos_path
    end
    
    private
    
    def liberacion_params
        params.require(:liberacion_curso).permit(:periodo, liberacio_docente_cursos_attributes: [:id, :docente_id, :fecha, :dosificacion, :instrumentacion, :cumplimiento, :calificacion, :reporteFinal, :apoyo, :liberacion, :jefeAcad, :subdirector, :_destroy])
    end
    
    def sort_column
        params[:sort] || "id"
    end
    
    def sort_direction
        params[:direction] || "desc"
    end
end