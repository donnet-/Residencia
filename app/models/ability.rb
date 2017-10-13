class Ability
  include CanCan::Ability
  
  def initialize(usuario)
    if usuario.rol == 'admin'
      can :manage, :all
      can :read, ActIndividualDocente
      can :read, CursoMateria
      can :read, CursoMateriaEstudiante
      can :read, ServicioSocial
      can :read, :create, Docente
      can [:read,:create,:update,:import,:destroy,:update_multiple], Estudiante
      can [:read], PeriodoCursMateria
      can [:read], PeriodoLiberacionCurso
      cannot [:destroy], CatCriterioEvaluacionDocente
      cannot [:update], Docente
      #cannot [:update], Estudiante
      cannot [:create, :update], CursoMateria
      cannot [:create, :update, :destroy], PeriodoCursMateria
      cannot [:create, :update], CursoMateriaEstudiante
      cannot [:create, :update], ServicioSocial
      cannot [:create, :destroy, :update], CatCriterioAcademia
      cannot [:create, :update, :destroy], PeriodoActividadAcademica
      cannot [:create, :update, :destroy], ActividadEvidencia
      cannot [:create, :update, :destroy], ActIndividualDocente
      cannot [:create, :update, :destroy], ConvenioHonorario
      cannot [:create, :update, :destroy], CursoMateriaEstudiante
      cannot [:create, :update, :destroy], CursoMateria
      cannot [:create, :update, :destroy], GradoEstudio
      cannot [:create, :update, :destroy], ServicioSocial
      cannot [:create, :update, :destroy], ViajeGrupo
      cannot [:create, :update, :destroy], ViajeItinerarioEmpresa
      #cannot [:destroy], ActividadCatViatico
      cannot [:destroy], ActividadDocente
      cannot [:destroy], Anexo
      cannot [:destroy], CatDepartamento
      cannot [:destroy], CatEspecialidad
      cannot [:destroy], CatEvidencia
      #cannot [:destroy], CatEvidenciaTipoActividad
      cannot [:destroy], CatMateria
      cannot [:destroy], CatPlanCurso
      cannot [:destroy], CatTipoActividad
      cannot [:destroy], CatMateria
      cannot [:destroy], CatPlanCurso
      cannot [:destroy], CatTipoActividad
      #cannot [:destroy], CatTipoActividadParticipacion
      cannot [:destroy], CatTipoExamenProyecto
      cannot [:destroy], CatTipoGradoEstudio
      cannot [:destroy], CatTipoParticipacion
      cannot [:destroy], CatTipoPuesto
      cannot [:destroy], CatViatico
      cannot [:destroy], Configuracion
      cannot [:destroy], Empresa
      cannot [:destroy], ModuloDiplomado
      cannot [:destroy], Puesto
      cannot [:destroy], RequisitoEvidencia
      cannot [:destroy], Visita          
      cannot [:create, :update, :destroy], Proyecto
      cannot [:create, :update, :destroy], ProyectoInvestigacion
    elsif usuario.rol == 'docente'
      @docent = Docente.find_by(email: usuario.email)
      if @docent.email == usuario.email
        can [:docente_actividades, :docente_actividad_recientes, :docente_actividad_pendientes, :read], Actividad
        can :read, ActividadDocente
        can :read, Estudiante
        can :read, Puesto
        can :read, Visita
        can :read, Proyecto
        can :read, ProyectoInvestigacion
        can [:read, :update], Docente
        can [:read, :update], Solicitud
        can [:update], ProyectoDocenteEvidencia
        can [:update], Proyecto
        can [:update], ProyectoDocente
        can [:update], ProyInvDocumento
        can [:update], ProyectoInvestigacion
        can [:create, :read, :update], ActIndividualDocente
        can [:create, :read, :update], ActividadEvidencia
        can [:create, :read, :update], ConvenioHonorario
        can [:create, :read, :update], CursoMateriaEstudiante
        can [:create, :read, :update], CursoMateria
        can [:create, :read, :update], PeriodoCursMateria
        can [:create, :read, :update], GradoEstudio
        can [:create, :read, :update], ViajeGrupo
        can [:create, :read, :update], ViajeItinerarioEmpresa
        can [:create, :read, :update, :import, :destroy], CursoMateriaEstudiante
        cannot [:create, :destroy], Docente
        cannot [:create, :update, :destroy], Actividad
        cannot [:create, :update, :destroy], ActividadDocente
        cannot [:create, :update, :destroy], Estudiante
        cannot [:create, :update, :destroy], Puesto
        cannot [:create, :update, :destroy], Visita
        cannot [:destroy], ActIndividualDocente
        cannot [:destroy], ActividadEvidencia
        cannot [:destroy], ConvenioHonorario
        cannot [:destroy], CursoMateriaEstudiante
        cannot [:destroy], PeriodoCursMateria
        cannot [:destroy], CursoMateria
        cannot [:destroy], GradoEstudio
        cannot [:destroy], ViajeGrupo
        cannot [:destroy], ViajeItinerarioEmpresa
      end
      @docent = Docente.find_by(email: usuario.email)
      @puest = Puesto.where(docente_id: @docent.id)
      if @puest != []
        for puesto in @puest
          if puesto.estado == 'Activo'
            @tipoP = CatTipoPuesto.find(puesto.cat_tipo_puesto_id)
              if @tipoP.nombrePuesto == 'Secretario de academia' || @tipoP.nombrePuesto == 'Presidente de Academia'
              can [:create, :read, :update], Anexo
              can [:create, :read, :update], Reunion
              can [:create, :read, :update], PeriodoActividadAcademica
              can [:create, :read, :update], CatCriterioAcademia
              cannot [:destroy], Anexo
              cannot [:destroy], Reunion
                          elsif @tipoP.nombrePuesto == 'Jefe de Proyecto de Docencia'
              can [:read], CatCriterioEvaluacionDocente 
              can [:create, :update, :read], PeriodoLiberacionCurso
              can :read, CursoMateriaEstudiante
              can :read, CursoMateria
                cannot [:create, :update, :destroy], CursoMateriaEstudiante
                cannot [:create, :update, :destroy], CursoMateria

              elsif @tipoP.nombrePuesto == 'Jefe de la Oficina de Vinculación de Sistemas'
              can [:read], ServicioSocial 
                cannot [:create, :update, :destroy], CursoMateriaEstudiante
                cannot [:create, :update, :destroy], CursoMateria

              elsif @tipoP.nombrePuesto == 'Jefe de la Oficina de Investgacion'
                can [:todos], ProyectoInvestigacion
                can [:create, :read, :update], ProyectoInvestigacion
                can [:control_actividad_investigaciones, :docentes], Actividad
              elsif @tipoP.nombrePuesto == 'Jefe de la Oficina de Vinculación de Sistemas'
                can [:create, :read, :update], Proyecto
                can [:creaste, :read, :update], Empresa
                can [:create, :read, :update, :import, :destroy], CatDocumento
              end
            end
          end
        end
      elsif usuario.rol == 'empresa'
        can [:create, :read, :update, :destroy], Solicitud
      
      elsif usuario.rol == 'estudiante'
        can [:create, :read, :update], ServicioSocial
        can [:read, :update], Estudiante
        can [:create, :read, :update], EvaluacionServicio
      end
  end
end
