class Post < ApplicationRecord
  #belongs_to :user
  belongs_to :author, class_name: "User"
  has_many :comments
  has_many :likes
  max_paginates_per 10
  #TODO posts can be pictures
end
