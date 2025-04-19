class Reward < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :points, presence: true, numericality: { only_integer: true, greater_than: 0 }

  # Ensure that the reward is available only within the specified time frame
  # if available_from and available_until are set
  validates :available_from, presence: true, if: :available_until?

  belongs_to :company

  scope :draft, -> { where(available_from: nil) }
  scope :scheduled, -> { where.not(available_from: nil).where("available_from > ?", Time.current) }
  scope :expired, -> { where("available_until <= ?", Time.current) }
  scope :active, -> { where("available_from <= ? AND (available_until IS NULL OR available_until > ?)", Time.current, Time.current) }

  def draft?
    available_from.nil?
  end

  def scheduled?
    available_from.present? && available_from > Time.current
  end

  def expired?
    available_until.present? && available_until <= Time.current
  end

  def active?
    available_from.present? && available_from <= Time.current && (available_until.nil? || available_until > Time.current)
  end
end
