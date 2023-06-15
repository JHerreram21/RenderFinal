class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user
  
  validates :content, presence: true

  attribute :is_admin, :boolean, default: false
end
