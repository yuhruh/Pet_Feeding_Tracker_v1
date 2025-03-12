class PetTracker < ApplicationRecord
  validates :brand, presence: true, length: {minimum: 2, maximum: 50}
  validates :description, presence: true, length: {minimum: 6, maximum: 100}
  validates :wet_amount, numericality: true
  validates :wet_left_amount, numericality: true
  validates :dry_amount, numericality: true
  validates :dry_left_amount, numericality: true
end
