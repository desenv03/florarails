class ApplicationController < ActionController::Base
#  helper :all
  #include all helpers, all the time
  
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
