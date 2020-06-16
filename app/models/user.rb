class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :friends
  has_many :friend_requests
  has_one :profile
end
