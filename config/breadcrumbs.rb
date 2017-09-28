crumb :root do
  link "", root_path
end

crumb :oficios do 
	link "Oficios", oficios_index_path	
end

crumb :oficio_new do
	link "Nuevo", new_oficio_path
	parent :oficios 
end

#actividad/
crumb :actividades do
	link "Actividades", actividades_path
end

#actividad/:id
crumb :actividad do |actividad|	
	link actividad.nombreActividad, actividad_path(actividad)
	parent :actividades
end
#actividades/new
crumb :actividad_new do 
	link "Nueva", new_cat_tipo_actividad_path
	parent :actividades
end

crumb :actividad_edit do |actividad|
	link "Editar #{actividad.nombreActividad}", edit_actividad_path(actividad)
	parent :actividades

end
#actividades/:id/actividad_docentes/:id
crumb :actividad_docentes do |actividad|
	link "Actividad docente", actividad_actividad_docentes_path(actividad)
	parent :actividad, actividad
end
#actividad_docentes/:id
crumb :actividad_docente do |actdoc|	
	link Docente.find(actdoc.docente_id).nombreD, actividad_docentes_path(actdoc)
	parent :actividad_docentes, actdoc.actividad
end
#actividad-actividad-docente-individual
crumb :actividad_individual_new do |actividad, actdoc|
	#link "nueva", new_actividad_actividad_docente_act_individual_docente_path(actividad, actdoc)	
	#parent :actividad_docente, actdoc
end

#actividad/:id/proyectos/new
crumb :actividad_proyecto do |actividad|
	link "proyecto", actividad_proyectos_path(actividad)
	parent :actividad, actividad
end
#actividad/:id/proyectos/:id
crumb :proyecto do|proyecto|
	link proyecto.numProyecto, proyecto_path(proyecto)
	parent :actividad_proyecto, proyecto.actividad
end

#actividad/:id/actualizacion_docente_profesional
crumb :actividad_actualizacion do |actividad|
	link "Actualización", actividad_actualizacion_docente_profesionales_path(actividad)
	parent :actividades
end
#actividad/:id/actualizacion_docente_profesional/:id
crumb :actualizacion do |actualizacion|
	link actualizacion.tipoActualizacion, actualizacion_docente_profesional_path(actualizacion)
	parent :actividad_actualizacion, actualizacion.actividad
end

#actividad/id/examen_profesiones
crumb :actividad_examen do |actividad|
	link "Exámen", actividad_examen_profesionales_path(actividad)
	parent :actividades
end

crumb :examen do |examen|
	link "Exámen profesional", examen_profesional_path(examen)
	parent :atividad_examen, examen.actividad
end

#actividad/:id/visita
crumb :actividad_visitas do |actividad|
	link "visitas", actividad_visitas_path(actividad)
	parent :actividad, actividad
end
#actividad/:id/visita/:id
crumb :visita  do |visita|	
	link visita.asunto, visita_path(visita)
	parent :actividad_visitas, visita.actividad
end
#viáticos/
crumb :cat_viaticos do
	link "Viáticos", cat_viaticos_path
end
#viáticos/new
crumb :cat_viatico_new do
	link "Nuevo", new_cat_viatico_path
	parent :cat_viaticos
end
#viáticos/:id
crumb :cat_viatico do |viatico| 
	link viatico.nombreViatico, cat_viatico_path(viatico)
	parent :cat_viaticos
end
#viaticos/:id/edit

crumb :cat_viatico_edit do |viatico|
	link "Editar - #{viatico.nombreViatico}", viatico
	parent :cat_viaticos, viatico
end


# ---------------------------------------------
#cat_documentos/new
crumb :cat_documentos_new do
	link "Nuevo", new_cat_documento_path
	parent :cat_documentos
end
#cat_documentos/
crumb :cat_documentos do
  link "Cat Documentos", cat_documentos_path
end

