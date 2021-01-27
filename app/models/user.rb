class User < ApplicationRecord
  has_many :comments
  has_many :posts, :through => :comments

  validates :name, presence: true
  validates :email, presence: true
end
