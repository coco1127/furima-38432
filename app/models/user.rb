class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchase_histories

  validates :nickname, presence: true
  validates :birth_date, presence: true
  validates :password,
            format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i,
                      message: 'と同じにものを入力して下さい' }

  with_options presence: true do
    validates :family_name, :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "は全角で入力して下さい" }
    validates :family_name_kana, :first_name_kana, format: { with: /[\p{katakana} ー－&&[^ -~｡-ﾟ]]+/, message: "は全角で入力して下さい" }
  end
end