#solicitud_observaciones/
crumb :solicitud_observaciones do
	link "Observaciones de solicitud", solicitud_observaciones_path
	parent :solicitudes
end
#anteproyectos/new
crumb :anteproyectos_new do
	link "Nuevo", new_anteproyecto_path
	parent :anteproyectos
end
#anteproyectos/
crumb :anteproyectos do
  link "Anteproyectos", anteproyectos_path
end

#banco_proyectos/new
crumb :banco_proyectos_new do
	link "Nuevo", new_banco_proyecto_path
	parent :banco_proyectos
end
#banco_proyectos/
crumb :banco_proyectos do
  link "Proyectos en Banco", banco_proyectos_path
end

#solicitud/edit
crumb :solicitud_edit do
	link "Editar", edit_solicitud_path
	parent :solicitudes
end
#solicitud/new
crumb :solicitud_new do
	link "Nuevo", new_solicitud_path
	parent :solicitudes
end
#solicitudes/
crumb :solicitudes do
  link "Solicitudes de Residencia Profesional", solicitudes_path
end




#cat_evidencias
crumb :cat_evidencias do 
	link "Catálogo de evidencias", cat_evidencias_path
end	
#cat_evidencias/new
crumb :cat_evidencia_new do
	link "Nuevo", new_cat_evidencia_path
	parent :cat_evidencias
end
#cat_evidencias/:id
crumb :cat_evidencia do |evidencia|
	link evidencia.nombreEvidencia, cat_evidencia_path(evidencia)
	parent :cat_evidencias
end
#cat_evidencias/:id/edit
crumb :cat_evidencia_edit do |evidencia|
	link "Editar - #{evidencia.nombreEvidencia}", evidencia
	parent :cat_evidencias, evidencia
end

#estudiantes/
crumb :estudiantes do
	link "Estudiantes" , estudiantes_path
end
#estudiantes/new
crumb :estudiante_new do
	link "Nuevo", new_estudiante_path
	parent :estudiantes
end
#estudiantes/:id
crumb :estudiante do |estudiante| 
	link estudiante.numControl, estudiante_path(estudiante)
	parent :estudiantes
end
#estudiantes/id:/edit
crumb :estudiante_edit do |estudiante|
	link "Editar #{estudiante.numControl}", estudiante
	parent :estudiantes, estudiante
end
#servicio_sociales/
crumb :servicio_sociales do
	link "Servicios sociales", servicio_sociales_path
end
crumb :servicio_social_new do 
	link "Nuevo", new_servicio_social_path
	parent :servicio_sociales
end
#servicio_sociales/:id
crumb :servicio_social do |servicio|	
	link ServicioSocial.find(params[:id]).estudiante.numControl, servicio_social_path(servicio)
	parent :servicio_sociales
end
crumb :servicio_social_edit do |servicio|	
	link ServicioSocial.find(params[:id]).estudiante.numControl, edit_servicio_social_path(servicio)
	parent :servicio_sociales
end

#cat_tipo_actividades/
crumb :cat_tipo_actividades do 
	link "Tipo de actividades", cat_tipo_actividades_path
end
#cat_tipo_actividades/new
crumb :cat_tipo_actividad_new do 
	link "Nuevo", new_cat_tipo_actividad_path
	parent :cat_tipo_actividades
end
#cat_tipo_actividades/:id
crumb :cat_tipo_actividad do |tipo|
	link tipo.nombreTipoAct, cat_tipo_actividad_path(tipo)
	parent :cat_tipo_actividades
end
#cat_tipo_actividades/edit
crumb :cat_tipo_actividad_edit  do |tipo|
	link "Editar #{tipo.nombreTipoAct}", edit_cat_tipo_actividad_path(tipo)
	parent :cat_tipo_actividades
end

#cat_tipo_puestos/
crumb :cat_tipo_puestos do
	link "Catálogo de puestos", cat_tipo_puestos_path	
