class Studio < ApplicationRecord
  belongs_to :studio_owner
  has_many :users
end
