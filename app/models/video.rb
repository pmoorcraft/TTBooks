class Video < ActiveRecord::Base
  has_many :votes, dependent: :destroy
  
  def vote!(ip)
    unless Vote.recent.exists?(:ip => ip, :video_id => id)
      Vote.create(:ip => ip, :video_id => id)
    end
  end
end
