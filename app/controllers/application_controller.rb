class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
    before_action :configure_permitted_parameters

    protected 
       def configure_permitted_parameters 
           devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :favorite_color])
       end
end