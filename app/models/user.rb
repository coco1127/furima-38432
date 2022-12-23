class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname,                           presence: true
  #validates :family_name,                        presence: true
  #validates :first_name,                         presence: true
  #validates :family_name_kana,:first_name_kana,  presence: true
  validates  :birth_date,                         presence: true
  #validates :password,:password_confirmation,    presence: true

  with_options presence: true do
    validates :family_name, :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid.
                               Input full-width characters." }
    validates :family_name_kana, :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid.
                                Input full-width characters." }
    end
end