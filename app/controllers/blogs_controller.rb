class BlogsController < ApplicationController
  before_filter :set_page_title
  
  def new
    @blog = Blog.new
  end
  
  def create
    @blog = Blog.new(blog_params) 
    if @blog.save
      redirect_to root_url
    else
      redirect_to root_url
      flash[:notice] = "Error"
    end
  end
  def index
    @blogs = Blog.all.order("created_at DESC")
    @page_title = "TTBooks Blog | Books and Videos for Entrepreneurs and Startups"
  end
  
  def show
    @blog = Blog.find(params[:id])
    @page_title = "#{@blog.title} | TTBooks blog"
  end
  
  private
  def blog_params
     params.require(:blog).permit(:title, :body) 
  end
  
  def set_page_title
   @page_title = "TTBooks | Books and Videos for Entrepreneurs and Startups"
  end
end
