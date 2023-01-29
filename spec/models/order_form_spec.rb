require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_form = FactoryBot.build(:order_form, user_id: user.id, item_id: item.id)
  end

  describe '配送先情報の保存' do
    context '配送先情報の配送先情報の保存ができるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_form).to be_valid
      end
      it 'user_idが空でなければ保存できる' do
        @order_form.user_id = 2
        expect(@order_form).to be_valid
      end
      it 'item_idが空でなければ保存できる' do
        @order_form.item_id = 2
        expect(@order_form).to be_valid
      end
      it '郵便番号が「3桁+ハイフン+4桁」の組み合わせであれば保存できる' do
        @order_form.postcode = '123-4560'
        expect(@order_form).to be_valid
      end
      it '都道府県が「---」以外かつ空でなければ保存できる' do
        @order_form.area_id = 2
        expect(@order_form).to be_valid
      end
      it '市区町村が空でなければ保存できる' do
        @order_form.municipaldistrict = '横浜市'
        expect(@order_form).to be_valid
      end
      it '番地が空でなければ保存できる' do
        @order_form.district = '旭区123'
        expect(@order_form).to be_valid
      end
      it '建物名が空でも保存できる' do
        @order_form.building = nil
        expect(@order_form).to be_valid
      end
      it '電話番号が11桁以内かつハイフンなしであれば保存できる' do
        @order_form.phone = 12_345_678_910
        expect(@order_form).to be_valid
      end
    end

    context '配送先情報の保存ができないとき' do
      it 'user_idが空だと保存ができない' do
        @order_form.user_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できない' do
        @order_form.item_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Item can't be blank")
      end
      it '郵便番号が空だと保存できないこと' do
        @order_form.postcode = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postcode is invalid. Include hyphen(-)")
      end
      it '郵便番号にハイフンがないと保存できないこと' do
        @order_form.postcode = 1_234_567
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Postcode is invalid. Include hyphen(-)')
      end
      it '都道府県が「---」だと保存できないこと' do
        @order_form.area_id = 0
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Area can't be blank")
      end
      it '都道府県が空だと保存できないこと' do
        @order_form.area_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Area can't be blank")
      end
      it '市区町村が空だと保存できないこと' do
        @order_form.municipaldistrict = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Municipaldistrict can't be blank")
      end
      it '番地が空だと保存できないこと' do
        @order_form.district = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("District can't be blank")
      end
      it '電話番号が空だと保存できないこと' do
        @order_form.phone = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone is invalid")
      end
      it '電話番号にハイフンがあると保存できないこと' do
        @order_form.phone = '123-1234-1234'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone is invalid')
      end
      it '電話番号が9桁以下では保存できないこと' do
        @order_form.phone = 123456789
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone is invalid')
      end
      it '電話番号が12桁以上あると保存できないこと' do
        @order_form.phone = 12_345_678_910_123
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone is invalid')
      end
      it 'トークンが空だと保存ができないこと' do
        @order_form.token = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
