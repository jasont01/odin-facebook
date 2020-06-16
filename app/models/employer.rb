class Employer < ApplicationRecord
  belongs_to :profile
  has_many :jobs
end
