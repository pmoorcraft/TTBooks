class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :admin?
  before_filter :set_page_title
  
  private

  def set_page_title
    @page_title = "Books and Videos for Entrepreneurs and Startups | TTBooks"
  end
  
  
  protected
  
  def admin?
    request.remote_ip == "192.168.1.255" || "192.168.1.92"

  end
  
  def authorize
    unless admin?
      flash[:error] = "unauthorized"
      redirect_to root_url
      false
    end
  end
end
