class ReunionesController < ApplicationController
    helper_method :sort_column, :sort_direction
    before_action :authenticate_usuario!
    load_and_authorize_resource :except => :create
    
    def index        
        @reuniones = Reunion.order(sort_column + ' ' + sort_direction).paginate( per_page: 10, page: params[:page])
    end
    
    def show
        @reunion = Reunion.find(params[:id])
        respond_to do |format|
            format.html
            format.pdf {render template: 'reuniones/anexoIII', pdf:'one', page_size: 'Letter', margin: {left: 25, right: 25}, font_name: 'Arial'}
        end
    end
    
    def new
        @reunion = Reunion.new
    end
    
    def create
        @usuario = current_usuario 
        @reunion = Reunion.create(reunion_params)
        
        if @reunion.save
            #Sólo docentes de base activos y del departamento
            @users = Docente.where(tipoDocente: "De Base", estado: "Activo", cat_departamento_id: 1)
            ModelMailer.notificaciones(@users, @reunion).deliver_now                            
            redirect_to reunion_path(@reunion)
        else
            render :new
        end
    end
    
    def edit
        @reunion = Reunion.find(params[:id])        
    end
    
    def update
        @reunion = Reunion.find(params[:id])
        if @reunion.update(reunion_params)
            redirect_to reunion_path(@reunion)
        else
            render :edit
        end
    end
    
    def destroy
        @reunion = Reunion.find(params[:id])
        @reunion.destroy
        redirect_to reunioines_path
    end
    
    ##---------------------------------CONSTANCIA---------------------------
    def oficio_constancias
        @reunion = Reunion.find(params[:id])
        respond_to do |format|
            format.html
            format.pdf {
                render template: 'reuniones/constancia',
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
    
    private
    
    def reunion_params
        params.require(:reunion).permit(:numActa, :fecha, :pdfActa, :estado, :usuario_id, :hora, anexos_attributes: [:id, :pdfAnexo, :fechaAnexo,  :proyecto_id, :_destroy, proyecto_estudiante_ids: [] ])
    end
    
    def sort_column
        params[:sort] || "id"
    end
    
    def sort_direction
        params[:direction] || "desc"
    end
end