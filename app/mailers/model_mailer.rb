class ModelMailer < ApplicationMailer
  helper ApplicationHelper
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.model_mailer.notificaciones.subject
  #
  def notificaciones(users, reunion)
    @greeting = "Hi"
    @users = users
    @reunion = reunion
    mail(bcc: users.map(&:email).uniq, subject: "Reunion de academia")
  end
  def profesionales(users, examen)
    @users = []
    @examen = examen
    users.each do |us|      
      @users.push(us.docente)
    end    
    mail(bcc: @users.map(&:email).uniq, subject: "Examen profesional")
  end
end
