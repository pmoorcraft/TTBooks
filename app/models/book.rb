class Book < ActiveRecord::Base
  has_attached_file :avatar, :styles => { :medium => "150x200>", :thumb => "100x100>" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  has_many :votes, dependent: :destroy
 

  
  def vote!(ip)
    unless Vote.recent.exists?(:ip => ip, :book_id => id)
      Vote.create(:ip => ip, :book_id => id)
    end
  end
  
  def self.search(search)
    where("title LIKE ? OR header like ?", "%#{search}%", "%#{search}%")
  end
  
end
