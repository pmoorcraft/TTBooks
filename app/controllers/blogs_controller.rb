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
    @blogs = Blog.all
    @page_title = "The latest news on startup talks and videos | TTBooks Blog"
  end
  
  def show
    @blog = Blog.find(params[:id])
    @page_title = "TTBooks blog- #{@blog.title}"
  end
  
  private
  def blog_params
     params.require(:blog).permit(:title, :body) 
  end
  
  def set_page_title
   @page_title = "The latest news on startup talks and videos | TTBooks Blog"
  end
end
