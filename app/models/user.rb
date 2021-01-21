class User < ApplicationRecord
  has_many :items
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    PASSWORD_REGEX_a = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
    PASSWORD_REGEX_b = /\A[ぁ-んァ-ン一-龥々]+\z/.freeze
    PASSWORD_REGEX_c = /\A[ァ-ヶー－]+\z/.freeze
    validates :nickname
    validates :email
    validates_format_of :password, with: PASSWORD_REGEX_a, message: '６文字以上の半角英数字で書いてください'
    validates :last_name, format: { with: PASSWORD_REGEX_b, message: '全角で書いてください' }
    validates :first_name, format: { with: PASSWORD_REGEX_b, message: '全角で書いてください' }
    validates :last_name_kana, format: { with: PASSWORD_REGEX_c, message: '全角カタカナで書いてください' }
    validates :first_name_kana, format: { with: PASSWORD_REGEX_c, message: '全角カタカナで書いてください' }
    validates :birthday
  end
end
