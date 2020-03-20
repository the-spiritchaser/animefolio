class Post < ApplicationRecord
  belongs_to :user
  
  validates :title, :image, presence: true
end
