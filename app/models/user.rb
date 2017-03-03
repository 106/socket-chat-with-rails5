class User < ApplicationRecord
  belongs_to :dialect

  has_many :messages

  validates :name, presence: true
end
