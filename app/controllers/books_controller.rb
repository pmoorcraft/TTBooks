class BooksController < ApplicationController

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
    fresh_when @book
  end
  
  
  
  
  
  private
  
  def book_params
    params.require(:book).permit(:avatar, :title, :imageurl, :header, :release, :publisher, :tag, :avatar, :amazon, :author, :genre, :free_book, :alt)
  end
   
  def set_page_title
    @page_title = "TTBooks | Books and Videos for Entrepreneurs and Startups"
  end
end
