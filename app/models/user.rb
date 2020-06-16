class User < ApplicationRecord
  has_many :posts
  has_many :friends
  has_many :friend_requests
  has_one :profile
end
