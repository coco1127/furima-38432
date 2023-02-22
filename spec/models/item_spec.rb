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
        expect(@item.errors.full_messages).to include("名前を入力してください")
      end
      it '商品画像が空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end
      it '商品の説明が空では登録できない' do
        @item.introduction = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it 'カテゴリーが未選択では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを選択して下さい")
      end
      it '商品の状態が未選択では登録できない' do
        @item.item_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を選択して下さい")
      end
      it '配送料の負担が未選択では登録できない' do
        @item.postage_payer_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を選択して下さい")
      end
      it '発送元の地域が未選択では登録できない' do
        @item.trading_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を選択して下さい")
      end
      it '発送までの日数が未選択では登録できない' do
        @item.preparation_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を選択して下さい")
      end
      it '販売価格が￥300より少ない時は登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('値段は範囲内で設定して下さい')
      end
      it '販売価格が¥9,999,999より多い時は登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('値段は範囲内で設定して下さい')
      end
      it '価格が空では出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("値段は半角で入力して下さい")
      end
      it 'priceが半角数字でないと出品できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('値段は範囲内で設定して下さい')
      end
      it 'priceが半角英数混合では登録できないこと' do
        @item.price = '300dollars'
        @item.valid?
        expect(@item.errors.full_messages).to include('値段は範囲内で設定して下さい')
      end
      it 'ユーザーが紐付いていなければ投稿できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
