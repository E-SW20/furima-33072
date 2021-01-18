require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe "ユーザー新規登録" do
    context '新規登録がうまくいくとき' do
      it "項目を全て記入すれば登録できる" do
        expect(@user).to be_valid
      end
    end
    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailが一意性でないと登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")      
      end
      it "emailに@を含まれていないと登録できない" do
        @user.email = "abbdefg.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが５文字以下だと登録できない" do
        @user.password = "a0000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is too short (minimum is 6 characters)")
      end
      it "passwordが半角数字のみの場合登録できない" do
        @user.password = "000000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password ６文字以上の半角英数字で書いてください")
      end
      it "passwordが半角英字のみの場合登録できない" do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password ６文字以上の半角英数字で書いてください")
      end
      it "passwordが全角の場合登録できない" do
        @user.password = "ａ０００００"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password ６文字以上の半角英数字で書いてください")
      end
      it "password_confirmationが空だと登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordとpassword_confirmationが異なると登録できない" do
        @user.password_confirmation = "aaa0000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "last_nameが空だと登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name 全角で書いてください")
      end
      it "first_nameが空だと登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角で書いてください")
      end
      it "last_nameが半角カナだと登録できない" do
        @user.last_name = "ﾀﾅｶ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name 全角で書いてください")
      end
      it "first_nameが半角カナだと登録できない" do
        @user.first_name = "ﾀﾛｳ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角で書いてください")
      end
      it "last_nameが数字だと登録できない" do
        @user.last_name = "321"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name 全角で書いてください")
      end
      it "first_nameが数字だと登録できない" do
        @user.first_name = "123"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角で書いてください")
      end
      it "last_nameが英字だと登録できない" do
        @user.last_name = "Tanaka"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name 全角で書いてください")
      end
      it "first_nameが英字だと登録できない" do
        @user.first_name = "Tarou"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角で書いてください")
      end
      it "last_name_kanaが空だと登録できない" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana 全角カタカナで書いてください")
      end
      it "first_name_kanaが空だと登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana 全角カタカナで書いてください")
      end
      it "last_name_kanaが漢字だと登録できない" do
        @user.last_name_kana = "山田"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana 全角カタカナで書いてください")
      end
      it "first_name_kanaが漢字だと登録できない" do
        @user.first_name_kana = "太郎"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana 全角カタカナで書いてください")
      end
      it "birthdayが空だと登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end