class PeriodoActividadAcademicasController < ApplicationController
    helper_method :sort_column, :sort_direction
    before_action :authenticate_usuario!
    load_and_authorize_resource :except => :create
    
    def index
        @periodo_actividades = PeriodoActividadAcademica.all.order(sort_column + ' ' + sort_direction).paginate(per_page: 10, page: params[:page])
		
		
    end
    
    def show
        @periodo_actividad = PeriodoActividadAcademica.find(params[:id])
        respond_to do |format|
            format.html
            format.pdf {
                render template: 'periodo_actividad_academicas/constancia', 
                pdf:'one', page_size: 'Letter', 
                margin: {left: 25, right: 25}, 
                font_name: 'Arial',
                header: { margin: { top: 25, bottom: 25 },
                            html: { template: 'layouts/cabeceraComision.html' },
                        },
                footer: { margin: { bottom: 25 },
                            html: { template: 'layouts/footerComision.html' }
                        }
            }
        end
    end
    
    def new
        @periodo_actividad = PeriodoActividadAcademica.new
        #1.times { @periodo_actividad.lib_actividad_docentes.build }
        1.times do
            lib_act_docente = @periodo_actividad.lib_actividad_docentes.build
                1.times { lib_act_docente.lib_doc_act_criterios.build }
        end
    end
    
    def create
        @periodo_actividad = PeriodoActividadAcademica.create(periodo_act_params)
        if @periodo_actividad.save
            redirect_to @periodo_actividad
        else
            render :new
        end
    end
    
    def edit
        @periodo_actividad = PeriodoActividadAcademica.find(params[:id])
    end
    
    def update
        @periodo_actividad = PeriodoActividadAcademica.find(params[:id])
        if @periodo_actividad.update(periodo_act_params)
            redirect_to @periodo_actividad
        else
            render :edit
        end
    end
    
    def destroy
    end
    
    private
    
    def periodo_act_params
        params.require(:periodo_actividad_academica).permit(:periodo, lib_actividad_docentes_attributes: [:id, :docente_id, :fecha, :_destroy, lib_doc_act_criterios_attributes: [:id, :criterio_id, :valor, :_destroy]])
    end
    
    def sort_column
        params[:sort] || "id"
    end
    
    def sort_direction
        params[:direction] || "desc"
    end
end