require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe "ユーザー新規登録" do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmation、last_name、first_name、last_name_kana、first_name_kanaが存在すれば登録できる" do
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
        user.email = ""
        user.valid?
        expect(user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailが一意性でないと登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")      
      end
      it "emailに@を含まれていないと登録できない" do
        user.email = "abcdefg.com"
        user.valid?
        expect(user.errors.full_messages).to include("")
      end
      it "passwordが空だと登録できない" do
        user.password = ""
        user.valid?
        expect(user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが５文字以下だと登録できない" do
      end
      it "passwordが半角英数字混合でない場合登録できない" do
      end
      it "password_confirmationが空だと登録できない" do
      end
      it "passwordとpassword_confirmationが異なると登録できない" do
      end
      it "last_nameが空だと登録できない" do
      end
      it "first_nameが空だと登録できない" do
      end
      it "last_name_kanaが空だと登録できない" do
      end
      it "first_name_kanaが空だと登録できない" do
      end
      it "last_name_kanaが漢字だと登録できない" do
      end
      it "first_name_kanaが漢字だと登録できない" do
      end
      it "birthdayが空だと登録できない" do
      end

    end
  end
end