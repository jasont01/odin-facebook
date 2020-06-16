class Profile < ApplicationRecord
  belongs_to :user
  has_many :locations
  has_one :hometown, class_name: "location", foreign_key: "hometown_id"
  has_many :jobs
end
