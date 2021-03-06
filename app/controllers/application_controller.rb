class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_page_title
  
  private

  def set_page_title
    @page_title = " TTBook | Books and Videos for Entrepreneurs and Startups"
  end
  
  
  protected
  

end
