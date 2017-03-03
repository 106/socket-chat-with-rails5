class Dialect < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :icon_name, presence: true, uniqueness: true
end
