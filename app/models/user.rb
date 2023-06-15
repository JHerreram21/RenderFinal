class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: { usuario: 0, administrador: 1 }

  #nuevas validaciones:
  validates :password, length: { minimum: 6 }, if: :password_required?
  validates :name, presence: true


  private
  def password_required?
    new_record? || password.present?
  end
end
