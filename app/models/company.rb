class Company < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true

  has_many :rewards
end
