class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  #TODO has_many :likes  --add is_post bool to like table
end
