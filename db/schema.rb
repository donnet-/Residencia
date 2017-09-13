# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170830181702) do

  create_table "act_individual_docentes", force: :cascade do |t|
    t.string   "pdfEvidencia",         limit: 255
    t.integer  "actividad_docente_id", limit: 4
    t.string   "estado",               limit: 255
    t.integer  "usuario_id",           limit: 4
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "cat_evidencia_id",     limit: 4
  end

  create_table "actividad_docentes", force: :cascade do |t|
    t.integer  "docente_id",                limit: 4
    t.integer  "cat_tipo_participacion_id", limit: 4
    t.integer  "actividad_id",              limit: 4
    t.integer  "usuario_id",                limit: 4
    t.string   "estado",                    limit: 255
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "actividad_docentes", ["actividad_id"], name: "index_actividad_docentes_on_actividad_id", using: :btree
  add_index "actividad_docentes", ["cat_tipo_participacion_id"], name: "index_actividad_docentes_on_cat_tipo_participacion_id", using: :btree
  add_index "actividad_docentes", ["docente_id"], name: "index_actividad_docentes_on_docente_id", using: :btree

  create_table "actividad_docentes_modulo_diplomados", id: false, force: :cascade do |t|
    t.integer "actividad_docente_id", limit: 4, null: false
    t.integer "modulo_diplomado_id",  limit: 4, null: false
  end

  create_table "actividad_evidencias", force: :cascade do |t|
    t.integer  "cat_evidencia_id",   limit: 4
    t.string   "pdfEvidencia",       limit: 255
    t.date     "fechaActualizacion"
    t.integer  "actividad_id",       limit: 4
    t.string   "estado",             limit: 255
    t.integer  "usuario_id",         limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "actividad_evidencias", ["actividad_id"], name: "index_actividad_evidencias_on_actividad_id", using: :btree
  add_index "actividad_evidencias", ["cat_evidencia_id"], name: "index_actividad_evidencias_on_cat_evidencia_id", using: :btree

  create_table "actividades", force: :cascade do |t|
    t.string   "nombreActividad",       limit: 255
    t.string   "tipoComision",          limit: 255
    t.string   "tipoEvidencia",         limit: 255
    t.integer  "cat_tipo_actividad_id", limit: 4
    t.date     "fechaInicio"
    t.date     "fechaTermino"
    t.text     "descripcion",           limit: 65535
    t.string   "usuario_id",            limit: 255
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "lugar",                 limit: 255
    t.string   "proyecto_id",           limit: 255
    t.string   "hora",                  limit: 255
    t.string   "tipoexamen",            limit: 255
  end

  add_index "actividades", ["cat_tipo_actividad_id"], name: "index_actividades_on_cat_tipo_actividad_id", using: :btree

  create_table "actividades_cat_viaticos", id: false, force: :cascade do |t|
    t.integer "cat_viatico_id", limit: 4, null: false
    t.integer "actividad_id",   limit: 4, null: false
  end

  create_table "actualizaciones", force: :cascade do |t|
    t.string   "tipoPeriodo",       limit: 255
    t.string   "tipoActualizacion", limit: 255
    t.string   "modalidad",         limit: 255
    t.integer  "horasCapacitacion", limit: 4
    t.integer  "actividad_id",      limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "actualizaciones", ["actividad_id"], name: "index_actualizaciones_on_actividad_id", using: :btree

  create_table "anexos", force: :cascade do |t|
    t.string   "pdfAnexo",    limit: 255
    t.date     "fechaAnexo"
    t.integer  "proyecto_id", limit: 4
    t.integer  "reunion_id",  limit: 4
    t.string   "estado",      limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "anexos", ["proyecto_id"], name: "index_anexos_on_proyecto_id", using: :btree
  add_index "anexos", ["reunion_id"], name: "index_anexos_on_reunion_id", using: :btree

  create_table "anexos_proyecto_estudiantes", id: false, force: :cascade do |t|
    t.integer "proyecto_estudiante_id", limit: 4, null: false
    t.integer "anexo_id",               limit: 4, null: false
  end

  create_table "anteproyecto_estudiantes", force: :cascade do |t|
    t.integer  "numControl",      limit: 4
    t.integer  "anteproyecto_id", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "anteproyecto_estudiantes", ["anteproyecto_id"], name: "index_anteproyecto_estudiantes_on_anteproyecto_id", using: :btree

  create_table "anteproyecto_observaciones", force: :cascade do |t|
    t.string   "identificador",   limit: 255
    t.text     "observacion",     limit: 65535
    t.integer  "anteproyecto_id", limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "anteproyecto_observaciones", ["anteproyecto_id"], name: "index_anteproyecto_observaciones_on_anteproyecto_id", using: :btree

  create_table "anteproyectos", force: :cascade do |t|
    t.integer  "fk_id_proyecto_b", limit: 4
    t.string   "nombre_anteproy",  limit: 255
    t.string   "asesor_externo",   limit: 255
    t.string   "status_anteproy",  limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "revisor",          limit: 255
    t.string   "clave",            limit: 255
  end

  create_table "aprendizaje_egresados", force: :cascade do |t|
    t.string   "calidad_docente",        limit: 255
    t.string   "plan_estudio",           limit: 255
    t.string   "proyecto_investigacion", limit: 255
    t.string   "condiciones_estudio",    limit: 255
    t.string   "experiencia",            limit: 255
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "archivo_docentes", force: :cascade do |t|
    t.string   "tipoArchivo", limit: 255
    t.string   "etiqueta",    limit: 255
    t.string   "archivoPdf",  limit: 255
    t.integer  "docente_id",  limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "archivo_docentes", ["docente_id"], name: "index_archivo_docentes_on_docente_id", using: :btree

  create_table "archivo_periodos", force: :cascade do |t|
    t.string   "descripcion",             limit: 255
    t.string   "archivo",                 limit: 255
    t.integer  "periodo_curs_materia_id", limit: 4
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "archivo_periodos", ["periodo_curs_materia_id"], name: "index_archivo_periodos_on_periodo_curs_materia_id", using: :btree

  create_table "archivo_prodep_docentes", force: :cascade do |t|
    t.string   "tipoArchivo", limit: 255
    t.string   "etiqueta",    limit: 255
    t.string   "archivoPdf",  limit: 255
    t.integer  "docente_id",  limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "archivo_prodep_docentes", ["docente_id"], name: "index_archivo_prodep_docentes_on_docente_id", using: :btree

  create_table "banco_proyectos", force: :cascade do |t|
    t.string   "fk_rfc_emp_inst",          limit: 255
    t.string   "nombre_proyecto_b",        limit: 255
    t.text     "descrip_proyecto_b",       limit: 65535
    t.string   "tipo_proyecto_b",          limit: 255
    t.date     "fecha_inicio_proyecto_b"
    t.date     "fecha_termino_proyecto_b"
    t.integer  "num_residentes",           limit: 4
    t.text     "objetivo_esperado",        limit: 65535
    t.string   "pdf_solicitud",            limit: 255
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "clave",                    limit: 255
    t.string   "estado",                   limit: 255
    t.string   "revisor",                  limit: 255
    t.string   "asesor_externo",           limit: 255
  end

  create_table "cat_criterio_academias", force: :cascade do |t|
    t.integer  "numero",     limit: 4
    t.string   "criterio",   limit: 255
    t.string   "estado",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "cat_criterio_eval_residencias", force: :cascade do |t|
    t.string   "criterio_eval", limit: 255
    t.integer  "valor",         limit: 4
    t.string   "status",        limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "cat_criterio_eval_servicios", force: :cascade do |t|
    t.string   "nombre_criterio", limit: 255
    t.integer  "cal_A",           limit: 4
    t.string   "status",          limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "cat_criterio_evaluacion_docentes", force: :cascade do |t|
    t.integer  "numero",     limit: 4
    t.string   "criterio",   limit: 255
    t.string   "estado",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "cat_departamentos", force: :cascade do |t|
    t.string   "nombreDpto", limit: 255
    t.string   "estado",     limit: 255
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "encargado",  limit: 255
  end

  create_table "cat_especialidades", force: :cascade do |t|
    t.string   "nombreEsp",  limit: 255
    t.string   "estado",     limit: 255
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "alias",      limit: 255
  end

  create_table "cat_evidencia_periodos", force: :cascade do |t|
    t.string   "etiqueta",   limit: 255
    t.string   "tipo",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "cat_evidencias", force: :cascade do |t|
    t.string   "nombreEvidencia", limit: 255
    t.string   "estado",          limit: 255
    t.integer  "user_id",         limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "cat_evidencias_tipo_actividades", id: false, force: :cascade do |t|
    t.integer "cat_tipo_actividad_id", limit: 4, null: false
    t.integer "cat_evidencia_id",      limit: 4, null: false
  end

  create_table "cat_materias", force: :cascade do |t|
    t.string   "claveMateria",      limit: 255
    t.string   "nombreMat",         limit: 255
    t.string   "credito",           limit: 255
    t.string   "temario",           limit: 255
    t.string   "estado",            limit: 255
    t.integer  "cat_plan_curso_id", limit: 4
    t.integer  "user_id",           limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "cat_materias", ["cat_plan_curso_id"], name: "index_cat_materias_on_cat_plan_curso_id", using: :btree

  create_table "cat_plan_cursos", force: :cascade do |t|
    t.string   "descripcion", limit: 255
    t.string   "estado",      limit: 255
    t.integer  "user_id",     limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "cat_tipo_actividades", force: :cascade do |t|
    t.string   "nombreTipoAct",  limit: 255
    t.string   "estado",         limit: 255
    t.integer  "user_id",        limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.text     "textoSugerido",  limit: 65535
    t.string   "cabecera",       limit: 255
    t.string   "requiereOficio", limit: 255
  end

  create_table "cat_tipo_actividades_participaciones", id: false, force: :cascade do |t|
    t.integer "cat_tipo_actividad_id",     limit: 4, null: false
    t.integer "cat_tipo_participacion_id", limit: 4, null: false
  end

  create_table "cat_tipo_examen_proyectos", force: :cascade do |t|
    t.string   "nombreTipoP", limit: 255
    t.string   "estado",      limit: 255
    t.integer  "user_id",     limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "cat_tipo_grado_estudios", force: :cascade do |t|
    t.string   "nombreTipoGrado", limit: 255
    t.string   "estado",          limit: 255
    t.integer  "user_id",         limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "aliasEsp",        limit: 255
  end

  create_table "cat_tipo_participaciones", force: :cascade do |t|
    t.string   "participacion", limit: 255
    t.string   "estado",        limit: 255
    t.integer  "user_id",       limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "cat_tipo_puestos", force: :cascade do |t|
    t.string   "nombrePuesto", limit: 255
    t.string   "estado",       limit: 255
    t.integer  "user_id",      limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "alterno",      limit: 255
  end

  create_table "cat_viaticos", force: :cascade do |t|
    t.string   "nombreViatico", limit: 255
    t.string   "estado",        limit: 255
    t.integer  "user_id",       limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "comentario_egresados", force: :cascade do |t|
    t.string   "opinion",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "competencias_empresas", force: :cascade do |t|
    t.integer  "habilidad",          limit: 4
    t.integer  "orotografia",        limit: 4
    t.integer  "mejora_procesos",    limit: 4
    t.integer  "trabajo_equipo",     limit: 4
    t.integer  "habilidad_tiempo",   limit: 4
    t.integer  "seguridad_personal", limit: 4
    t.integer  "facilidad_palabra",  limit: 4
    t.integer  "gestion_proyecto",   limit: 4
    t.integer  "puntualidad",        limit: 4
    t.integer  "cumplimiento",       limit: 4
    t.integer  "integracion",        limit: 4
    t.integer  "creatividad",        limit: 4
    t.integer  "liderazgo",          limit: 4
    t.integer  "adaptacion_cambios", limit: 4
    t.integer  "exelente",           limit: 4
    t.integer  "muy_bueno",          limit: 4
    t.integer  "bueno",              limit: 4
    t.integer  "regular",            limit: 4
    t.integer  "malo",               limit: 4
    t.string   "sugerencia_mejora",  limit: 255
    t.string   "comentario",         limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "configuraciones", force: :cascade do |t|
    t.string   "tipo",       limit: 255
    t.string   "contenido",  limit: 255
    t.string   "imagen",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "constancia_dpto_investigaciones", force: :cascade do |t|
    t.integer  "actvidad_id", limit: 4
    t.date     "fecha"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "convenio_honorarios", force: :cascade do |t|
    t.string   "pdfConvenio",  limit: 255
    t.date     "fechaInicio"
    t.date     "fechaTermino"
    t.integer  "docente_id",   limit: 4
    t.integer  "usuario_id",   limit: 4
    t.string   "estado",       limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "convenio_honorarios", ["docente_id"], name: "index_convenio_honorarios_on_docente_id", using: :btree

  create_table "criterio_evaluacion_residencias", force: :cascade do |t|
    t.integer  "id_evaluacion",            limit: 4
    t.integer  "id_cat_criterio_eva",      limit: 4
    t.integer  "califiacion_criterio",     limit: 4
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "evaluacion_residencia_id", limit: 4
  end

  create_table "criterio_evaluacion_servicios", force: :cascade do |t|
    t.integer  "id_evalucacion",         limit: 4
    t.integer  "id_cat_criterio_eva",    limit: 4
    t.integer  "calificacion_criterio",  limit: 4
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "num_reporte",            limit: 4
    t.integer  "evaluacion_servicio_id", limit: 4
  end

  add_index "criterio_evaluacion_servicios", ["evaluacion_servicio_id"], name: "index_criterio_evaluacion_servicios_on_evaluacion_servicio_id", using: :btree

  create_table "curso_evidencias", force: :cascade do |t|
    t.string   "etiqueta",                limit: 255
    t.string   "archivo",                 limit: 255
    t.integer  "curso_materia_id",        limit: 4
    t.integer  "periodo_curs_materia_id", limit: 4
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "curso_evidencias", ["curso_materia_id"], name: "index_curso_evidencias_on_curso_materia_id", using: :btree
  add_index "curso_evidencias", ["periodo_curs_materia_id"], name: "index_curso_evidencias_on_periodo_curs_materia_id", using: :btree

  create_table "curso_materia_estudiantes", force: :cascade do |t|
    t.integer  "curso_materia_id", limit: 4
    t.integer  "numControl",       limit: 4
    t.string   "nombre",           limit: 255
    t.string   "apellidoPaterno",  limit: 255
    t.string   "apellidoMaterno",  limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "curso_materia_estudiantes", ["curso_materia_id"], name: "index_curso_materia_estudiantes_on_curso_materia_id", using: :btree

  create_table "curso_materias", force: :cascade do |t|
    t.string   "nombreGrupo",             limit: 255
    t.string   "aula",                    limit: 255
    t.integer  "docente_id",              limit: 4
    t.integer  "cat_materia_id",          limit: 4
    t.integer  "usuario_id",              limit: 4
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "periodo_curs_materia_id", limit: 4
    t.integer  "total",                   limit: 4
  end

  add_index "curso_materias", ["cat_materia_id"], name: "index_curso_materias_on_cat_materia_id", using: :btree
  add_index "curso_materias", ["docente_id"], name: "index_curso_materias_on_docente_id", using: :btree
  add_index "curso_materias", ["periodo_curs_materia_id"], name: "index_curso_materias_on_periodo_curs_materia_id", using: :btree

  create_table "datos_generales_empresas", force: :cascade do |t|
    t.string   "nombre_empresa",      limit: 255
    t.string   "calle",               limit: 255
    t.integer  "numero",              limit: 4
    t.string   "colonia",             limit: 255
    t.integer  "cp",                  limit: 4
    t.string   "ciudad",              limit: 255
    t.string   "estado",              limit: 255
    t.string   "municipio",           limit: 255
    t.string   "telefono",            limit: 255
    t.string   "correo",              limit: 255
    t.string   "tipo_empresa",        limit: 255
    t.string   "tam_empresa",         limit: 255
    t.string   "actividad_economica", limit: 255
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   limit: 4,     default: 0, null: false
    t.integer  "attempts",   limit: 4,     default: 0, null: false
    t.text     "handler",    limit: 65535,             null: false
    t.text     "last_error", limit: 65535
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by",  limit: 255
    t.string   "queue",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "desem_laborales", force: :cascade do |t|
    t.string   "eficincia",              limit: 255
    t.string   "calificacion_academica", limit: 255
    t.string   "utilidad_residencia",    limit: 255
    t.integer  "area_estudio",           limit: 4
    t.integer  "titulacion",             limit: 4
    t.integer  "experiencia_laboral",    limit: 4
    t.integer  "posicionamiento",        limit: 4
    t.integer  "conocimiento_idioma",    limit: 4
    t.integer  "recomendaciones",        limit: 4
    t.integer  "personalidad_actitud",   limit: 4
    t.integer  "otros",                  limit: 4
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "competencia_laboral",    limit: 4
  end

  create_table "docentes", force: :cascade do |t|
    t.string   "curp",                limit: 255
    t.string   "rfc",                 limit: 255
    t.string   "clavePresupuestal",   limit: 255
    t.string   "nombreD",             limit: 255
    t.string   "apPaterno",           limit: 255
    t.string   "apMaterno",           limit: 255
    t.string   "genero",              limit: 255
    t.string   "email",               limit: 255
    t.integer  "cat_departamento_id", limit: 4
    t.string   "tipoDocente",         limit: 255
    t.integer  "usuario_id",          limit: 4
    t.string   "estado",              limit: 255
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.string   "rol",                 limit: 255, default: "docente"
    t.string   "pdfCurriculum",       limit: 255
    t.string   "contacto",            limit: 255
    t.string   "tipoCurriculum",      limit: 255
    t.string   "numCurriculum",       limit: 255
    t.string   "sni",                 limit: 255
    t.string   "sniEvidencia",        limit: 255
    t.string   "prodep",              limit: 255
    t.string   "prodepEvidencia",     limit: 255
  end

  add_index "docentes", ["cat_departamento_id"], name: "index_docentes_on_cat_departamento_id", using: :btree
  add_index "docentes", ["usuario_id"], name: "index_docentes_on_usuario_id", using: :btree

  create_table "egresados", force: :cascade do |t|
    t.integer  "numControl",            limit: 4
    t.string   "opcion",                limit: 255
    t.integer  "cat_plan_curso_id",     limit: 4
    t.integer  "examen_profesional_id", limit: 4
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "egresados", ["cat_plan_curso_id"], name: "index_egresados_on_cat_plan_curso_id", using: :btree
  add_index "egresados", ["examen_profesional_id"], name: "index_egresados_on_examen_profesional_id", using: :btree

  create_table "empresas", force: :cascade do |t|
    t.string   "rfcEmpresa",  limit: 255
    t.string   "nombreE",     limit: 255
    t.string   "pdfConvenio", limit: 255
    t.string   "email",       limit: 255
    t.string   "contacto",    limit: 255
    t.string   "telefono",    limit: 255
    t.string   "estado",      limit: 255
    t.string   "calle",       limit: 255
    t.string   "colonia",     limit: 255
    t.string   "numInterior", limit: 255
    t.string   "numExterior", limit: 255
    t.string   "estadoEmp",   limit: 255
    t.integer  "usuario_id",  limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "estadistica_servicios", force: :cascade do |t|
    t.string   "periodo",     limit: 255
    t.integer  "promedioB",   limit: 4
    t.integer  "promedioFin", limit: 4
    t.string   "desempeño",   limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "estadisticas", force: :cascade do |t|
    t.string   "carrera",                 limit: 255
    t.integer  "ordinaria",               limit: 4
    t.integer  "complementaria",          limit: 4
    t.integer  "especial",                limit: 4
    t.integer  "desertores",              limit: 4
    t.integer  "reprobados",              limit: 4
    t.integer  "curso_materia_id",        limit: 4
    t.integer  "periodo_curs_materia_id", limit: 4
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "estadisticas", ["curso_materia_id"], name: "index_estadisticas_on_curso_materia_id", using: :btree
  add_index "estadisticas", ["periodo_curs_materia_id"], name: "index_estadisticas_on_periodo_curs_materia_id", using: :btree

  create_table "estudiantes", force: :cascade do |t|
    t.string   "curpEstudiante",      limit: 255
    t.integer  "numControl",          limit: 4
    t.string   "nombre",              limit: 255
    t.string   "apPaterno",           limit: 255
    t.string   "apMaterno",           limit: 255
    t.string   "genero",              limit: 255
    t.string   "email",               limit: 255
    t.integer  "cat_especialidad_id", limit: 4
    t.integer  "usuario_id",          limit: 4
    t.string   "tipo_estudiante",     limit: 255
    t.string   "estado",              limit: 255
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
    t.string   "rol",                 limit: 255, default: "estudiante"
    t.string   "email_adicional",     limit: 255
    t.string   "contacto",            limit: 255
  end

  add_index "estudiantes", ["cat_especialidad_id"], name: "index_estudiantes_on_cat_especialidad_id", using: :btree

  create_table "evaluacion_residencias", force: :cascade do |t|
    t.string   "id_residencia",  limit: 255
    t.integer  "num_reporte",    limit: 4
    t.date     "fecha_registro"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "pdf",            limit: 255
  end

  create_table "evaluacion_servicios", force: :cascade do |t|
    t.integer  "id_servicio_social",      limit: 4
    t.integer  "num_reporte",             limit: 4
    t.string   "pdf_eval_servicio",       limit: 255
    t.date     "fecha_registro_servicio"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "examen_profesionales", force: :cascade do |t|
    t.string   "hora",                        limit: 255
    t.date     "fecha"
    t.integer  "cat_tipo_examen_proyecto_id", limit: 4
    t.integer  "actividad_id",                limit: 4
    t.string   "estado",                      limit: 255
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "examen_profesionales", ["actividad_id"], name: "index_examen_profesionales_on_actividad_id", using: :btree
  add_index "examen_profesionales", ["cat_tipo_examen_proyecto_id"], name: "index_examen_profesionales_on_cat_tipo_examen_proyecto_id", using: :btree

  create_table "expectativas_egresados", force: :cascade do |t|
    t.string   "cursos_actualizacion", limit: 255
    t.string   "tomar_posgrado",       limit: 255
    t.string   "describir",            limit: 255
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "firmas", force: :cascade do |t|
    t.string   "cargo",      limit: 255
    t.string   "titular",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "grado_estudios", force: :cascade do |t|
    t.string   "nombreGrado",               limit: 255
    t.integer  "cat_tipo_grado_estudio_id", limit: 4
    t.string   "institucion",               limit: 255
    t.string   "pdfEvidencia",              limit: 255
    t.integer  "docente_id",                limit: 4
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "abrev",                     limit: 255
  end

  add_index "grado_estudios", ["cat_tipo_grado_estudio_id"], name: "index_grado_estudios_on_cat_tipo_grado_estudio_id", using: :btree
  add_index "grado_estudios", ["docente_id"], name: "index_grado_estudios_on_docente_id", using: :btree

  create_table "grupo_act_complementarias", force: :cascade do |t|
    t.integer  "actividad_complementaria_id", limit: 4
    t.integer  "numControl",                  limit: 4
    t.string   "estado",                      limit: 255
    t.integer  "usuario_id",                  limit: 4
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "apPaterno",                   limit: 255
    t.string   "apMaterno",                   limit: 255
    t.string   "nombre",                      limit: 255
  end

  add_index "grupo_act_complementarias", ["actividad_complementaria_id"], name: "index_grupo_act_complementarias_on_actividad_complementaria_id", using: :btree

  create_table "horario_actualizaciones", force: :cascade do |t|
    t.string   "dia",              limit: 255
    t.string   "hora_inicio",      limit: 255
    t.string   "hora_fin",         limit: 255
    t.integer  "actualizacion_id", limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "horario_actualizaciones", ["actualizacion_id"], name: "index_horario_actualizaciones_on_actualizacion_id", using: :btree

  create_table "horarios", force: :cascade do |t|
    t.string   "dia",                                  limit: 255
    t.string   "hora_inicio",                          limit: 255
    t.string   "hora_fin",                             limit: 255
    t.integer  "actualizacion_docente_profesional_id", limit: 4
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  add_index "horarios", ["actualizacion_docente_profesional_id"], name: "index_horarios_on_actualizacion_docente_profesional_id", using: :btree

  create_table "lib_actividad_docentes", force: :cascade do |t|
    t.integer  "periodo_actividad_academica_id", limit: 4
    t.integer  "docente_id",                     limit: 4
    t.date     "fecha"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "lib_actividad_docentes", ["periodo_actividad_academica_id"], name: "index_lib_actividad_docentes_on_periodo_actividad_academica_id", using: :btree

  create_table "lib_curso_docentes", force: :cascade do |t|
    t.integer  "periodo_liberacion_curso_id", limit: 4
    t.integer  "docente_id",                  limit: 4
    t.string   "liberado",                    limit: 255
    t.date     "fecha"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "lib_curso_docentes", ["periodo_liberacion_curso_id"], name: "index_lib_curso_docentes_on_periodo_liberacion_curso_id", using: :btree

  create_table "lib_doc_act_criterios", force: :cascade do |t|
    t.integer  "lib_actividad_docente_id", limit: 4
    t.integer  "criterio_id",              limit: 4
    t.string   "valor",                    limit: 255
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "lib_doc_act_criterios", ["lib_actividad_docente_id"], name: "index_lib_doc_act_criterios_on_lib_actividad_docente_id", using: :btree

  create_table "lib_doc_criterios", force: :cascade do |t|
    t.integer  "lib_curso_docente_id", limit: 4
    t.integer  "criterio_id",          limit: 4
    t.string   "respuesta",            limit: 255
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "lib_doc_criterios", ["lib_curso_docente_id"], name: "index_lib_doc_criterios_on_lib_curso_docente_id", using: :btree

  create_table "liberacio_docente_cursos", force: :cascade do |t|
    t.integer  "liberacion_curso_id", limit: 4
    t.integer  "docente_id",          limit: 4
    t.date     "fecha"
    t.string   "dosificacion",        limit: 255
    t.string   "instrumentacion",     limit: 255
    t.string   "cumplimiento",        limit: 255
    t.string   "calificacion",        limit: 255
    t.string   "reporteFinal",        limit: 255
    t.string   "apoyo",               limit: 255
    t.string   "liberacion",          limit: 255
    t.string   "jefeAcad",            limit: 255
    t.string   "subdirector",         limit: 255
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "liberacio_docente_cursos", ["liberacion_curso_id"], name: "index_liberacio_docente_cursos_on_liberacion_curso_id", using: :btree

  create_table "liberacion_cursos", force: :cascade do |t|
    t.string   "periodo",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "materia_evidencias", force: :cascade do |t|
    t.string   "etiqueta",                limit: 255
    t.string   "archivo",                 limit: 255
    t.integer  "periodo_curs_materia_id", limit: 4
    t.integer  "cat_materia_id",          limit: 4
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "materia_evidencias", ["cat_materia_id"], name: "index_materia_evidencias_on_cat_materia_id", using: :btree
  add_index "materia_evidencias", ["periodo_curs_materia_id"], name: "index_materia_evidencias_on_periodo_curs_materia_id", using: :btree

  create_table "modulo_diplomados", force: :cascade do |t|
    t.string   "nombreModulo",         limit: 255
    t.date     "fechaInicio"
    t.date     "fechaTermino"
    t.string   "duracion",             limit: 255
    t.integer  "actividad_docente_id", limit: 4
    t.integer  "actividad_id",         limit: 4
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "modulo_diplomados", ["actividad_docente_id"], name: "index_modulo_diplomados_on_actividad_docente_id", using: :btree
  add_index "modulo_diplomados", ["actividad_id"], name: "index_modulo_diplomados_on_actividad_id", using: :btree

  create_table "oficio_externos", force: :cascade do |t|
    t.string   "etiqueta",   limit: 255
    t.string   "pdf_oficio", limit: 255
    t.integer  "oficio_id",  limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "oficio_externos", ["oficio_id"], name: "index_oficio_externos_on_oficio_id", using: :btree

  create_table "oficio_liberacion_academicas", force: :cascade do |t|
    t.date     "fecha"
    t.integer  "docente_id",         limit: 4
    t.string   "periodo",            limit: 255
    t.string   "asistencia",         limit: 255
    t.string   "participacion",      limit: 255
    t.string   "asesoriaTitulacion", limit: 255
    t.string   "propuesta",          limit: 255
    t.string   "sinodales",          limit: 255
    t.string   "partiEvento",        limit: 255
    t.string   "contribucion",       limit: 255
    t.string   "desarrollo",         limit: 255
    t.string   "propuestaBanco",     limit: 255
    t.string   "asesoriaAcad",       limit: 255
    t.string   "tutoria",            limit: 255
    t.string   "particComision",     limit: 255
    t.text     "otro",               limit: 65535
    t.string   "otros",              limit: 255
    t.string   "cumplio",            limit: 255
    t.string   "jefeDpto",           limit: 255
    t.string   "presidAcad",         limit: 255
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "reunion_id",         limit: 4
  end

  create_table "oficio_reuniones", force: :cascade do |t|
    t.integer  "numOficio",    limit: 4
    t.string   "anio",         limit: 255
    t.date     "fechaG"
    t.string   "destinatario", limit: 255
    t.string   "jefeDivision", limit: 255
    t.integer  "reunion_id",   limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "numControl",   limit: 4
    t.integer  "proyecto",     limit: 4
  end

  add_index "oficio_reuniones", ["reunion_id"], name: "index_oficio_reuniones_on_reunion_id", using: :btree

  create_table "oficio_servicios", force: :cascade do |t|
    t.integer  "numOficio",          limit: 4
    t.string   "anio",               limit: 255
    t.integer  "servicio_social_id", limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.date     "fecha"
    t.string   "tipoActividad",      limit: 255
  end

  add_index "oficio_servicios", ["servicio_social_id"], name: "index_oficio_servicios_on_servicio_social_id", using: :btree

  create_table "oficio_vinculaciones", force: :cascade do |t|
    t.integer  "numOficio",              limit: 4
    t.string   "anio",                   limit: 255
    t.date     "fecha"
    t.integer  "proyecto_id",            limit: 4
    t.integer  "proyecto_docente_id",    limit: 4
    t.integer  "proyecto_estudiante_id", limit: 4
    t.string   "lema",                   limit: 255
    t.integer  "plan_estudio_id",        limit: 4
    t.string   "jefeDpto",               limit: 255
    t.string   "jefeVinculacion",        limit: 255
    t.string   "subAcademico",           limit: 255
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.date     "fechaLiberacion"
  end

  create_table "oficios", force: :cascade do |t|
    t.integer  "numero",               limit: 4
    t.string   "anio",                 limit: 255
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "actividad_docente_id", limit: 4
    t.integer  "actividad_id",         limit: 4
    t.date     "fecha"
    t.string   "participacion",        limit: 255
    t.string   "firma",                limit: 255
    t.string   "lema",                 limit: 255
    t.string   "recibe",               limit: 255
    t.integer  "cuota",                limit: 4
    t.string   "motivo",               limit: 255
    t.string   "lugar",                limit: 255
    t.boolean  "nacionall"
    t.string   "nivelAp",              limit: 255
    t.string   "tipoZona",             limit: 255
    t.string   "tipoAnDe",             limit: 255
    t.string   "destinatario",         limit: 255
    t.string   "jefe",                 limit: 255
    t.string   "pPartida",             limit: 255
    t.string   "pLlegada",             limit: 255
    t.string   "claseServ",            limit: 255
    t.integer  "importe",              limit: 4
    t.string   "categoria",            limit: 255
    t.integer  "sueldo",               limit: 4
    t.integer  "modulo",               limit: 4
    t.integer  "docente",              limit: 4
    t.date     "fechaPosterior"
    t.string   "zona",                 limit: 255
    t.integer  "importeViat",          limit: 4
    t.text     "descripcion",          limit: 65535
    t.string   "jefeDivision",         limit: 255
    t.integer  "reunion_id",           limit: 4
    t.integer  "proyecto_id",          limit: 4
    t.integer  "numControl",           limit: 4
    t.integer  "anexo_id",             limit: 4
    t.integer  "servicio_social_id",   limit: 4
    t.date     "fechaLibS"
  end

  add_index "oficios", ["actividad_docente_id"], name: "index_oficios_on_actividad_docente_id", using: :btree
  add_index "oficios", ["actividad_id"], name: "index_oficios_on_actividad_id", using: :btree

  create_table "participacion_sociales", force: :cascade do |t|
    t.string   "organizacion_social",      limit: 255
    t.string   "organismo_profesionistas", limit: 255
    t.string   "asociacion_egresados",     limit: 255
    t.string   "describir",                limit: 255
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "perfil_egresados", force: :cascade do |t|
    t.string   "nombre",                limit: 255
    t.integer  "fk_numControl",         limit: 4
    t.date     "fecha_nac"
    t.string   "curp",                  limit: 255
    t.string   "sexo",                  limit: 255
    t.string   "edo_civil",             limit: 255
    t.string   "direccion",             limit: 255
    t.integer  "telefon",               limit: 4
    t.string   "email",                 limit: 255
    t.string   "egresado_especialidad", limit: 255
    t.string   "fecha_egresado",        limit: 255
    t.string   "titulo",                limit: 255
    t.integer  "dominio_ingles",        limit: 4
    t.integer  "idioma_otro",           limit: 4
    t.string   "m_software",            limit: 255
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "periodo_actividad_academicas", force: :cascade do |t|
    t.string   "periodo",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "periodo_curs_materias", force: :cascade do |t|
    t.string   "periodo",            limit: 255
    t.integer  "docente_id",         limit: 4
    t.string   "zipEstadisitica",    limit: 255
    t.string   "pdfInstrumentacion", limit: 255
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.boolean  "estadistica",                    default: false
  end

  create_table "periodo_liberacion_cursos", force: :cascade do |t|
    t.string   "periodo",         limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.text     "notaAbajo",       limit: 65535
    t.string   "cabeceraPeriodo", limit: 255
  end

  create_table "periodos", force: :cascade do |t|
    t.string   "periodo",      limit: 255
    t.date     "fechaInicio"
    t.date     "fechaTermino"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "proy_inv_docentes", force: :cascade do |t|
    t.integer  "proyecto_investigacion_id", limit: 4
    t.integer  "docente_id",                limit: 4
    t.integer  "cat_tipo_participacion_id", limit: 4
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "proy_inv_docentes", ["proyecto_investigacion_id"], name: "index_proy_inv_docentes_on_proyecto_investigacion_id", using: :btree

  create_table "proy_inv_documentos", force: :cascade do |t|
    t.string   "descripcion",               limit: 255
    t.string   "documento",                 limit: 255
    t.integer  "proyecto_investigacion_id", limit: 4
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.date     "fechaPublicacion"
  end

  add_index "proy_inv_documentos", ["proyecto_investigacion_id"], name: "index_proy_inv_documentos_on_proyecto_investigacion_id", using: :btree

  create_table "proyecto_docente_evidencias", force: :cascade do |t|
    t.string   "etiqueta",            limit: 255
    t.string   "pdfEvidencia",        limit: 255
    t.integer  "proyecto_docente_id", limit: 4
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "proyecto_docente_evidencias", ["proyecto_docente_id"], name: "index_proyecto_docente_evidencias_on_proyecto_docente_id", using: :btree

  create_table "proyecto_docentes", force: :cascade do |t|
    t.integer  "proyecto_id",               limit: 4
    t.integer  "docente_id",                limit: 4
    t.string   "cat_tipo_participacion_id", limit: 255
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "proyecto_docentes", ["proyecto_id"], name: "index_proyecto_docentes_on_proyecto_id", using: :btree

  create_table "proyecto_estudiantes", force: :cascade do |t|
    t.integer  "numControl",  limit: 4
    t.integer  "proyecto_id", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "proyecto_estudiantes", ["proyecto_id"], name: "index_proyecto_estudiantes_on_proyecto_id", using: :btree

  create_table "proyecto_inv_estudiantes", force: :cascade do |t|
    t.integer  "proyecto_investigacion_id", limit: 4
    t.integer  "numControl",                limit: 4
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "proyecto_inv_estudiantes", ["proyecto_investigacion_id"], name: "index_proyecto_inv_estudiantes_on_proyecto_investigacion_id", using: :btree

  create_table "proyecto_investigaciones", force: :cascade do |t|
    t.string   "numProyecto",                 limit: 255
    t.string   "nombreProy",                  limit: 255
    t.string   "cat_tipo_examen_proyecto_id", limit: 255
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "asesorExterno",               limit: 4
    t.date     "fechaInicio"
    t.date     "fechaTermino"
    t.string   "status",                      limit: 255
  end

  create_table "proyectos", force: :cascade do |t|
    t.string   "numProyecto",                 limit: 255
    t.string   "nombreProyecto",              limit: 255
    t.string   "status",                      limit: 255
    t.string   "asesorExterno",               limit: 255
    t.integer  "actividad_id",                limit: 4
    t.integer  "cat_tipo_examen_proyecto_id", limit: 4
    t.integer  "usuario_id",                  limit: 4
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.date     "fechaInicio"
    t.date     "fechaTermino"
    t.text     "descripcion",                 limit: 65535
    t.string   "periodo",                     limit: 255
    t.string   "rfcEmpresa",                  limit: 255
  end

  add_index "proyectos", ["actividad_id"], name: "index_proyectos_on_actividad_id", using: :btree
  add_index "proyectos", ["cat_tipo_examen_proyecto_id"], name: "index_proyectos_on_cat_tipo_examen_proyecto_id", using: :btree

  create_table "puestos", force: :cascade do |t|
    t.date     "fechaInicio"
    t.date     "fechaTermino"
    t.string   "pdfNombramiento",    limit: 255
    t.integer  "cat_tipo_puesto_id", limit: 4
    t.integer  "docente_id",         limit: 4
    t.string   "estado",             limit: 255
    t.integer  "usuario_id",         limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "puestos", ["cat_tipo_puesto_id"], name: "index_puestos_on_cat_tipo_puesto_id", using: :btree
  add_index "puestos", ["docente_id"], name: "index_puestos_on_docente_id", using: :btree

  create_table "requisito_evidencias", force: :cascade do |t|
    t.string   "nombreRequisito",  limit: 255
    t.string   "estado",           limit: 255
    t.integer  "cat_evidencia_id", limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "requisito_evidencias", ["cat_evidencia_id"], name: "index_requisito_evidencias_on_cat_evidencia_id", using: :btree

  create_table "reuniones", force: :cascade do |t|
    t.string   "numActa",    limit: 255
    t.date     "fecha"
    t.string   "pdfActa",    limit: 255
    t.integer  "usuario_id", limit: 4
    t.string   "estado",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "hora",       limit: 255
  end

  create_table "revisa_anteproyectos", force: :cascade do |t|
    t.date     "fecha_revicion"
    t.text     "observaciones_revision", limit: 65535
    t.string   "fk_curp",                limit: 255
    t.integer  "fk_id_anteproy",         limit: 4
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "servicio_sociales", force: :cascade do |t|
    t.integer  "calificacion",    limit: 4
    t.date     "fechaInicio"
    t.date     "fechaTermino"
    t.integer  "horas",           limit: 4
    t.integer  "estudiante_id",   limit: 4
    t.string   "estado",          limit: 255
    t.integer  "empresa_id",      limit: 4
    t.string   "pdfLiberacion",   limit: 255
    t.string   "observaciones",   limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "nombreE",         limit: 255
    t.string   "pdfPresentacion", limit: 255
    t.string   "pdfAceptacion",   limit: 255
  end

  add_index "servicio_sociales", ["empresa_id"], name: "index_servicio_sociales_on_empresa_id", using: :btree
  add_index "servicio_sociales", ["estudiante_id"], name: "index_servicio_sociales_on_estudiante_id", using: :btree

  create_table "solicitud_observaciones", force: :cascade do |t|
    t.string   "rfc",          limit: 255
    t.text     "observacion",  limit: 65535
    t.integer  "solicitud_id", limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "solicitud_observaciones", ["solicitud_id"], name: "index_solicitud_observaciones_on_solicitud_id", using: :btree

  create_table "solicitudes", force: :cascade do |t|
    t.string   "nombrep",                 limit: 255
    t.date     "fechaini"
    t.date     "fechater"
    t.string   "aexterno",                limit: 255
    t.string   "telefono",                limit: 255
    t.string   "extension",               limit: 255
    t.string   "correo",                  limit: 255
    t.string   "area",                    limit: 255
    t.integer  "numresidentes",           limit: 4
    t.string   "carrera",                 limit: 255
    t.string   "semestre",                limit: 255
    t.string   "ingles",                  limit: 255
    t.string   "horaentrada",             limit: 255
    t.string   "horasalida",              limit: 255
    t.string   "desproyecto",             limit: 255
    t.string   "objetivo",                limit: 255
    t.string   "actividades",             limit: 255
    t.string   "pc",                      limit: 255
    t.string   "tel_escritorio",          limit: 255
    t.string   "lugar",                   limit: 255
    t.string   "beca",                    limit: 255
    t.string   "observacion",             limit: 255
    t.string   "estado",                  limit: 255
    t.string   "rfc",                     limit: 255
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "periodo",                 limit: 255
    t.string   "rfc_docente_revisor",     limit: 255
    t.string   "estado_revision_docente", limit: 255
    t.string   "clave_solicitud",         limit: 255
  end

  create_table "tablapromedios", force: :cascade do |t|
    t.string   "nivel_desem", limit: 255
    t.float    "valor_min",   limit: 24
    t.float    "valor_max",   limit: 24
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "ubicacion_egresados_empresas", force: :cascade do |t|
    t.string   "num_prof",              limit: 255
    t.integer  "cant_mando_superior",   limit: 4
    t.integer  "cant_mando_intermedio", limit: 4
    t.integer  "cant_mando_tecnico",    limit: 4
    t.string   "otro_esp",              limit: 255
    t.integer  "otro_can",              limit: 4
    t.integer  "completamente",         limit: 4
    t.integer  "medianamente",          limit: 4
    t.integer  "ligeramente",           limit: 4
    t.integer  "ninguna_relacion",      limit: 4
    t.string   "requisitos",            limit: 255
    t.string   "carreras_demandan",     limit: 255
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "ubicacion_laborales", force: :cascade do |t|
    t.string   "act_dedica",               limit: 255
    t.string   "estudia",                  limit: 255
    t.string   "especialidad_institucion", limit: 255
    t.string   "tiempo_empleo",            limit: 255
    t.string   "medio_empleo",             limit: 255
    t.string   "requisitos_contratacion",  limit: 255
    t.string   "idioma_trabajo",           limit: 255
    t.integer  "hablar_idioma",            limit: 4
    t.integer  "escribir_idioma",          limit: 4
    t.integer  "leer_idioma",              limit: 4
    t.integer  "escuchar_idioma",          limit: 4
    t.string   "anti_empleo",              limit: 255
    t.string   "ano_ingreso",              limit: 255
    t.string   "ingreso",                  limit: 255
    t.string   "nivel_jerarquico",         limit: 255
    t.string   "condicion",                limit: 255
    t.string   "relacion",                 limit: 255
    t.string   "organismo",                limit: 255
    t.string   "giro",                     limit: 255
    t.string   "razon_social",             limit: 255
    t.string   "domicilio",                limit: 255
    t.string   "ciudad",                   limit: 255
    t.string   "municipio",                limit: 255
    t.string   "estado",                   limit: 255
    t.string   "telefno",                  limit: 255
    t.string   "ext",                      limit: 255
    t.string   "fax",                      limit: 255
    t.string   "email",                    limit: 255
    t.string   "pagina_web",               limit: 255
    t.string   "sector_primario",          limit: 255
    t.string   "sector_secundario",        limit: 255
    t.string   "sector_terciario",         limit: 255
    t.string   "tam_empresa",              limit: 255
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string   "rol",                    limit: 255
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "curp",                   limit: 255
    t.string   "rfc",                    limit: 255
    t.integer  "numControl",             limit: 4
  end

  add_index "usuarios", ["email"], name: "index_usuarios_on_email", unique: true, using: :btree
  add_index "usuarios", ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true, using: :btree

  create_table "viaje_grupos", force: :cascade do |t|
    t.integer  "curso_materia_id", limit: 4
    t.integer  "actividad_id",     limit: 4
    t.string   "estado",           limit: 255
    t.string   "usuario_id",       limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "viaje_grupos", ["actividad_id"], name: "index_viaje_grupos_on_actividad_id", using: :btree
  add_index "viaje_grupos", ["curso_materia_id"], name: "index_viaje_grupos_on_curso_materia_id", using: :btree

  create_table "viaje_itinerario_empresas", force: :cascade do |t|
    t.date     "fecha"
    t.string   "hora",        limit: 255
    t.integer  "visita_id",   limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "curpEmpresa", limit: 255
  end

  add_index "viaje_itinerario_empresas", ["visita_id"], name: "index_viaje_itinerario_empresas_on_visita_id", using: :btree

  create_table "visitas", force: :cascade do |t|
    t.string   "asunto",       limit: 255
    t.integer  "actividad_id", limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "estado",       limit: 255
    t.text     "objetivo",     limit: 65535
    t.text     "actividades",  limit: 65535
  end

  add_index "visitas", ["actividad_id"], name: "index_visitas_on_actividad_id", using: :btree

  add_foreign_key "actividad_docentes", "actividades"
  add_foreign_key "actividad_docentes", "cat_tipo_participaciones"
  add_foreign_key "actividad_docentes", "docentes"
  add_foreign_key "actividad_evidencias", "actividades"
  add_foreign_key "actividad_evidencias", "cat_evidencias"
  add_foreign_key "actividades", "cat_tipo_actividades"
  add_foreign_key "actualizaciones", "actividades"
  add_foreign_key "anexos", "proyectos"
  add_foreign_key "anexos", "reuniones"
  add_foreign_key "anteproyecto_estudiantes", "anteproyectos"
  add_foreign_key "anteproyecto_observaciones", "anteproyectos"
  add_foreign_key "archivo_docentes", "docentes"
  add_foreign_key "archivo_periodos", "periodo_curs_materias"
  add_foreign_key "archivo_prodep_docentes", "docentes"
  add_foreign_key "cat_materias", "cat_plan_cursos"
  add_foreign_key "convenio_honorarios", "docentes"
  add_foreign_key "criterio_evaluacion_servicios", "evaluacion_servicios"
  add_foreign_key "curso_evidencias", "curso_materias"
  add_foreign_key "curso_evidencias", "periodo_curs_materias"
  add_foreign_key "curso_materia_estudiantes", "curso_materias"
  add_foreign_key "curso_materias", "cat_materias"
  add_foreign_key "curso_materias", "periodo_curs_materias"
  add_foreign_key "docentes", "cat_departamentos"
  add_foreign_key "docentes", "usuarios"
  add_foreign_key "egresados", "cat_plan_cursos"
  add_foreign_key "egresados", "examen_profesionales"
  add_foreign_key "estadisticas", "curso_materias"
  add_foreign_key "estadisticas", "periodo_curs_materias"
  add_foreign_key "estudiantes", "cat_especialidades"
  add_foreign_key "examen_profesionales", "actividades"
  add_foreign_key "examen_profesionales", "cat_tipo_examen_proyectos"
  add_foreign_key "grado_estudios", "cat_tipo_grado_estudios"
  add_foreign_key "grado_estudios", "docentes"
  add_foreign_key "grupo_act_complementarias", "actividad_complementarias"
  add_foreign_key "horario_actualizaciones", "actualizaciones"
  add_foreign_key "horarios", "actualizacion_docente_profesionales"
  add_foreign_key "lib_actividad_docentes", "periodo_actividad_academicas"
  add_foreign_key "lib_curso_docentes", "periodo_liberacion_cursos"
  add_foreign_key "lib_doc_act_criterios", "lib_actividad_docentes"
  add_foreign_key "lib_doc_criterios", "lib_curso_docentes"
  add_foreign_key "liberacio_docente_cursos", "liberacion_cursos"
  add_foreign_key "materia_evidencias", "cat_materias"
  add_foreign_key "materia_evidencias", "periodo_curs_materias"
  add_foreign_key "modulo_diplomados", "actividades"
  add_foreign_key "oficio_externos", "oficios"
  add_foreign_key "oficio_reuniones", "reuniones"
  add_foreign_key "oficio_servicios", "servicio_sociales"
  add_foreign_key "oficios", "actividad_docentes"
  add_foreign_key "oficios", "actividades"
  add_foreign_key "proy_inv_docentes", "proyecto_investigaciones"
  add_foreign_key "proy_inv_documentos", "proyecto_investigaciones"
  add_foreign_key "proyecto_docente_evidencias", "proyecto_docentes"
  add_foreign_key "proyecto_docentes", "proyectos"
  add_foreign_key "proyecto_estudiantes", "proyectos"
  add_foreign_key "proyecto_inv_estudiantes", "proyecto_investigaciones"
  add_foreign_key "proyectos", "actividades"
  add_foreign_key "proyectos", "cat_tipo_examen_proyectos"
  add_foreign_key "puestos", "cat_tipo_puestos"
  add_foreign_key "puestos", "docentes"
  add_foreign_key "requisito_evidencias", "cat_evidencias"
  add_foreign_key "servicio_sociales", "estudiantes"
  add_foreign_key "solicitud_observaciones", "solicitudes"
  add_foreign_key "viaje_grupos", "actividades"
  add_foreign_key "viaje_grupos", "curso_materias"
  add_foreign_key "viaje_itinerario_empresas", "visitas"
  add_foreign_key "visitas", "actividades"
end
