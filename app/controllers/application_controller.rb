class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def current_site
    @current_site ||= Site.find_by_permalink(request.subdomain)
  end
  helper_method :current_site
  
  def current_design
    @current_design ||= current_site.design
  end
  helper_method :current_design
end
