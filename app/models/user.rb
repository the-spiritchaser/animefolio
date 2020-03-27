class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :room_users
  has_many :rooms, through: :room_users

  validates :name, presence: true, uniqueness: true

  include Gravtastic
  gravtastic :size => 100,
             :default => "robohash"

  def show_last_post
    if (last_post = posts.last).present?
      last_post.image
    end
  end
end
