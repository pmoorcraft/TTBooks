class BooksController < ApplicationController
  
  def new
  end
  
  def create
    @book = Book.create ( params[:book] )
  end
  
  def edit
  end
  
  def delete
  end
  
  def this_month
  end
  
  def archive
  end
  
  end
  
  private
  
  def book_params
    params.require(:book).permit(:avatar)
  
  end
end
