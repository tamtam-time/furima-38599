class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?


  private



  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email, :password, :encrypted_password, :first_name, :last_name, :first_name_yomi, :last_name_yomi, :birthday,])
  end

end
