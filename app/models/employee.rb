class Employee < ApplicationRecord
    has_many :clients, dependent: :destroy
    # test commit
    has_many :orders, through: :clients

    accepts_nested_attributes_for :receipts
    accepts_nested_attributes_for :orders


end
