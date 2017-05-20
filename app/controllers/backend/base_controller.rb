module Backend
 class BaseController < ActionController::Base
   layout "layouts/application"
   protect_from_forgery with: :exception
   include SessionsHelper

   before_action :logged_in_user
 end
end
