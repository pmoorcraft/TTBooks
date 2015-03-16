class BooksController < ApplicationController
  before_filter :authorize
  
  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params) 
    if @book.save
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
  
  
  
  private
  
  def book_params
    params.require(:book).permit(:avatar, :title, :header, :release, :publisher, :tag, :avatar)
  end
end