end
#cat_tipo_puestos/new
crumb :cat_tipo_puesto_new do 
	link "Nuevo", new_cat_tipo_puesto_path
	parent :cat_tipo_puestos
end
#cat_tipo_puestos/:id
crumb :cat_tipo_puesto do |puesto|
	link puesto.nombrePuesto, cat_tipo_puestos_path(puesto)
	parent :cat_tipo_puestos
end
#cat_tipo_puestos/:id/edit
crumb :cat_tipo_puesto_edit do |puesto|
	link "Editar #{puesto.nombrePuesto}", edit_cat_tipo_puesto_path(puesto)
	parent :cat_tipo_puestos
end

#cat_departamentos
crumb :cat_departamentos do
	link "Catálogo de departamentos", cat_departamentos_path
end
#cat_departamentos/new
crumb :cat_departamento_new do
	link "Nuevo", new_cat_departamento_path
	parent :cat_departamentos
end
#cat_departamentos/:id
crumb :cat_departamento do |departamento|	
	link departamento.nombreDpto, cat_departamento_path(departamento)
	parent :cat_departamentos
end
#cat_departamentos/:id/edit
crumb :cat_departamento_edit do |departamento|
	link "Editar - #{departamento.nombreDpto}", edit_cat_departamento_path
	parent :cat_departamentos
end

#cat_tipo_grado_estudios/
crumb :cat_tipo_grado_estudios do
	link "Catálogo grado de estudio", cat_tipo_grado_estudios_path
end
#cat_tipo_grado_estudios/new
crumb :cat_tipo_grado_estudio_new do
	link "Nuevo", new_cat_tipo_grado_estudio_path
	parent :cat_tipo_grado_estudios
end
#cat_grado_estudios/:id
crumb :cat_tipo_grado_estudio do |grado|
	link grado.nombreTipoGrado, cat_tipo_grado_estudios_path(grado)
	parent :cat_tipo_grado_estudios
end
#cat_grado_estudios/:id/edit
crumb :cat_tipo_grado_estudio_edit do |grado|
	link "Editar - #{grado.nombreTipoGrado}", edit_cat_tipo_grado_estudio_path(grado)
	parent :cat_tipo_grado_estudios
end

#cat_plan_cursos/
crumb :cat_plan_cursos do 
	link "Catálogo plan de curso", cat_plan_cursos_path	
end
#cat_plan_cursos/new
crumb :cat_plan_curso_new do
	link "Nuevo", new_cat_plan_curso_path
	parent :cat_plan_cursos
end
#cat_plan_cursos/:id
crumb :cat_plan_curso do |plan|
	link plan.descripcion, cat_plan_curso_path(plan)
	parent :cat_plan_cursos
end
#cat_plan_cursos/;id/edit
crumb :cat_plan_curso_edit do |plan|
	link "Editar #{plan.descripcion}", edit_cat_plan_curso_path
	parent :cat_plan_cursos
end

#cat_tipo_examen_proyectos
crumb  :cat_tipo_examen_proyectos do 
	link "Tipo de proyectos", cat_tipo_examen_proyectos_path
end
#cat_tipo_examen_proyectos/new
crumb :cat_tipo_examen_proyecto_new do 
	link "Nuevo" , new_cat_tipo_examen_proyecto_path
	parent :cat_tipo_examen_proyectos
end
#cat_tipo:examen_proyectos/:id
crumb :cat_tipo_examen_proyecto do |tipo|
	link tipo.nombreTipoP, cat_tipo_examen_proyecto_path(tipo)
	parent :cat_tipo_examen_proyectos
end
#cat_tipo_examen_proyecto/:id/edit
crumb :cat_tipo_examen_proyecto_edit do |tipo|
	link "Editar #{tipo.nombreTipoP}", cat_tipo_examen_proyecto_path(tipo)
	parent :cat_tipo_examen_proyectos
end

#cat_especialidades
crumb :cat_especialidades do
	link "Carreras", cat_especialidades_path
