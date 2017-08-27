module ServicioSocialesHelper
    def oficioS(num, actividad, f, par, puesto, firma, lema, des, jefe, cuota, nacional, tipoAnDe, nivelAp, tipoZona, motivo, pPartida, pLlegada, claseServ, importe, categoria, sueldo, modulo, docente, fechaPosterior, zona, importeViat, descripcion, jefeDivision, reunion, proyecto, numControl, servicio_social_id, fechaLibS)        
        x = Time.now 
        if f == ""
            x = Time.now            
            f = x.strftime("%d")+ "/" + x.strftime("%m") + "/" + x.strftime("%Y")
        end 
        servicio = ServicioSocial.find(servicio_social_id)
        if Oficio.find_by(servicio_social_id: servicio_social_id, fecha: f) == nil
            
            if Oficio.find_by(numero: num) == nil 
                         
                a = Oficio.new                 
                if num == ""                                   
                        a.numero = Oficio.order(numero: :desc).first.numero + 1                        
                    else
                        a.numero = num                       
                end
                a.fecha = f                
                a.anio = x.strftime("%Y")
                a.actividad_id = nil
                a.jefe = nil
                a.participacion = nil
                a.firma = nil
                a.lema = lema
                a.destinatario = nil
                a.cuota = nil
                a.motivo = nil
                a.tipoAnDe = nil
                a.nivelAp = nil
                a.tipoZona = nil
                a.nacionall = nil
                a.pPartida = nil
                a.pLlegada = nil
                a.claseServ = nil
                a.importe = nil
                a.categoria = nil
                a.sueldo = nil
                a.modulo = nil
                a.docente = nil
                a.fechaPosterior = nil
                a.zona = nil
                a.importeViat = nil
                a.descripcion = descripcion
                a.jefeDivision = nil
                a.reunion_id = nil
                a.proyecto_id = nil
                a.numControl = nil
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
                a.actividad_id = nil
                a.actividad_docente_id = nil
                a.participacion = nil
                a.jefe = nil
                a.firma = nil
                a.lema = lema
                a.destinatario = nil
                a.cuota = nil
                a.motivo = nil
                a.tipoAnDe = nil
                a.nivelAp = nil
                a.tipoZona = nil
                a.nacionall = nil
                a.pPartida = nil
                a.pLlegada = nil
                a.claseServ = nil
                a.importe = nil
                a.categoria = nil
                a.sueldo = nil
                a.modulo = nil
                a.docente = nil
                a.fechaPosterior = nil
                a.zona = nil
                a.importeViat = nil
                a.descripcion = descripcion
                a.jefeDivision = nil
                a.reunion_id = nil
                a.proyecto_id = nil
                a.numControl = nil
                a.servicio_social_id = servicio_social_id
                a.fechaLibS = fechaLibS
                a.save
                return a    
            end            
        else 
            a = Oficio.find_by(numero: num, servicio_social_id: servicio_social_id, fechaLibS: fechaLibS) 
            if a != nil
                 a.update(fechaLibS: fechaLibS, descripcion: descripcion)  
            else
                a = Oficio.find_by(numero: num, servicio_social_id: servicio_social_id, fecha: f)
            end
            return a
        end
    end 
    
    def existeS(serv)#, fecha, fechaLibS)
        a = false  
        o = Oficio.find_by(servicio_social_id: serv)
        if o != nil && o.fecha != nil
            a = true
        else 
            a = false
        end
        return a
    end
    
    def existeSS(serv)#, fecha, fechaLibS)
        a = false  
        o = Oficio.where(servicio_social_id: serv).order(:servicio_social_id, :numero).last        
        if o != nil && o.fechaLibS != nil
            a = true
        end
        return a
    end
    def serieS
        x = Time.now
        arre = []
        a = OficioServicio.where(anio: x.strftime("%Y")).order(:numero)        
        if a == []
            arre.push( 1 )
            arre.push( 2 )
        else
            count = OficioServicio.order(:numOficio).last.numOficio       
            x = 1   
            i = 0
            
            while x <= count do                                   
                 if a[i].numOficio != x
                    arre.push( x )                
                 else
                    i = i + 1
                 end             
                 x = x + 1
            end
	    arre.push( x + 1 )
            arre.push( x + 2 )
        end
        return arre
    end

    def existeS (serv)
        a = false               
        if OficioServicio.find_by(servicio_social_id: serv) != nil
            a = true
        end
        
        return a
    end
end