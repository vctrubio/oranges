class Pickup < ApplicationRecord
  belongs_to :landlord
  has_many :bags, dependent: :destroy

  accepts_nested_attributes_for :bags

end
