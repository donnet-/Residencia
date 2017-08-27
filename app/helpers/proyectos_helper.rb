module ProyectosHelper
    def oficioVinculacion(numOficio, fecha, proyecto_id, proyecto_docente_id, proyecto_estudiante_id, lema, plan_estudio_id, jefeDpto, jefeVinculacion, subAcademico, fechaLiberacion)  
        x = Time.now
        if fecha == ""
            fecha = x.strftime("%d") + "/" + x.strftime("%m") + "/" + x.strftime("%Y")
        end
        
        if OficioVinculacion.find_by(proyecto_id: proyecto_id, proyecto_docente_id: proyecto_docente_id, proyecto_estudiante_id: proyecto_estudiante_id) == nil
            if OficioVinculacion.find_by(numOficio: numOficio) == nil
                a = OficioVinculacion.new
                if numOficio == ""
                    a.numOficio = OficioVinculacion.order(numOficio: :desc).first.numOficio + 1
                else
                    a.numOficio = numOficio
                end
                a.anio = x.strftime("%Y")
                a.fecha = fecha
                a.proyecto_id = proyecto_id
                a.proyecto_docente_id = proyecto_docente_id
                a.proyecto_estudiante_id = proyecto_estudiante_id
                a.lema = lema
                a.plan_estudio_id = plan_estudio_id
                a.jefeDpto = jefeDpto
                a.jefeVinculacion = jefeVinculacion
                a.subAcademico = subAcademico
                a.fechaLiberacion = fechaLiberacion
                a.save
                return a
            else
                x = Time.now
                a = OficioVinculacion.new
                a.numOficio = OficioVinculacion.order(numOficio: :desc).first.numOficio+1
                a.fecha = fecha
                a.anio = x.strftime("%Y")
                a.proyecto_id = proyecto_id
                a.proyecto_docente_id = proyecto_docente_id
                a.proyecto_estudiante_id = proyecto_estudiante_id
                a.lema = lema
                a.plan_estudio_id = plan_estudio_id
                a.jefeDpto = jefeDpto
                a.jefeVinculacion = jefeVinculacion
                a.subAcademico = subAcademico
                a.fechaLiberacion = fechaLiberacion
                a.save
                return a
            end
        else
            if proyecto_docente_id == nil
                a = OficioVinculacion.find_by(proyecto_id: proyecto_id)
            else
                a = OficioVinculacion.find_by(proyecto_id: proyecto_id, proyecto_docente_id: proyecto_docente_id, proyecto_estudiante_id: proyecto_estudiante_id)
            end
            a.update(fecha: fecha, plan_estudio_id: plan_estudio_id, fechaLiberacion: fechaLiberacion)
            return a
        end
    end
    
    def serieOficioV
        x = Time.now
        arre = []
        numTOficio = 500
        aux = OficioVinculacion.where(anio: x.strftime("%Y")).order(:numOficio)
        if aux == []
            t = 1
            while t <= numTOficio
                arre.push(t)
                t = t + 1
            end
        else
            x = 1
            i = 0
            while x < numTOficio do
                if aux[i] == nil
                    arre.push(x)
                else
                    if aux[i].numOficio != x
                        arre.push(x)
                    else
                        i = i + 1
                    end
                end
                x = x + 1
            end
            arre.push(x)
            arre.push(x+1)
            arre.push(x+2)
        end
        return arre
    end

    def existeOficioV(proyecto_id, proyecto_docente_id, proyecto_estudiante_id)
        bandera = false
        if proyecto_docente_id == nil or proyecto_docente_id == ""
            if proyecto_estudiante_id == nil or proyecto_estudiante_id == ""
                if ProyectoVinculacion.find_by(proyecto_id: proyecto_id) != nil 
                    bandera == true
                end
            else
            end
        else
            if OficioVinculacion.find_by(proyecto_id: proyecto_id, proyecto_docente_id: proyecto_docente_id, proyecto_estudiante_id: proyecto_estudiante_id) != nil
                bandera = true
            end
        end
        return bandera
    end
end