class SitemapController < ApplicationController
  
 def index
    headers['Content-Type'] = 'application/xml'
    last_book = Book.last
    if stale?(:etag => last_book, :last_modified => last_book.updated_at.utc)
      respond_to do |format|
        format.xml { @books = Book.all }
      end
    end
  end

end