end
#cat_especialidades/new
crumb :cat_especialidad_new do
	link "Nuevo", new_cat_especialidad_path
	parent :cat_especialidades
end
#cat_especilidad/:id
crumb :cat_especilidad do |especialidad|
	link especialidad.nombreEsp, cat_especialidades_path(especialidad)
	parent :cat_especialidades
end
#cat_especilidad/:id/edit
crumb :cat_especialidad_edit do |especialidad|
	link "Editar #{especialidad.nombreEsp}", edit_cat_especialidad_path(especialidad)
	parent :cat_especialidades
end

#cat_tipo_participaciones/
crumb :cat_tipo_participaciones do
	link "catálogo participacion", cat_tipo_participaciones_path	
end
#cat_tipo_participaciones/new
crumb :cat_tipo_participacion_new do 
	link "Nuevo", new_cat_tipo_participacion_path
	parent :cat_tipo_participaciones
end
#cat_tipo_participaciones/:id
crumb  :cat_tipo_participacion  do |participacion|
	link participacion.participacion, cat_tipo_participacion_path(participacion)
	parent :cat_tipo_participaciones
end
#cat_tipo_participaciones/:id/edit
crumb :cat_tipo_participacion_edit do |participacion|
	link "Editar #{participacion.participacion}", edit_cat_tipo_participacion_path
	parent :cat_tipo_participaciones
end

#empresas
crumb :empresas do
	link "Empresas", empresas_path
end
#empresas/new
crumb :empresa_new do 
	link "Nuevo", new_empresa_path
	parent :empresas
end
#empresas/:id
crumb :empresa do |empresa|
	link empresa.nombreE, empresa_path(empresa)
	parent :empresas
end
#empresa/:id/edit
crumb  :empresa_edit do |empresa|
	link "Editar #{empresa.nombreE}", edit_empresa_path
	parent :empresas
end

#cat_materias
crumb :cat_materias do 
	link "Materias", cat_materias_path
end
#cat_materias/new
crumb :cat_materias_new do 
	link "Nuevo", new_cat_materia_path
	parent :cat_materias
end
#cat_materias/:id
crumb :cat_materia do |materia|
	link materia.claveMateria, cat_materias_path
	parent :cat_materias
end
#cat_materias/:id/edit
crumb :cat_materia_edit do |materia|
	link "Editar #{materia.claveMateria}", edit_cat_materia_path
	parent :cat_materias
end

#docentes
crumb :docentes do
	link "Docentes", docentes_path
end
#docentes/new
crumb :docente_new do 
	link "Nuevo", new_docente_path
	parent :docentes
end
#docentes/:id
crumb :docente do |docente|
	link docente.rfc, docente_path(docente)
	parent :docentes
end
#docentes/id/edit
crumb :docente_edit do |docente|
	link "Editar #{docente.curp}", edit_docente_path(docente)
	parent :docentes
end

#curso_materias
crumb :curso_materias do 
	link "Curso - materias", curso_materias_path
end
#curso_materias/new
crumb :curso_materia_new do
	link "Nuevo", new_curso_materia_path
	parent :curso_materias
end
#curso_materias/:id
crumb :curso_materia do |materia|
	link materia.nombreGrupo, curso_materia_path(materia)
	parent :curso_materias
end
crumb :curso_materia_edit do |materia|
	link "Editar #{materia.nombreGrupo}", edit_curso_materia_path(materia)
	parent :curso_materias
end

#reuniones
crumb :reuniones do 
	link "Reuniones", reuniones_path
end
#reuniones/new
crumb :reunion_new do
	link "Nueva", new_reunion_path
	parent :reuniones
end
#reuniones/:id
crumb :reunion do |reunion|
	link reunion.fecha.strftime('%d-%m-%Y'), reunion_path(reunion)
	parent :reuniones 
