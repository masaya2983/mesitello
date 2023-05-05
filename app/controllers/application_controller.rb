class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top]
  before_action :configue_permeters, if :devise_controller?
   def after_sign_in_path_for(resource)
    post_images_path
  　end

   def after_sign_in_path_for(resource)
     about_path
   end
    def after_sign_out_path_for(resource)
    about_path
    end

protected

   def countigure_parameters
     devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
   end
   def show
    @post_image = index
   end
   end



