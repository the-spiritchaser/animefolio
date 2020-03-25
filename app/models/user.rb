class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  
  validates :name, presence: true, uniqueness: true

  def show_last_post
    if (last_post = posts.last).present?
      last_post.image
    end
  end
end
