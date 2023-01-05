require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の登録' do
    context '商品が出品できる場合' do
      it '全ての値が正しく入力されていれば登録できる' do
         expect(@item).to be_valid
      end
    end
      
    context '商品が出品できない場合' do
     it '商品名が空では登録できない' do
       @item.name = nil
       @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
     end
     it '商品画像が空では登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank") 
    end
      it '商品の説明が空では登録できない' do
        @item.introduction = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Introduction can't be blank")
      end     
      it 'カテゴリーが未選択では登録できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end     
      it '商品の状態が未選択では登録できない' do
        @item.item_condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Item condition can't be blank")
      end     
      it '配送料の負担が未選択では登録できない' do
        @item.postage_payer_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage payer can't be blank")
      end     
      it '発送元の地域が未選択では登録できない' do
        @item.trading_status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Trading status can't be blank")
      end     
      it '発送までの日数が未選択では登録できない' do
        @item.preparation_day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Preparation day can't be blank")
      end     
      it '販売価格が￥300より少ない時は登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end     
      it '販売価格が¥9,999,999より多い時は登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end     
      it 'ユーザーが紐付いていなければ投稿できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
