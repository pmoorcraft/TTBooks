class Vote < ActiveRecord::Base
  scope :recent, -> { where("created_at > ?", 24.hours.ago) }
  belongs_to :video
  belongs_to :book
  
end