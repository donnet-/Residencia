class VisitasController < ApplicationController
    #autocomplete :empresa, :nombreE, :display_value => :method_info_empresa, :extra_data => [:rfcEmpresa, :nombreE]
    helper_method :sort_column, :sort_direction
    before_action :authenticate_usuario!
    load_and_authorize_resource :except => :create
    
    def index
        @visitas = Visita.order(sort_column + ' ' + sort_direction).paginate( per_page: 10, page: params[:page])
    end
    
    def show
        @visita = Visita.find(params[:id])
        @actividad = Actividad.find(params[:actividad_id])
        respond_to do |format|                                                       
            format.html
            format.pdf {
                render template: 'archivos/perfilEgreso',
                       pdf:'Viaje',
                       header: {
                            margin: {
                                top: 25, 
                                bottom:20
                            },
                            html: {
                                template: 'layouts/header.html'
                            },
                        },
                        margin: {
                            left: 25,
                            right: 25
                       },                        
                       footer: { 
                            margin: {
                                top: 10, 
                                bottom:20
                            }, 
                            html: { 
                                template: 'layouts/footer.html'
                            }
                        }
            } 
        end
    end
    
    def new
        @actividad = Actividad.find(params[:actividad_id])
        @visita = @actividad.build_visita
    end
    
    def create
        @usuario = current_usuario
     
        @actividad = Actividad.find(params[:actividad_id])
        @visita = @actividad.create_visita(viaje_params)
        if @visita.save
            redirect_to actividad_visita_path(@actividad, @visita)
        else        
            redirect_to new_actividad_visita_path(@actividad)
        end
    end
    
    def edit
        @actividad = Actividad.find(params[:actividad_id])
        @visita = Visita.find(params[:id])
    end
    
    def update
        @visita = Visita.find(params[:id])
        @actividad = Actividad.find(@visita.actividad_id)
        
        if @visita.update(viaje_params)
            redirect_to edit_actividad_visita_path(@actividad, @visita)
        else
            redirect_to edit_actividad_visita_path(@actividad, @visita)
        end
    end
    
    def informe
        @visita = Visita.find(params[:id])
        @actividad = Actividad.find(params[:actividad_id])
        respond_to do |format|
            format.html
            format.pdf {
                render template: 'archivos/informe', 
                pdf:'Reporte', 
                viewport_size: '1280x1024',
                header: {
                            margin: {
                                top: 20, 
                                bottom:20
                            },
                            html: {
                                template: 'layouts/cabeceraInforme.html'
                            },
                        },
                margin: {
                    left: 25,
                    right: 25
                }

            } 
        end       
    end
    
    private
    
    def viaje_params
        params.require(:visita).permit(:asunto, :estado, :objetivo, :actividades,   viaje_itinerario_empresas_attributes: [:id, :curpEmpresa, :fecha, :hora, :_destroy])
    end
    
    def sort_column
        params[:sort] || "id"
    end
    
    def sort_direction
        params[:direction] || "desc"
    end
end