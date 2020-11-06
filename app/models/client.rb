class Client < ApplicationRecord
  belongs_to :employee
  has_many :orders, dependent: :destroy
  has_many :receipts, through: :orders

  validates :rating, allow_nil: true, numericality: { only_integer: true }, inclusion: { in: [0, 1, 2, 3,] }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  accepts_nested_attributes_for :employee
  accepts_nested_attributes_for :orders
  accepts_nested_attributes_for :receipts
 
  def client_data
    {
      
    }
  end
end
