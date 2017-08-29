class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
    
  helper_method :execute_statement
  
  before_action :configure_permitted_parameters, if: :devise_controller?
    
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
    
    def current_ability
        @current_ability ||= Ability.new(current_usuario)
    end

    # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_usuario!
  auto_session_timeout 20.minutes
    
  def execute_statement(sql)
    results = ActiveRecord::Base.connection.execute(sql)
    if results.present?
      return results
    else
      return nil
    end
  end
  
  protected
    
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :rol, :curp, :rfc, :numControl])
    end

  private 
    def after_sign_out_path_for(resource)
          root_path
    end  
end
