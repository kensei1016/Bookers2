class ApplicationController < ActionController::Base
before_action :confiture_permitted_parameters, if: :devise_controller?

protected

def confiture_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
end

end
