class HomepageController < ApplicationController
    before_filter :set_page_title
    
    def index
    @books = Book.all  
   
    
    @recentbooks = Book.where(release: (25.days.ago..30.days.from_now))

    @operatorbooks = @recentbooks.find_all {|i| i.tag == "operators" }
    @operatorbooks = @operatorbooks.sort_by { |i| - i.votes.count }
    
    @investorbooks = @recentbooks.find_all {|i| i.tag == "investors" }
    @investorbooks = @investorbooks.sort_by { |i| - i.votes.count }
    
    @otherbooks = @recentbooks.find_all {|i| i.tag == "other" }
    @otherbooks =  @otherbooks.sort_by { |i| - i.votes.count }


    @videos = Video.all  
    @recentvideos = Video.where(uploaded: (25.days.ago..Time.now))
    
    
    @operatorvideos = @recentvideos.find_all {|i| i.tag == "operators" }
    @operatorvideos = @operatorvideos.sort_by { |i| - i.votes.count }
    
    @investorvideos = @recentvideos.find_all {|i| i.tag == "investors" }
    @investorvideos = @investorvideos.sort_by { |i| - i.votes.count }
    
    @othervideos = @recentvideos.find_all {|i| i.tag == "other" }
    @othervideos = @othervideos.sort_by { |i| - i.votes.count } 
    
    @page_title = "Books and Videos for Entrepreneurs and Startups | TTBooks"
  end
  
  
  def archive
    @oldbooks = Book.where(release: (1000.days.ago..25.days.ago))
    
    @oldoperatorbooks = @oldbooks.find_all {|i| i.tag == "operators" }
    @oldoperatorbooks = @oldoperatorbooks.sort_by { |i| - i.votes.count }
    
    @oldinvestorbooks = @oldbooks.find_all {|i| i.tag == "investors" }
     @oldinvestorbooks =  @oldinvestorbooks.sort_by { |i| - i.votes.count }
    
    @oldotherbooks = @oldbooks.find_all {|i| i.tag == "other" }
     @oldotherbooks =  @oldotherbooks.sort_by { |i| - i.votes.count }
    
    
        
    @oldvideos = Video.where(uploaded: (1000.days.ago..25.days.ago))
    
    @oldoperatorvideos = @oldvideos.find_all {|i| i.tag == "operators" }
     @oldoperatorvideos =  @oldoperatorvideos.sort_by { |i| - i.votes.count }
    
    @oldinvestorvideos = @oldvideos.find_all {|i| i.tag == "investors" }
    @oldinvestorvideos = @oldinvestorvideos.sort_by { |i| - i.votes.count }
    
    @oldothervideos = @oldvideos.find_all {|i| i.tag == "other" }
    @oldothervideos = @oldothervideos.sort_by { |i| - i.votes.count }
    
    @page_title = "Books and Videos for Entrepreneurs and Startups | TTBooks Archive"
  end
  
  def bookfeed
    @all_content = Book.all
    respond_to do |format|
      format.rss { render :layout => false }
    end
  end
  
  def videofeed
    @videos = Video.all
    respond_to :rss
  end
  
  def bookfeed
    @books = Book.all
    respond_to :rss
  end
  
  def about
    @page_title = "Books and Videos for Entrepreneurs and Startups | TTBooks About"
  end

 
 private
 
  def set_page_title
    @page_title = "Books and Videos for Entrepreneurs and Startups | TTBooks"
  end
end
