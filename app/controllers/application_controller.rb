class ApplicationController < ActionController::Base
    
    before_action :authenticate_user!, except: [:top, :about]
    before_action :configure_permitted_parameters, if: :devise_controller?

    
    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :introduction, :profile_image_id, :email])
    end
    
    private
    # ログイン後のリダイレクト先
    def after_sign_in_path_for(resource_or_scope)
        if  current_user.id
            user_path(current_user.id)
        end
    end
    
    # ログアウト後のリダイレクト先
    def after_sign_out_path_for(resource_or_scope)
        root_path
    end
    
end
