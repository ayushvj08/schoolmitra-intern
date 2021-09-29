class Student < ApplicationRecord
  belongs_to :user
  has_one :parent, dependent: :delete
  accepts_nested_attributes_for :parent, allow_destroy: true
end
