class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :configure_permitted_parameters, if: :devise_controller?
  after_filter :store_location
  protect_from_forgery with: :exception

  def admin_required
    if !current_user.admin?
      redirect_to "/"
    end
  end

  private

    def store_location
      # store last url as long as it isn't a /users path
      session[:previous_url] = request.env['HTTP_REFERER'] unless request.env['HTTP_REFERER'] =~ /\/users/
    end

    def after_sign_in_path_for(resource)
      session[:previous_url] || root_path
    end

    def after_sign_out_path_for(resource)
      request.referrer
    end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end
end
