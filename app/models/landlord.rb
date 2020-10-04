class Landlord < ApplicationRecord
    has_many :pickups, dependent: :destroy
    has_many :bags, through: :pickups
end
