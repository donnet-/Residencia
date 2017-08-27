class OficiosController < ApplicationController
	helper_method :sort_column, :sort_direction
    before_action :authenticate_usuario!
    load_and_authorize_resource :except => :create
	
	def index 
		@oficios = Oficio.all.order(sort_column + ' ' + sort_direction).paginate( per_page: 10, page: params[:page])
		
		if params[:search].present?
			busqueda = "%#{params[:search]}%"
			@tipoAct = CatTipoActividad.find_by('nombreTipoAct LIKE ?', "%#{params[:search]}%")
			@tipoPro = CatTipoExamenProyecto.find_by('nombreTipoP LIKE ?', "{params[:search]}%")
			@doc = Docente.where('rfc LIKE ? OR nombreD LIKE ? OR apPaterno LIKE ? OR apMaterno LIKE ?', busqueda, busqueda, busqueda, busqueda)
			@est = Estudiante.where('numControl LIKE ? OR nombre LIKE ? OR apPaterno LIKE ? OR apMaterno LIKE ?', busqueda, busqueda, busqueda, busqueda)
			if @tipoAct != nil
				@act = Actividad.where(cat_tipo_actividad_id:  @tipoAct.id).order(sort_column + ' ' + sort_direction)
				@o = []
				for acti in @act
					for ofi in @oficios
						if ofi.actividad_id == acti.id && acti.cat_tipo_actividad_id == @tipoAct.id
							 @o.push(ofi)
						end
					end
				end
				@oficios = @o.paginate(per_page: 10, page: params[:page])
			elsif @tipoPro != nil
				@pro = Proyecto.where(cat_tipo_examen_proyecto_id:  @tipoPro.id).order(sort_column + ' ' + sort_direction)
				@p = []
				for proy in @pro
					for ofi in @oficios
						if ofi.proyecto_id == proy.id && proy.cat_tipo_examen_proyecto_id == @tipoPro.id
							 @p.push(ofi)
						end
					end
				end
				@oficios = @p.paginate(per_page: 10, page: params[:page])
			elsif busqueda == '%anexo%' || busqueda == '%Anexo%' || busqueda == '%anexo III%' || busqueda == '%Anexo III%' || @tipoPro != nil
				@tipoPro = CatTipoExamenProyecto.find_by('nombreTipoP LIKE ?', 'Residencia Profesional')
				if @tipoPro != nil
					@pro = Proyecto.where(cat_tipo_examen_proyecto_id:  @tipoPro.id).order(sort_column + ' ' + sort_direction)
					@p = []
					for proy in @pro
						for ofi in @oficios
							if ofi.proyecto_id == proy.id && proy.cat_tipo_examen_proyecto_id == @tipoPro.id
								 @p.push(ofi)
							end
						end
					end
					@oficios = @p.paginate(per_page: 10, page: params[:page])
				end
			elsif @doc != []
				@docent = []
				for d in @doc
					for ofi in @oficios
						if ofi.docente == d.id
							@docent.push(ofi)
						end
					end
				end
				@oficios = @docent.paginate(per_page: 10, page: params[:page])
			elsif @est != []
				@estud = []
				for d in @est
					for ofi in @oficios
						if ofi.numControil == d.numControl
							@estud.push(ofi)
						end
					end
				end
				@oficios = @estud.paginate(per_page: 10, page: params[:page])
			else
				@oficios = Oficio.where('numero LIKE ? OR anio LIKE ? ', busqueda, busqueda).order(sort_column + ' ' + sort_direction).paginate( per_page: 10, page: params[:page])
			end
		end
	end
	
	def new
		@oficio = Oficio.new
		1.times { @oficio.oficio_externos.build }
	end
	
	def create 
		@oficio = Oficio.create(oficio_params)
		if @oficio.save 
			redirect_to oficios_index_path
		else
			render :new
		end
	end
	
	private
	def oficio_params
        params.require(:oficio).permit(:numero, :anio, oficio_externos_attributes: [:id, :etiqueta, :pdf_oficio, :_destroy])
    end
	
	private
	
	def sort_column
        params[:sort] || "id"
    end
    
    def sort_direction
        params[:direction] || "desc"
    end
end
