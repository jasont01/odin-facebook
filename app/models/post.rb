class Post < ApplicationRecord
  belongs_to :author, class_name: "user", foreign_key: "user_id"
  has_many :comments
  has_many :likes
  #TODO add pictures -- is_picture to posts table
end
