class VideosController < ApplicationController
  
  def new
    @video = Video.new
  end
  
  def create
    @video = Video.create
    
   
    end
  end
  
  def edit
  end
  
  def delete
  end
  
  def this_month
  end
  
  def index
    @videos = Video.all
  end
  
  private
  
  
end
