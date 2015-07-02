class VideosController < ApplicationController
  http_basic_authenticate_with name: "pedro", password: "12345qwer", only: [:edit, :create, :delete]
  before_filter :set_page_title
  
  def new
    @video = Video.new
  end
  
  def create
       
    @video = Video.create(video_params)
    if @video.save
      redirect_to @video
      expire_fragment("index")
    else
     redirect_to root_url
      flash[:notice] = "Error"
    end
    
  end
  
  def edit
    @video = Video.find(params[:id])
  end
  
  def update
    @video = Video.find(params[:id])
    @video.update(video_params)
    redirect_to @video
      
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
   expire_fragment("index")
   redirect_to root_url
  end
  
  def show
    @video = Video.find(params[:id])
    @page_title = "#{@video.title} | TTBooks"
    @og_title = "#{@video.title} | TTBooks"
    @og_descrption = "#{@video.description} | TTBooks"
    @og_image = "#{@video.image_url}"
    fresh_when @video
  end
  
  private
  
  def video_params
    params.require(:video).permit( :title, :url, :description, :uploaded, :speakers,:tag, :header, :genre, :image_url, :related1, :related2, :related3, :related1name, :related2name, :related3name)
  end
  
  def set_page_title
    @page_title = "TTBooks | Books and Videos for Entrepreneurs and Startups"
    
  end
  
end
