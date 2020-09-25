class Employee < ApplicationRecord
    has_many :clients, dependent: :destroy
    # test commit
end
