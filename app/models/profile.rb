class Profile < ApplicationRecord
  belongs_to :user
  belongs_to :location
  belongs_to :hometown, class_name: "Location", foreign_key: "location_id"
  belongs_to :employers
end
