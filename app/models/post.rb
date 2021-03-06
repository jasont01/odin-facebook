class Post < ApplicationRecord
  belongs_to :author, class_name: "User"
  has_one_attached :photo
  has_many :comments
  has_many :likes
  max_paginates_per 8
end
