class HomepageController < ApplicationController
    before_filter :set_page_title
    
    
    
    

    def index
      
    @books = Book.all  
    @videos = Video.all  
    @recentvideos = Video.where(created_at: (10.days.ago..Time.now))
  
    @operatorvideos = @recentvideos.find_all {|i| i.tag == "operators" }      
    @recentbooks = Book.where(created_at: (10.days.ago..30.days.from_now))
    @operatorbooks = @recentbooks.find_all {|i| i.tag == "operators" }  

    
    @operator_feed = (@operatorbooks + @operatorvideos).sort_by { |a| Time.now - a.created_at}
   
    
    @investorbooks = @recentbooks.find_all {|i| i.tag == "investors" }   
    @investorvideos = @recentvideos.find_all {|i| i.tag == "investors" }
    @investor_feed = (@investorbooks + @investorvideos).sort_by { |a| Time.now - a.created_at}

        
    @otherbooks = @recentbooks.find_all {|i| i.tag == "other" }
    @othervideos = @recentvideos.find_all {|i| i.tag == "other" }
    @other_feed = (@otherbooks + @othervideos).sort_by { |a| Time.now - a.created_at}

    
    @page_title = "TTBooks | Books and Videos for Entrepreneurs and Startups"

    
    
  end
  
  
  def archive
    @oldbooks = Book.where(created_at: (1000.days.ago..10.days.ago))
    @oldvideos = Video.where(created_at: (1000.days.ago..10.days.ago))
    
    
    @oldoperatorbooks = @oldbooks.find_all {|i| i.tag == "operators" }    
    @oldoperatorvideos = @oldvideos.find_all {|i| i.tag == "operators" }
    @oldoperator_feed = (@oldoperatorbooks + @oldoperatorvideos).sort_by { |a| Time.now - a.created_at}
    @oldoperator_feed = @oldoperator_feed.take(8)
    
    
    
    @oldinvestorbooks = @oldbooks.find_all {|i| i.tag == "investors" }       
    @oldinvestorvideos = @oldvideos.find_all {|i| i.tag == "investors" }
    @oldinvestor_feed = (@oldinvestorbooks + @oldinvestorvideos).sort_by { |a| Time.now - a.created_at}
    @oldinvestor_feed =  @oldinvestor_feed.take(8)
     
     
    @oldotherbooks = @oldbooks.find_all {|i| i.tag == "other" }
    @oldothervideos = @oldvideos.find_all {|i| i.tag == "other" }
    @oldother_feed = (@oldotherbooks + @oldothervideos).sort_by { |a| Time.now - a.created_at}
    @oldother_feed =  @oldother_feed.take(8)
    
    @page_title = "TTBooks Archive | Books and Videos for Entrepreneurs and Startups"

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
    @page_title = "TTBooks About | Books and Videos for Entrepreneurs, Startup founders and investors and Business owners."
  end

  def readingroom
    
  end
 
 private
 
  def set_page_title
    @page_title = "TTBooks | Books and Videos for Entrepreneurs, Startup founders and investors and Business owners."
  end
end
