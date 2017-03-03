class Dialect < ApplicationRecord
  has_many :users
  validates :name, presence: true, uniqueness: true
  validates :icon_name, presence: true, uniqueness: true
end
