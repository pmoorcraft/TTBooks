class HomepageController < ApplicationController
  
  def index
    @videos = Video.all
  end
  
  def index_books
  end
  
end
