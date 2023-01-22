class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  # has_many :items
  # has_many :historys

  validates :nickname, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_yomi, presence: true
  validates :last_name_yomi, presence: true
  validates :birthday, presence: true

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates :password, format: { with: VALID_PASSWORD_REGEX}
    validates :password_confirmation, format: { with: VALID_PASSWORD_REGEX}


  with_options allow_blank: true do

    with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]/ } do
      validates :first_name
      validates :last_name
    end

    with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/ } do
      validates :first_name_yomi
      validates :last_name_yomi
    end
  end

end
