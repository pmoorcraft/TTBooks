class VideosController < ApplicationController
  before_filter :authorize
  
  def new
    @video = Video.new
  end
  
  def create
       
    @video = Video.create(video_params)
    if @video.save
      redirect_to root_url
    else
     redirect_to root_url
      flash[:notice] = "Error"
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
  
  def video_params
    params.require(:video).permit( :title, :url, :description, :uploaded, :speakers,:tag, :header, :genre)
  end
  
  
end
