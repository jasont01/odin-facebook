class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  #TODO add ability to like a comment -- add is_post bool to like table
  #has_many :likes
end
