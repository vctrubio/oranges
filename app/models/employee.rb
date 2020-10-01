class Employee < ApplicationRecord
    has_many :clients, dependent: :destroy
    # test commit
    has_many :orders, through: :clients
    has_many :receipts, through: :orders

    # accepts_nested_attributes_for :receipts
    accepts_nested_attributes_for :orders
    accepts_nested_attributes_for :clients
    accepts_nested_attributes_for :receipts


end
