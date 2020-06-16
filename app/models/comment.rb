class Comment < ApplicationRecord
  belongs_to :post
  #TODO has_many :likes  --add is_post bool to like table
end
