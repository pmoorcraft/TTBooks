class HomepageController < ApplicationController
    before_filter :set_page_title

    
    
    

    def index
      if params[:search]
        @books = Book.search(params[:search])
        @videos = Video.search(params[:search])
      
        @operatorvideos = @videos.find_all {|i| i.tag == "operators" }      
        @operatorbooks = @books.find_all {|i| i.tag == "operators" }  
    
        
        @operator_feed = (@operatorbooks + @operatorvideos).sort_by { |a| Time.now - a.created_at}
       
        
        @investorbooks = @books.find_all {|i| i.tag == "investors" }   
        @investorvideos = @videos.find_all {|i| i.tag == "investors" }
        @investor_feed = (@investorbooks + @investorvideos).sort_by { |a| Time.now - a.created_at}
    
            
        @otherbooks = @books.find_all {|i| i.tag == "other" }
        @othervideos = @videos.find_all {|i| i.tag == "other" }
        @other_feed = (@otherbooks + @othervideos).sort_by { |a| Time.now - a.created_at}

        
      else
      
    @books = Book.all  
    @videos = Video.all  
    @recentvideos = Video.where(created_at: (30.days.ago..Time.now))
  
    @operatorvideos = @recentvideos.find_all {|i| i.tag == "operators" }      
    @recentbooks = Book.where(created_at: (30.days.ago..30.days.from_now))
    @operatorbooks = @recentbooks.find_all {|i| i.tag == "operators" }  

    
    @operator_feed = (@operatorbooks + @operatorvideos).sort_by { |a| Time.now - a.created_at}
   
    
    @investorbooks = @recentbooks.find_all {|i| i.tag == "investors" }   
    @investorvideos = @recentvideos.find_all {|i| i.tag == "investors" }
    @investor_feed = (@investorbooks + @investorvideos).sort_by { |a| Time.now - a.created_at}

        
    @otherbooks = @recentbooks.find_all {|i| i.tag == "other" }
    @othervideos = @recentvideos.find_all {|i| i.tag == "other" }
    @other_feed = (@otherbooks + @othervideos).sort_by { |a| Time.now - a.created_at}

    
    @page_title = "TTBooks | Books and Videos for Entrepreneurs and Startups"
     @og_title = "TTBooks | Books and Videos for Entrepreneurs and Startups"
    end
    
    
  end
  
  
  
  def archive
    @oldbooks = Book.where(created_at: (1000.days.ago..30.days.ago))
    @oldvideos = Video.where(created_at: (1000.days.ago..30.days.ago))
    
    
    @oldoperatorbooks = @oldbooks.find_all {|i| i.tag == "operators" }    
    @oldoperatorvideos = @oldvideos.find_all {|i| i.tag == "operators" }
    @oldoperator_feed = (@oldoperatorbooks + @oldoperatorvideos).sort_by { |a| Time.now - a.created_at}
    @oldoperator_feed = @oldoperator_feed.take(10)
    
    
    
    @oldinvestorbooks = @oldbooks.find_all {|i| i.tag == "investors" }       
    @oldinvestorvideos = @oldvideos.find_all {|i| i.tag == "investors" }
    @oldinvestor_feed = (@oldinvestorbooks + @oldinvestorvideos).sort_by { |a| Time.now - a.created_at}
    @oldinvestor_feed =  @oldinvestor_feed.take(10)
     
     
    @oldotherbooks = @oldbooks.find_all {|i| i.tag == "other" }
    @oldothervideos = @oldvideos.find_all {|i| i.tag == "other" }
    @oldother_feed = (@oldotherbooks + @oldothervideos).sort_by { |a| Time.now - a.created_at}
    @oldother_feed =  @oldother_feed.take(10)
    
    @page_title = "TTBooks Archive | Books and Videos for Entrepreneurs and Startups"
     @og_title = "TTBooks Archive | Books and Videos for Entrepreneurs and Startups"
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
     @og_title = "TTBooks About | Books and Videos for Entrepreneurs, Startup founders and investors and Business owners."
  end

  def readingroom
    
  end
 
 private
 
  def set_page_title
    @page_title = "TTBooks | Books and Videos for Entrepreneurs, Startup founders and investors and Business owners."
    @og_title = "TTBooks | Books and Videos for Entrepreneurs, Startup founders and investors and Business owners."
    @og_description = "Videos and books about business, marketing, funding, engineering and much more for tech startup entrepreneurs and investors."
    @og_image = "https://s3-eu-west-1.amazonaws.com/ttbooks/Tech+Talks+%26+Books-logo+(2).png"
  end
end
