class PetTracker < ApplicationRecord
  attribute :date, :datetime, default: ->{ Time.now }
  belongs_to :user
  validates :brand, presence: true, length: {minimum: 2, maximum: 50}
  validates :description, presence: true, length: {minimum: 3, maximum: 100}
  validates :wet_amount, numericality: true, comparison: { greater_than: 0 }
  validates :wet_left_amount, numericality: true, comparison: { less_than: :wet_amount, greater_than_or_equal_to: 0 }
  validates :dry_amount, numericality: true, comparison: { greater_than: 0 }
  validates :dry_left_amount, numericality: true, comparison: { less_than: :dry_amount, greater_than_or_equal_to: 0}
end
