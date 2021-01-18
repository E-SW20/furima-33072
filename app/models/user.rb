class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates :nickname
    validates :email
    validates_format_of :password, with: PASSWORD_REGEX, message: "６文字以上の半角英数字で書いてください"
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: "全角で書いてください"}
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: "全角で書いてください"}
    validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "全角カタカナで書いてください"}
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "全角カタカナで書いてください"}
    validates :birthday
  end
end
