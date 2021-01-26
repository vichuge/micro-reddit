class User < ApplicationRecord
    has_many :comments
    has_many :posts, :through => :comments
end
