module ReunionesHelper
    def oficioA(num, actividad, f, par, puesto, firma, lema, des, jefe, cuota, nacional, tipoAnDe, nivelAp, tipoZona, motivo, pPartida, pLlegada, claseServ, importe, categoria, sueldo, modulo, docente, fechaPosterior, zona, importeViat, descripcion, jefeDivision, reunion, proyecto, numControl, servicio_social_id, fechaLibS)        
        x = Time.now 
        if f == ""
            x = Time.now            
            f = x.strftime("%d")+ "/" + x.strftime("%m") + "/" + x.strftime("%Y")
        end 
        anex = Anexo.find_by(reunion_id: reunion, proyecto_id: proyecto)
        
        if Oficio.find_by(reunion_id: reunion, proyecto_id: proyecto, numControl: numControl) == nil
            
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
                if anex == nil
                    a.anexo_id = nil
                else                
                    a.anexo_id = Anexo.find_by(reunion_id: reunion, proyecto_id: proyecto).id
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
                #if t == nil
                 #   a.actividad_docente_id = nil
                #end
                if anex == nil
                    a.anexo_id = nil
                else                
                    a.anexo_id = Anexo.find_by(reunion_id: reunion, proyecto_id: proyecto).id
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
                a.servicio_social_id = servicio_social_id
                a.fechaLibS = fechaLibS
                a.save
                return a    
            end            
        else 
            if anex == nil
                a = Oficio.find_by(reunion_id: reunion, proyecto_id: proyecto, numControl: numControl)             
            else                
                a = Oficio.find_by(reunion_id: reunion, anexo_id: anex.id, proyecto_id: proyecto, numControl: numControl)
            end
            
            a.update(fecha: f)
            
            return a
        end
    end 
    
    def existeAnex(reu, proyecto, numControl)
        a = false  
        if numControl == nil or numControl == ""
            if Oficio.find_by(reunion_id: reu) != nil
                    a = true
            end
        else
            aux = Anexo.find_by(reunion_id: reu, proyecto_id: proyecto).id
            if Oficio.find_by(reunion_id: reu, anexo_id: aux, proyecto_id: proyecto, numControl: numControl) != nil
                a = true
            end
        end
        return a
    end
    
    def existeConst(reu, doc)
        a = false  
        if doc == nil or doc == ""
            if OficioLiberacionAcademica.find_by(reunion_id: reu) != nil
                a = true
            end
        else
            if OficioLiberacionAcademica.find_by(reunion_id: reu, docente_id: doc) != nil
                a = true
            end
        end
        return a
    end
    
    def oficioConstancia(f, docente, periodo, asistencia, participacion, asesoriaTitulacion, propuesta, sinodales, partiEvento, contribucion, desarrollo, propuestaBanco, asesoriaAcad, tutoria, particComision, otro, otros, cumplio, jefeDpto, presidAcad, reunion)        
        x = Time.now 
        if f == ""
            x = Time.now            
            f = x.strftime("%d")+ "/" + x.strftime("%m") + "/" + x.strftime("%Y")
        end 
    
        if OficioLiberacionAcademica.find_by(reunion_id: reunion, docente_id: docente) == nil
            a = OficioLiberacionAcademica.new                 
            a.fecha = f                
            a.docente_id = docente
            a.periodo = periodo
            a.asistencia = asistencia 
            a.participacion = participacion
            a.asesoriaTitulacion = asesoriaTitulacion
            a.propuesta = propuesta
            a.sinodales = sinodales
            a.partiEvento = partiEvento
            a.contribucion = contribucion
            a.desarrollo = desarrollo 
            a.propuestaBanco = propuestaBanco
            a.asesoriaAcad = asesoriaAcad
            a.tutoria = tutoria
            a.particComision = particComision
            a.otro = otro
            a.otros = otros
            a.cumplio = cumplio
            a.jefeDpto = jefeDpto
            a.presidAcad = presidAcad
            a.reunion_id = reunion
            a.save
            return a    
        else 
            a = OficioLiberacionAcademica.find_by(reunion_id: reunion, docente_id: docente) 
            a.update(fecha: f)
            return a
        end
    end 
end