end
#reunion/:id/edit
crumb :reunion_edit do |reunion|
	link "Editar #{reunion.fecha.strftime('%d-%m-%Y')}", edit_reunion_path(reunion)
	parent :reuniones
end

# configuraciones/
crumb :configuraciones do
	link "Configuraciones", configuraciones_path	
end
#configuraciones/new
crumb :configuracion_new do
	link "Nueva", new_configuracion_path
	parent :configuraciones
end

crumb :configuracion do |configuracion|
	link configuracion.tipo, configuracion_path(configuracion)
	parent :configuraciones
end
crumb :configuracion_edit do |configuracion|
	link "Editar #{configuracion.tipo}", configuracion_path(configuracion)
	parent :configuraciones
end

crumb :criterio_academias do
	link "Criterio academias", cat_criterio_academias_path
end

crumb :criterio_academia_new do
	link "Nuevo", new_cat_criterio_academia_path
	parent :criterio_academias
end

crumb :criterio_academia do |criterio|
	link criterio.numero, cat_criterio_academias_path
	parent :criterio_academias
end

crumb :criterio_academia_edit do |criterio|
	link "Editar #{criterio.numero}", cat_criterio_academia_path(criterio)
	parent :criterio_academias
end
crumb :periodos do
	link "Periodos", periodos_path
end

crumb :periodo_new do
	link "Nuevo", new_periodo_path
	parent :periodos
end
crumb :periodo_edit do |periodo|
	link "Editar #{periodo.periodo}", edit_periodo_path(periodo)
	parent :periodos

end
crumb :periodo do |periodo|
	link periodo.periodo, periodo_path(periodo)
	parent :periodos
end
crumb :investigaciones do
	link "Proyectos de investigación", proyecto_investigaciones_path
end
crumb :investigacion_new do
	link "Nuevo", new_proyecto_investigacion_path
	parent :investigaciones
end

crumb :per_cur_mats do
	link "Periodos Curso-Materias", periodo_curs_materias_path
end
crumb :per_cur_mat_new do 
	link "Nuevo", new_periodo_curs_materia_path
	parent :per_cur_mats
end

crumb :per_cur_mat_edit do |p|
	link "Editar #{p.periodo}", edit_periodo_curs_materia_path(p)
	parent :per_cur_mats
end

crumb  :evaluacion_cursos do
	link "Evaluación docente frente a grupo", cat_criterio_evaluacion_docentes_path
end

crumb :evaluacion_curso_new do 
	link "Nuevo", new_cat_criterio_evaluacion_docente_path
	parent :evaluacion_cursos
end
crumb :evaluacion_curso_edit do |e|
	link "Editar", edit_cat_criterio_evaluacion_docente_path(e)
	parent :evaluacion_cursos
end

crumb :liberacion_docentes do 
	link "Liberaciones", periodo_liberacion_cursos_path
end
crumb :liberacion_docente_new do
	link "Nuevo", new_periodo_liberacion_curso_path
	parent :liberacion_docentes
end
crumb :liberacion_docente_edit do |l|
	link "Editar", edit_periodo_liberacion_curso_path(l)
	parent :liberacion_docentes
end

crumb :liberacion_docente do |l|
	link l.periodo, periodo_liberacion_curso_path(l)
	parent :liberacion_docentes
end
crumb :actividad_academicas do
	link "Periodos actividades-académicas", periodo_actividad_academicas_path
end
crumb :actividad_academica_new do
	link "Nueva", new_periodo_actividad_academica_path
	parent :actividad_academicas 
end

crumb :actividad_academica_edit do |act|
	link "Editar", edit_periodo_actividad_academica_path(act)
	parent :actividad_academicas
end

crumb :actividad_academica do |act|
	link act.periodo, edit_periodo_actividad_academica_path(act)
	parent :actividad_academicas
end

#------Residencia------
crumb :perfil_egresados_new do
	link "Perfil", new_perfil_egresado_path
	parent :estudiante
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
