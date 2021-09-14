class Student < ApplicationRecord
  belongs_to :user
  has_one :parent, dependent: :delete
end
