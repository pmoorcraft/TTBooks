class Video < ActiveRecord::Base
  has_many :votes, dependent: :destroy
  validates :title, uniqueness: true
  
  
  def vote!(ip)
    unless Vote.recent.exists?(:ip => ip, :video_id => id)
      Vote.create(:ip => ip, :video_id => id)
    end
  end
  
  def self.search(search)
    where("title LIKE ? OR description like ? OR tag like ?", "%#{search}%", "%#{search}%", "%#{search}%")
  end
end
