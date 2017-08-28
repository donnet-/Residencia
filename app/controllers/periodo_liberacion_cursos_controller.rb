class PeriodoLiberacionCursosController < ApplicationController
    helper_method :sort_column, :sort_direction
    before_action :authenticate_usuario!
    load_and_authorize_resource :except => :create
    
    def index
        @periodo_liberaciones = PeriodoLiberacionCurso.all.order(sort_column + ' ' + sort_direction).paginate(per_page: 10, page: params[:page])
    end
    
    def show
        @periodo_liberacion = PeriodoLiberacionCurso.find(params[:id])
        
        respond_to do |format|
            format.html
            format.pdf {
                render template: 'periodo_liberacion_cursos/liberacion', 
                pdf:'one', page_size: 'Letter', 
                margin: { left: 10, right: 10, bottom: 10},
                header: { margin: { top: 10, bottom: 10 },
                    html: { template: 'layouts/cabeceraLiberacionActDoc.html' },
                    },
                footer: { 
                    html: { template: 'layouts/footerLiberacionActDoc.html' }
                    }
            }
        end
    end
    
    def new
        total_docente = Docente.where(estado: 'Activo').length
        total_crit = CatCriterioEvaluacionDocente.where(estado: 'Activo').length
        @periodo_liberacion = PeriodoLiberacionCurso.new
        (total_docente).times do
            lib_curso_docente = @periodo_liberacion.lib_curso_docentes.build
            1.times { lib_curso_docente.lib_doc_criterios.build }
        end
    end
    
    def create
        @periodo_liberacion = PeriodoLiberacionCurso.create(periodo_lib_params)
        if @periodo_liberacion.save
            redirect_to @periodo_liberacion
        else
            render :new
        end
    end
    
    def edit
        @periodo_liberacion = PeriodoLiberacionCurso.find(params[:id])
    end
    
    def update
        @periodo_liberacion = PeriodoLiberacionCurso.find(params[:id])
        if @periodo_liberacion.update(periodo_lib_params)
            redirect_to @periodo_liberacion
        else
            render :edit
        end
    end
    
    def destroy
    end
    
    private
    
    def periodo_lib_params
        params.require(:periodo_liberacion_curso).permit(:periodo, :notaAbajo, :cabeceraPeriodo, lib_curso_docentes_attributes: [:id, :docente_id, :liberado, :fecha, :_destroy, lib_doc_criterios_attributes: [:id, :criterio_id, :respuesta, :_destroy]])
    end
    
    def sort_column
        params[:sort] || "id"
    end
    
    def sort_direction
        params[:direction] || "desc"
    end
end