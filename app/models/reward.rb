class Reward < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :points, presence: true, numericality: { only_integer: true, greater_than: 0 }

end
