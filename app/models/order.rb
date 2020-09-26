class Order < ApplicationRecord
  belongs_to :client
  has_many :tickets, dependent: :destroy

  accepts_nested_attributes_for :tickets
  # belongs_to :employee, through: :clients --> because when u delete 
end
