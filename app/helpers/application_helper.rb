module ApplicationHelper
    def sortable (column, title = nil)
		title ||= titulo (column)
		direction = (column == params[:sort] && params[:direction] == "asc") ? "desc" : "asc"
		link_to title, sort: column, direction: direction		
	end

	def titulo (column)
        #FILTRAR ACTIVIDADES
		if column == "cat_tipo_actividad_id"
			"Tipo actividad"
		elsif column == "tipoComision"
			"Tipo comisión"
        elsif  column == "nombreProy"
            "Nombre del proyecto"            
		elsif column == "tipoEvidencia"
			"Tipo evidencia"
        elsif column == "nombreActividad"
            "Nombre actividad"
        #FILTRAR ACTIVIDAD EVIDENCIA DOCENTE
        elsif column == "cat_evidencia_id"
            "Tipo evidencia"
        elsif column == "pdfEvidencia"
            "Evidencia"
        #FILTRAR ACTIVIDAD COMPLEMENTARIA
        elsif column == "actividad_id"
            "Actividad"
        elsif column == "numCredito"
            "Número de créditos"
        elsif column == "fechaInicio"
            "Duración"
        elsif column == "fechaTermino"
            "Fecha de término"
        elsif column == "docente_id"
            "Docente"
        #FILTRAR ACTUALIZACION
        elsif column == "tipoPeriodo"
            "Periodo"
        elsif column == "tipoActualizacion"
            "Actualización"
        elsif column == "modalidad"
            "Modalidad"
        elsif column == "horasCapacitacion"
            "Horas de capacitación"
        elsif column == "area"
            "Lugar"
        #CAT DEPARTAMENTO
        elsif column == "nombreDpto"
            "Departamento"
        elsif column == "estado"
            "Estado"
        #CAT ESPECIALIDAD
        elsif column == "nombreEsp"
            "Carrera"
        elsif column == "alias"
            "Alías"
        #CAT EVIDENCIA
        elsif column == "nombreEvidencia"
            "Evidencia"
        #PLAN DE CURSO
        elsif column == "descripcion"
            "Plan de estudio"
        #MATERIA
        elsif column == "claveMateria"
            "Clave"
        elsif column == "nombreMat"
            "Materia"
        elsif column == "credito"
            "Núm. crédito"
        elsif column == "temario"
            "Temario"
        #CAT TIPO ACTIVIDAD
        elsif column == "nombreTipoAct"
            "Tipo actividad"
        #CAT TIPO EXAMEN PROYECTO
        elsif column == "nombreTipoP"
            "Tipo Examen/Proyecto"
        #CAT GRADO ESTUDIO
        elsif column == "nombreTipoGrado"
            "Grado de estudio"
        #CAT TIPO PARTICIPACION
        elsif column == "participacion"
            "Tipo de participación"
        #CAT TIPO PUESTO
        elsif column == "nombrePuesto"
            "Tipo de puestos"
        #CAT VIATICO
        elsif column == "nombreViatico"
            "Tipo de viático"
        #CURSO MATERIA
        elsif column == "nombreGrupo"
            "Grupo-Aula"
        elsif column == "periodo"
            "Periodo"
        elsif column == "cat_materia_id"
            "Materia"
        elsif column == "pdfInstrumentacion"
            "Instrumentacion"
        #DOCENTE
        elsif column == "curp"
            "Curp"
        elsif column == "rfc"
            "Rfc"
        elsif column == "clavePresupuestal"
            "Clave presupuestal"
        elsif column == "nombreD"
            "Nombre"
        elsif column == "email"
            "Correo electrónico"
        elsif column == "cat_departamento_id"
            "Departamento"
        elsif column == "tipoDocente"
            "Tipo de Docente"
        #ESTUDIANTE
        elsif column == "nombre"
            "Nombre"
        elsif column == "curpEstudiante"
            "Curp"
        elsif column == "numControl"
            "Número de control"
		elsif column == "cat_especialidad_id"
			"Especialidad"
		elsif column == "genero"
			"Género"
        #EMPRESA
        elsif column == "rfcEmpresa"
            "Rfc"
        elsif column == "nombreE"
            "Nombre de la empresa"
        elsif column == "contacto"
            "Contacto"
        elsif column == "telefono"
            "Telefono"
        elsif column == "pdfConvenio"
            "Convenio"
        elsif column == "estadoEmp"
            "Estado"
        #Proyectos
        elsif column == "numProyecto"
            "Número de proyecto"
        elsif column == "nombreProyecto"
            "Nombre del proyecto"
        elsif column == "status"
            "Status"
        elsif column == "asesorExterno"
            "Asesor externo"
        elsif column == "cat_tipo_examen_proyecto"
            "Tipo de proyecto"
        elsif column == "numActa"
            "Número de acta"
        elsif column == "fecha"
            "Fecha"
        elsif column == "pdfActa"
            "Pdf Acta"
        #PUESTO
        elsif column == "cat_tipo_puesto_id"
            "Cargo"
        #SERVICIO SOCIAL
        elsif column == "calificaion"
            "Calificación"
        elsif column == "calificacion" 
            "Calificación final"
        elsif column == "horas"
            "Total de horas"
        elsif column == "empresa_id"
            "Empresa"
        elsif column == "pdfLiberacion"
            "Pdf liberación"
        elsif column == "observaciones"
            "Observaciones"
        elsif column == "estudiante_id"
            "Estudiante"
        #VIAJE GRUPO
        elsif column == "curso_materia_id"
            "Grupo"
        #VISITA
        elsif column == "asunto"
            "Asunto"
        #ITINERARIO
        elsif column == "rfcEmpresa"
            "Empresa"
        elsif column == "hora"
            "Hora"
		#OFICIO
		elsif column == 'numero'
			"Núm. oficio"
		elsif column == 'anio'
			"Año"
		else
			column.titleize
		end
	end
    def dias(dia)
        case dia
            when "Monday"
                dia = "Lunes"
            when "Tuesday"
                dia = "Martes"
            when "Wednesday"
                dia = "Miércoles"
            when "Thursday"
                dia = "Jueves"
            when "Friday"
                dia = "Viernes"
            when "Saturday"
                dia = "Sábado"
            when "Sunday"
                dia = "Domingo"
        end
        return dia
    end

    def meses(mes)
        case mes
            when 1
                mes = "ENERO"
            when 2
                mes = "FEBRERO"
            when 3
                mes = "MARZO"
            when 4
                mes = "ABRIL"
            when 5
                mes = "MAYO"
            when 6
                mes = "JUNIO"
            when 7
                mes = "JULIO"
            when 8
                mes = "AGOSTO"
            when 9
                mes = "SEPTIEMBRE"
            when 10
                mes = "OCTUBRE"
            when 11
                mes = "NOVIEMBRE"
            when 12
                mes = "DICIEMBRE"
        end
        return mes
    end
    
    def oficioN (num, actividad, f, par, puesto, firma, lema, des, jefe, cuota, nacional, tipoAnDe, nivelAp, tipoZona, motivo, pPartida, pLlegada, claseServ, importe, categoria, sueldo, modulo, docente, fechaPosterior, zona, importeViat, descripcion, jefeDivision, reunion, proyecto, numControl, servicio_social_id, fechaLibS)        
        x = Time.now 
        if f == ""
            x = Time.now            
            f = x.strftime("%d")+ "/" + x.strftime("%m") + "/" + x.strftime("%Y")
        end        
        t = ActividadDocente.find_by(actividad_id: actividad, docente_id: par)
        if Oficio.find_by(actividad_id: actividad, docente: par, modulo: modulo) == nil
            
            if Oficio.find_by(numero: num) == nil 
                         
                a = Oficio.new                 
                if num == ""                                   
                        a.numero = Oficio.order(numero: :desc).first.numero + 1                        
                    else
                        a.numero = num                       
                end
                a.fecha = f                
                a.anio = x.strftime("%Y")
                a.actividad_id = actividad
                a.jefe = jefe        
                if t == nil
                    a.actividad_docente_id = nil
                else                
                    a.actividad_docente_id = ActividadDocente.find_by(actividad_id: actividad, docente_id: par).id
                end
                a.participacion = puesto
                a.firma = firma
                a.lema = lema
                a.destinatario = des
                a.cuota = cuota
                a.motivo = motivo
                a.tipoAnDe = tipoAnDe
                a.nivelAp = nivelAp
                a.tipoZona = tipoZona
                a.nacionall = nacional
                a.pPartida = pPartida
                a.pLlegada = pLlegada
                a.claseServ = claseServ
                a.importe = importe
                a.categoria = categoria
                a.sueldo = sueldo
                a.modulo = modulo
                a.docente = docente
                a.fechaPosterior = fechaPosterior
                a.zona = zona
                a.importeViat = importeViat
                a.descripcion = descripcion
                a.jefeDivision = jefeDivision
                a.reunion_id = reunion
                a.proyecto_id = proyecto
                a.numControl = numControl
                a.anexo_id = nil
                a.servicio_social_id = servicio_social_id
                a.fechaLibS = fechaLibS
                a.save
                return a
            else
                x = Time.now          
                a = Oficio.new                                    
                a.numero = Oficio.order(numero: :desc).first.numero + 1
                a.fecha = f                
                a.anio = x.strftime("%Y")
                a.actividad_id = actividad
                if t == nil
                    a.actividad_docente_id = nil
                else                
                    a.actividad_docente_id = ActividadDocente.find_by(actividad_id: actividad, docente_id: par).id
                end
                
                a.participacion = puesto
                a.jefe = jefe
                a.firma = firma
                a.lema = lema
                a.destinatario = des
                a.cuota = cuota
                a.motivo = motivo
                a.tipoAnDe = tipoAnDe
                a.nivelAp = nivelAp
                a.tipoZona = tipoZona
                a.nacionall = nacional
                a.pPartida = pPartida
                a.pLlegada = pLlegada
                a.claseServ = claseServ
                a.importe = importe
                a.categoria = categoria
                a.sueldo = sueldo
                a.modulo = modulo
                a.docente = docente
                a.fechaPosterior = fechaPosterior
                a.zona = zona
                a.importeViat = importeViat
                a.descripcion = descripcion
                a.jefeDivision = jefeDivision
                a.reunion_id = reunion
                a.proyecto_id = proyecto
                a.numControl = numControl
                a.anexo_id = nil
                a.servicio_social_id = servicio_social_id
                a.fechaLibS = fechaLibS
                a.save
                return a    
            end            
        else                        
            if t == nil                
                a = Oficio.find_by(actividad_id: actividad)
            else
                a = Oficio.find_by(actividad_id: actividad, actividad_docente_id: t.id)
            end
            a.update(fecha: f, participacion: puesto, cuota: cuota, motivo: motivo, tipoAnDe: tipoAnDe, nivelAp: nivelAp, tipoZona: tipoZona, nacionall: nacional, pPartida: pPartida, pLlegada: pLlegada, claseServ: claseServ, importe: importe, categoria: categoria, sueldo: sueldo, modulo: modulo, fechaPosterior: fechaPosterior, zona: zona, importeViat: importeViat)
            return a
        end
    end
    
    def serie
        x = Time.now
        arre = []
		numTOficio = 1000
        a = Oficio.where(anio: x.strftime("%Y")).order(:numero)        
        if a == []
			t = 1
			while t <= numTOficio
				arre.push( t)
				t = t + 1
			end
        else
            count = Oficio.order(:numero).last.numero        
            x = 1   
            i = 0
            
            while x <= numTOficio do
				if a[i] == nil
					arre.push(x)
				else
					if a[i].numero != x
						arre.push(x)
					else
						i = i + 1
					end
				end
				x = x + 1
                 #if a[i].numero != x
                    #arre.push( x )                
                 #else
                    #i = i + 1
                 #end             
                 #x = x + 1
            end
            arre.push(x)
	    	arre.push( x + 1 )
            arre.push( x + 2 )
        end
        return arre
    end

    def existe (act, doc)
        a = false               
        if doc == nil or doc == ""                
            if Oficio.find_by(actividad_id: act) != nil
                a = true
            end
        else    
            aux = ActividadDocente.find_by(actividad_id: act, docente_id: doc).id
            if Oficio.find_by(actividad_id: act, actividad_docente_id: aux ) != nil
                a = true
            end
        end
        
        return a
    end    
    
    def existeOAM (act, doc, mod)
        a = false               
        if doc == nil or doc == ""
            if mod == nil or moc == ""
                if Oficio.find_by(actividad_id: act) != nil
                    a = true
                end
            end
        else    
            aux = ActividadDocente.find_by(actividad_id: act, docente_id: doc).id
            dip = ModuloDiplomado.find_by(actividad_id: act)
            if Oficio.find_by(actividad_id: act, actividad_docente_id: aux, modulo: mod ) != nil
                a = true
            end
        end
        
        return a
    end 

    def semestre (mes) 
        return mes.between? 1, 7
    end
end