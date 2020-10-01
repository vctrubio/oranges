class Receipt < ApplicationRecord
  belongs_to :order
  #has_many :clients, through: :orders

  
  validates :kilos, presence: true
  validates :fruit, presence: true
  validates :ppfruit, presence: true
  
  

  accepts_nested_attributes_for :order

end
