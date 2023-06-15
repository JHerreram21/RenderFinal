class Review < ApplicationRecord
  belongs_to :product
  validates :comment, presence: true
end
