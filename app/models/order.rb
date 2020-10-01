class Order < ApplicationRecord
  belongs_to :client
  has_many :receipts, dependent: :destroy
  has_and_belongs_to_many :employee, through: :clients
  
  # has_many :tickets, dependent: :destroy
  # accepts_nested_attributes_for :tickets
  # belongs_to :employee, through: :clients --> because when u delete 

  accepts_nested_attributes_for :receipts

end
