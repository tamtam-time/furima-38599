class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :items
  has_many :historys

  validates :nickname, presence: true
  validates :email, presence: true
  validates :password, presence: true, format: { with: /\A[a-z0-9]+\z/, message: "半角英数字で入力してください" },length: { minimum: 6 }
  validates :password_confirmation, presence: true, format: { with: /\A[a-z0-9]+\z/, message: "半角英数字で入力してください" },length: { minimum: 6 }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "全角で入力してください" }
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "全角で入力してください" }
  validates :first_name_yomi, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "カタカナで入力してください" }
  validates :last_name_yomi, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "カタカナで入力してください" }
  validates :birthday, presence: true
       


end
