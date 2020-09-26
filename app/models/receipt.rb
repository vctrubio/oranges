class Receipt < ApplicationRecord
  belongs_to :order
  #has_many :clients, through: :orders
end
