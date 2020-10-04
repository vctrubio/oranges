class Bag < ApplicationRecord
  belongs_to :pickup

  accepts_nested_attributes_for :pickup

end
