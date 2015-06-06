module BlogsHelper
    def cache_key_for_blogs
    count          = Blog.count
    max_updated_at = Blog.maximum(:updated_at).try(:utc).try(:to_s, :number)
    "blogs/all-#{count}-#{max_updated_at}"
  end
  
  
end
