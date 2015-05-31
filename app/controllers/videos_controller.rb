class VideosController < ApplicationController

  before_filter :set_page_title
  
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
  
  def upvotevideo
   video = Video.find(params[:id])
   video.vote!(request.ip)

   redirect_to root_url
  end
  
  def show
    @video = Video.find(params[:id])
    @page_title = "#{@video.title} | TTBooks"
  end
  
  private
  
  def video_params
    params.require(:video).permit( :title, :url, :description, :uploaded, :speakers,:tag, :header, :genre)
  end
  
  def set_page_title
    @page_title = "TTBooks | Books and Videos for Entrepreneurs and Startups"
  end
  
end
