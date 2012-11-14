class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def current_site
    if request.domain == "livehours.co"
      @current_site ||= Site.find_by_permalink("livehours")
    else
      @current_site ||= Site.find_by_permalink(request.subdomain)
    end
  end
  helper_method :current_site
  
  def current_design
    @current_design ||= current_site.design
  end
  helper_method :current_design
end
