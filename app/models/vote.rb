class Vote < ActiveRecord::Base
  belongs_to :video
  belongs_to :book
end