class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
    before_action :devise_parameter_sanitizer, if: :devise_controller?

   def devise_parameter_sanitizer
       if resource_class == Investor
           Investor::ParameterSanitizer.new(Investor, :investor, params)
       elsif resource_class == Corporation
           Corporation::ParameterSanitizer.new(Corporation, :corporation, params)
       end
       	
   end
end