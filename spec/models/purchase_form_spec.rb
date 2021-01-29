require 'rails_helper'

RSpec.describe PurchaseForm, type: :model do
  before do
    seller = FactoryBot.create(:user)
    buyer = FactoryBot.create(:user)
    item = FactoryBot.create(:item, user_id: seller.id)
    @form = FactoryBot.build(:purchase_form, user_id: buyer.id, item_id: item.id)
    sleep(1)
  end
  describe '商品購入機能' do
    context '商品が購入できるとき' do
      it '郵便番号・都道府県・市区町村・番地・電話番号・tokenがあれば購入できる' do
        expect(@form).to be_valid
      end
      it '建物名が空でも購入できる' do
        @form.building_name = ''
        expect(@form).to be_valid
      end
    end
    context '商品が購入できないとき' do
      it '郵便番号が空だと購入できない' do
        @form.postal_code = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'prefectures_idが0だと購入できない' do
        @form.prefectures_id = 0
        @form.valid?
        expect(@form.errors.full_messages).to include('Prefectures must be other than 0')
      end
      it 'prefectures_idが空だと購入できない' do
        @form.prefectures_id = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("Prefectures can't be blank")
      end
      it '市区町村が空だと購入できない' do
        @form.municipality = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("Municipality can't be blank")
      end
      it '番地が空だと購入できない' do
        @form.address = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空だと購入できない' do
        @form.phone_number = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("Phone number can't be blank")
      end
      it '郵便番号にハイフンがないと購入できない' do
        @form.postal_code = '1234567'
        @form.valid?
        expect(@form.errors.full_messages).to include('Postal code is invalid')
      end
      it '電話番号にハイフンがあると購入できない' do
        @form.phone_number = '090-1234-5678'
        @form.valid?
        expect(@form.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号に全角数字があると購入できない' do
        @form.phone_number = '０９０１２３４５６７８'
        @form.valid?
        expect(@form.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号に英数字混合があると購入できない' do
        @form.phone_number = 'Abc12345678'
        @form.valid?
        expect(@form.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が11桁以内でないと購入できない' do
        @form.phone_number = '090123456789'
        @form.valid?
        expect(@form.errors.full_messages).to include('Phone number is invalid')
      end
      it 'user_idが空だと購入できない' do
        @form.user_id = nil
        @form.valid?
        expect(@form.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと購入できない' do
        @form.item_id = nil
        @form.valid?
        expect(@form.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空だと購入できない' do
        @form.token = nil
        @form.valid?
        expect(@form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
