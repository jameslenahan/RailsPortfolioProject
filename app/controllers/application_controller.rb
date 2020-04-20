class ApplicationController < ActionController::Base
  protect_from_forgery with :exception #protects from CSRF - cross-site request forgery. i.e. keeping it between user & server

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || root_path #saves user location
    end
end
