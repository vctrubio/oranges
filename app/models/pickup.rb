class Pickup < ApplicationRecord
  belongs_to :landlord
  has_many :bags, dependent: :destroy
end
