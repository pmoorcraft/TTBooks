class HomepageController < ApplicationController
  
  def index
    
    
    @books = Book.all
    @recentbooks = Book.where(release: (30.days.ago..30.days.from_now))
    
    
    @operatorbooks = @recentbooks.find_all {|i| i.tag == "operators" }
    @investorbooks = @recentbooks.find_all {|i| i.tag == "investors" }
    @otherbooks = @recentbooks.find_all {|i| i.tag == "other" }


    @videos = Video.all
    @recentvideos = Video.where(uploaded: (30.days.ago..Time.now))
    
    
    @operatorvideos = @recentvideos.find_all {|i| i.tag == "operators" }
    @investorvideos = @recentvideos.find_all {|i| i.tag == "investors" }
    @othervideos = @recentvideos.find_all {|i| i.tag == "other" }
  end
  
  
  def archive
    @oldbooks = Book.where(release: (700.days.ago..30.days.ago))
    @oldoperatorbooks = @oldbooks.find_all {|i| i.tag == "operators" }
    @oldinvestorbooks = @oldbooks.find_all {|i| i.tag == "investors" }
    @oldotherbooks = @oldbooks.find_all {|i| i.tag == "other" }
    
        
    @oldvideos = Video.where(uploaded: (700.days.ago..30.days.ago))
    @oldoperatorvideos = @oldvideos.find_all {|i| i.tag == "operators" }
    @oldinvestorvideos = @oldvideos.find_all {|i| i.tag == "investors" }
    @oldothervideos = @oldvideos.find_all {|i| i.tag == "other" }
  end
  
  def about
  
  end
end
