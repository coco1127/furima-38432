class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  validates :email, presence: true
  validates :encrypted_password,:password,:password_confirmation,length:{minimum:7},format:{with: /(?=.[a-zA-Z])(?=.\d)[a-zA-Z\d]{7,}/}
end
