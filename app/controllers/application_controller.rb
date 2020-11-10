class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    before_action :authenticate_user!, except: [:index, :show]
    before_action :configure_permitted_parameters, if: :devise_controller?
    # before_action :set_shopping_cart

    protected

        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
            devise_parameter_sanitizer.permit(:sign_in, keys: [:username])
            devise_parameter_sanitizer.permit(:account_update, keys: [:username])
        end

end
