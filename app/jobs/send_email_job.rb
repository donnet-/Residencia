class SendEmailJob < ActiveJob::Base
  queue_as :default

  def perform(user)
    @user = user
    ModelMailer.notificaciones(@user).deliver_later
  end
end
