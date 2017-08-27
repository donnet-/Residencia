class Usuarios::SessionsController < Devise::SessionsController
  layout 'application' #specifies that the template app/views/layouts/login.html.erb should be used instead of app/views/layouts/application.html.erb for the login page

  #configure auto_session_timeout
  def active
    # this method comes from auto-session-timeout gem
    #render_session_status

    # if your devise model is NOT named as `user`, use the code below
    # instead of the above code.
    # replace `user` in `current_user` with your devise model's name. (i.e. admin)
    
    # response.headers["Etag"] = ""  # clear etags to prevent caching
     render text: !!current_usuario, status: 200
  end

  def timeout
    flash[:notice] = "Su sesión ha expirado."
    # you may change this to any_desired_path
    redirect_to "/usuarios/sign_in"
      #root_path
    end
end