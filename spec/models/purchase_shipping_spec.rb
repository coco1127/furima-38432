require 'rails_helper'

RSpec.describe PurchaseShipping, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_shipping = FactoryBot.build(:purchase_shipping, user_id: user.id, item_id: item.id)
    end
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_shipping).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @purchase_shipping.building_name = ''
        expect(@purchase_shipping).to be_valid
    end
    it "priceとtokenがあれば保存ができること" do
      expect(@purchase_shipping).to be_valid
    end
    end

    context '内容に問題がある場合' do
      it '郵便番号が空だと保存できないこと' do
        @purchase_shipping.post_code = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号が半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase_shipping.post_code = '1234567'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
        it '都道府県が未選択では登録できないこと' do
          @purchase_shipping.trading_status_id = 1
          @purchase_shipping.valid?
          expect(@purchase_shipping.errors.full_messages).to include("Trading status can't be blank")
      end
      it '市町村が空だと保存できないこと' do
        @purchase_shipping.city = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できないこと' do
        @purchase_shipping.house_number = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("House number can't be blank")
      end
      it '電話番号が空だと保存できないこと' do
        @purchase_shipping.phone_number = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Phone number can't be blank")
      end
        it '電話番号が全角数字だと保存できないこと' do
          @purchase_shipping.phone_number = '２００００００００００'
          @purchase_shipping.valid?
          expect(@purchase_shipping.errors.full_messages).to include('Phone number is invalid.')
        end
          it 'userが紐付いていないと保存できないこと' do
            @purchase_shipping.user_id = nil
            @purchase_shipping.valid?
            expect(@purchase_shipping.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @purchase_shipping.item_id = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Item can't be blank")
      end
      it "tokenが空では登録できないこと" do
        @purchase_shipping.token = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Token can't be blank")
      end
    end
    end
  end

