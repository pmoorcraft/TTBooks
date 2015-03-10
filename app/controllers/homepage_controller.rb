class HomepageController < ApplicationController
  
  def index2
    
  end
  
  def index
    @books = Book.all
    @videos = Video.all
  end
  
end
