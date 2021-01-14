class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :nickname, presence: true
  validates :email, presence: true
  validates_format_of :password, with: PASSWORD_REGEX, message: "６文字以上の半角英数字で書いてください"
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "全角で書いてください"}
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "全角で書いてください"}
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "全角カタカナで書いてください"}
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "全角カタカナで書いてください"}
  validates :birthday, presence: true

end
