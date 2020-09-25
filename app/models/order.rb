class Order < ApplicationRecord
  belongs_to :client
  has_many :tickets, dependent: :destroy
  # belongs_to :employee, through: :clients --> because when u delete 
end
