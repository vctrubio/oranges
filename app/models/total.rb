class Total < ApplicationRecord
    has_many :payments
    has_many :orders
end
