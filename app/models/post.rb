class Post < ApplicationRecord
  #belongs_to :user
  belongs_to :author, class_name: "User"
  has_many :comments
  has_many :likes
  #TODO posts can be pictures
end
