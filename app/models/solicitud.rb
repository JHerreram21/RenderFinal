class Solicitud < ApplicationRecord
  belongs_to :product
  validates :nombre, presence: true
  validates :email, presence: true
  attribute :estado, :string, default: 'pendiente'
end
