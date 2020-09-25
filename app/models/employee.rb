class Employee < ApplicationRecord
    has_many :clients, dependent: :destroy
end
