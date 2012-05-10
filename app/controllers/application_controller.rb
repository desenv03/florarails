class ApplicationController < ActionController::Base
  #  helper :all
  #include all helpers, all the time
  
  def cliente_autenticado?
    if not session[:cliente_id]
      flash[:importante] = "Por favor efetue login!"
      redirect_to(:controller => :acessos, 
                  :action => :login)
      return false
    end
      return true
  end
  
  protect_from_forgery :only => [:create, :upate, :destroy]
  
  #See ActionController::RequestForgeryProtection for
  #details
  #  before_filter :set_charset
  #  def set_charset
  #    headers["Content-Type"] = 
  #    "text/html; charset=ISO-8859"
  #  end
    #Scrub sensitive parameters from your log
    #filter_parameter_logging :password
end
