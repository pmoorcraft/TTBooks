class VideositemapController < ApplicationController
  
   def index
    headers['Content-Type'] = 'application/xml'
    last_video = Video.last
    if stale?(:etag => last_video, :last_modified => last_video.updated_at.utc)
      respond_to do |format|
        format.xml { @videos = Book.all }
      end
    end
  end
end
