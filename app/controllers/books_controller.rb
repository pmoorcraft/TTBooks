class BooksController < ApplicationController
  http_basic_authenticate_with name: "pedro", password: "12345qwer", only: [:edit, :create, :delete]
  
  before_filter :set_page_title
  
  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params) 
    if @book.save
      redirect_to @book
    else
      redirect_to root_url
      flash[:notice] = "Error"
    end
  end
  
  def edit
     @book = Book.find(params[:id]) 
  end
  
  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to @book
      
  end
  
  def delete
  end

  
  def upvotebook
   book = Book.find(params[:id])
   book.vote!(request.ip)

   redirect_to root_url
  end
  
  def show
    @book = Book.find(params[:id])
    @page_title = "#{@book.title} | TTBooks"
    @og_title = "#{@book.title} | TTBooks"
    @og_descrption = "#{@book.header} | TTBooks"
    @og_image = "#{@book.imageurl}"
    fresh_when @book
  end
  
  
  
  
  
  private
  
  def book_params
    params.require(:book).permit(:avatar, :title, :imageurl, :header, :release, :publisher, :tag, :avatar, :amazon, :author, :genre, :free_book, :alt, :related1, :related2, :related3, :related1name, :related2name, :related3name)
  end
   
  def set_page_title
    @page_title = "TTBooks | Books and Videos for Entrepreneurs and Startups"
  end
end
