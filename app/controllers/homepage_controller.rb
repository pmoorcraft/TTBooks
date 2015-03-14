class HomepageController < ApplicationController
  
  def index
    
    
    @books = Book.all
    
    @operatorbooks = @books.find_all {|i| i.tag == "operators" }
    @investorbooks = @books.find_all {|i| i.tag == "investors" }
    @otherbooks = @books.find_all {|i| i.tag == "other" }
    
    
    @videos = Video.all
    
    @operatorvideos = @videos.find_all {|i| i.tag == "operators" }
    @investorvideos = @videos.find_all {|i| i.tag == "investors" }
    @othervideos = @videos.find_all {|i| i.tag == "other" }
  end
  
end
