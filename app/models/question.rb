class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  belongs_to :product
  validates :title, :content, :product_id, presence: true
end
