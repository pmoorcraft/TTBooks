class BlogsitemapController < ApplicationController
   def index
    headers['Content-Type'] = 'application/xml'
    last_blog = Blog.last
    if stale?(:etag => last_blog, :last_modified => last_blog.updated_at.utc)
      respond_to do |format|
        format.xml { @blogs = Blog.all }
      end
    end
  end
end