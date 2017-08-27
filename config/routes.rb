Rails.application.routes.draw do
  
  get 'estudiantes/import'

  get 'docentes/import'

  get 'curso_materia_estudiantes/index'

  get 'curso_materia_estudiantes/import'

  get 'oficios/index'

  root 'siged#index'

  devise_for :usuarios, controllers: {registrations: 'registrations', sessions: "usuarios/sessions" }
  devise_scope :usuario do 
    match 'active'            => 'usuarios/sessions#active',               via: :get  
    match 'timeout'           => 'usuarios/sessions#timeout',              via: :get  
  end
	
  resources :oficios
  resources :firmas
  resources :cat_evidencia_periodos
  resources :examen_profesionales
  resources :puestos
  resources :cat_evidencias do
        resources :requisito_evidencias
    end
    resources :estudiantes do
      resources :servicio_sociales do
          get :autocomplete_empresa_nombreE, :on => :collection
      end
    end
    resources :servicio_sociales do
        get :aceptacion, :on => :member
    end
    resources :cat_viaticos
    
    resources :cat_tipo_actividades
    
    resources :cat_tipo_puestos
    
    resources :cat_departamentos
    
    resources :cat_tipo_grado_estudios
    
    resources :cat_plan_cursos
    
    resources :cat_tipo_examen_proyectos
    
    resources :cat_especialidades
    
    resources :cat_tipo_participaciones
    
    resources :empresas
    
    resources :cat_materias
    
    resources :docentes do
        resources :convenio_honorarios
        resources :puestos
		collection { post :import }
    end
    
    resources :grado_estudios
    
    resources :estudiantes do
        collection { post :import }
    end
    
    resources :curso_materias do
        resources :estadisticas
    end
    
    resources :actividad_docentes do
      resources :act_individual_docentes
    end
    
	get 'actividades/mapa', as: 'mapa'
	get 'actividades/mapa_descripcion', as: 'mapa_descripcion'
	#get 'control_investigaciones' => 'actividades_control_actividad_investigaciones#control_investigaciones', format: 'docx' #added format
	
    resources :actividades do
		
        get :orden_ministracion_viaticos, :on => :member
        get :orden_servicio_pasajes, :on => :member
        get :liquidacion_de_viaticos, :on => :member
        get :informe_comisiones, :on => :member
        get :docentes, :on => :member
		#get :control_investigaciones. format: 'docx'
		get :mapa, :on => :member 
		get :mapa_descripcion, :on => :member 
        collection do
            get :actividades_recientes
            get :docente_actividades
            get :docente_actividad_recientes
            get :docente_actividad_pendientes
			get :control_actividad_investigaciones #, format: 'docx'	 
        end
        
        resources :actividad_docentes do 
            get :autocomplete_docente_nombreD, :on => :collection
            resources :act_individual_docentes
        end
        resources :actividad_evidencias
        resources :actividad_cat_viaticos
        
        resources :actualizacion_docente_profesionales  do
            get :orden_ministracion_viaticos, :on => :member
            get :orden_servicio_pasajes, :on => :member
            get :liquidacion_de_viaticos, :on => :member
            get :informe_comisiones, :on => :member
        end
        
        resources :visitas do
            get :autocomplete_empresa_nombreE, :on => :collection
            get :informe, on: :member
        end
        resources :viaje_grupos
        
        resources :actividad_complementarias do 
            get :autocomplete_estudiante_numControl, :on => :collection
            resources :grupo_act_complementarias do
                collection { post :import}
            end
        end
        
        resources :examen_profesionales do
          get :autocomplete_estudiante_numControl, :on => :collection
        end
        
        resources :modulo_diplomados
    end
    
    resources :actividad_complementarias do
        resources :grupo_act_complementarias do
                collection { post :import}
            end
    end
    resources :grupo_act_complementarias 
    resources :proyectos
    
    resources :visitas
    resources :viaje_itinerario_empresas
    
    resources :reuniones do
        resources :anexos 
        get :oficio_constancias, on: :member
    end
    
    resources :liberacion_cursos do
        resources :liberacio_docente_cursos
    end

    resources :configuraciones
    
    resources :periodo_liberacion_cursos
    resources :cat_criterio_evaluacion_docentes
    resources :cat_criterio_academias
    resources :periodo_actividad_academicas
    resources :constancia_dpto_investigaciones
    
    resources :periodo_curs_materias do
        resources :curso_materias
        resources :archivo_periodos
        resources :materia_evidencias
        resources :curso_evidencias
        resources :estadisticas
        get :estadistica, :on => :member
    end
    
    resources :proyecto_investigaciones do
        get :autocomplete_estudiante_numControl, :on => :collection
    collection do
            get :todos
        end
    end
    
    resources :proyectos do
        get :autocomplete_estudiante_numControl, :on => :collection
        get :autocomplete_empresa_nombreE, :on => :collection
        get :oficio_revisores, :on => :member
        get :oficio_liberaciones, :on => :member
    end
    
    resources :estadisticas
    resources :archivo_periodos
    resources :materia_evidencias
    resources :curso_evidencias
    resources :periodos
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
