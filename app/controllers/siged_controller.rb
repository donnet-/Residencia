class SigedController < ApplicationController
  after_action :authenticate_usuario!
    def index
        if usuario_signed_in?
            if current_usuario.rol == 'admin'
                render template: 'siged/menuAdmin'
            elsif current_usuario.rol == "docente"
               doc = Docente.find_by(email: current_usuario.email)
             if  doc.usuario_id == nil
                   redirect_to edit_docente_path(doc)
             else
                   render template: "siged/menuDocente"
             end
            elsif current_usuario.rol == "estudiante"
                x = Estudiante.find_by(email: current_usuario.email)
                if x.usuario_id == nil                    
                    redirect_to edit_estudiante_path(x)
                else
                    render template: 'siged/menuEstudiante'
                end
            end
        end      
    end
end