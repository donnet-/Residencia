class PeriodoCursMateriasController < ApplicationController
    helper_method :sort_column, :sort_direction
    before_action :authenticate_usuario!
    load_and_authorize_resource :except => :create
    
    def index
        @curso_materias = PeriodoCursMateria.order(sort_column + ' ' + sort_direction).paginate( per_page: 10, page: params[:page])
        
        if current_usuario.rol == 'admin'
            if params[:periodo].present? && params[:anio].present?
                p = params[:periodo]+params[:anio]
                @curso_materias = PeriodoCursMateria.where('periodo LIKE ?', p).paginate(per_page: 10, page: params[:page])
            elsif params[:anio].present?
                @curso_materias = PeriodoCursMateria.where('periodo LIKE ?', "%#{params[:anio]}%").paginate(per_page: 10, page: params[:page])
            end
        else
            x  = Docente.find_by(email: current_usuario.email)
            if params[:periodo] != nil                 
                pe = params[:periodo] 
                pe = pe + params[:anio]
                @curso_materia = PeriodoCursMateria.find_by(docente_id: x.id, periodo: pe)
                if @curso_materia != nil
                    @grupos = CursoMateria.where(periodo_curs_materia_id: @curso_materia.id)
                else
                    @grupos = []
                end
            else
               @curso_materia = PeriodoCursMateria.where(docente_id: x.id).last
               if @curso_materia != nil
                    @grupos = CursoMateria.where(periodo_curs_materia_id: @curso_materia.id)
                else
                    @grupos = []
                end
            end
        end        
    end 
    
    def show
        @curso_materia = PeriodoCursMateria.find(params[:id])
        respond_to do |format|
                    format.html
                    format.pdf {
                        render template: 'periodo_curs_materias/estadistica', 
                        pdf:'one', page_size: 'Letter', 
                        margin: { left: 25, right: 25, bottom: 25 } 
                        }                           
        end
    end
    
    def new
        @curso_materia = PeriodoCursMateria.new
        1.times { @curso_materia.curso_materias.build }
    end
    
    def create
        @usuario = current_usuario
        
        @curso_materia = PeriodoCursMateria.create(curso_params)
        if @curso_materia.save
            redirect_to periodo_curs_materia_path(@curso_materia)
        else
            render :new
        end
    end
    
    def edit
        @curso_materia = PeriodoCursMateria.find(params[:id])
    end
    
    def update

        comparacion = curso_params[:curso_materias_attributes]        
        comparacion.each do |c|             
            y = CursoMateria.find(c[1][:id])
            if y != nil
                if c[1][:total].to_i != y.total                    
                    x = Estadistica.find_by(curso_materia_id: c[1][:id])
                    if x != nil
                        x.destroy
                    end
                end
            end
        end
        
        @curso_materia = PeriodoCursMateria.find(params[:id])
        
        if @curso_materia.update(curso_params)
            redirect_to periodo_curs_materia_path(@curso_materia)
        else
            render :edit
        end


    end
    
    def destroy
        @curso_materia = PeriodoCursMateria.find(params[:id])
        @curso_materia.destroy
        redirect_to periodo_curs_materias_path
    end
    
    private
    
    def curso_params
       params.require(:periodo_curs_materia).permit(:periodo, :docente_id, 
            curso_materias_attributes: [:id, :nombreGrupo, :aula, :cat_materia_id, :total, :_destroy])
    end
    
    def sort_column
        params[:sort] || "id"
    end
    
    def sort_direction
        params[:direction] || "desc"
    end
end