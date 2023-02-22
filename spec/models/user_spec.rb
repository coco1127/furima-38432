require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation,family_nameとfirst_name、family_name_kanaとfirst_name_kana,birth_dateが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'first_nameとfamily_nameが全角であれば登録できる' do
        @user.first_name = '桐生'
        @user.family_name = 'ココ'
        expect(@user).to be_valid
      end
      it 'family_name_kanaとfirst_name_kanaが全角カナであれば登録できる' do
        @user.family_name_kana = 'ヤマダ'
        @user.first_name_kana = 'ララ'
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmationとパスワードの入力が一致しません", "パスワードと同じにものを入力して下さい")
      end
      it 'family_nameが空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字を入力してください")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end
      it 'family_nameが半角では登録できない' do
        @user.family_name = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字は全角で入力して下さい")
      end
      it 'family_name_kanaが空では登録できない' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字かなを入力してください")
      end
      it 'first_nameは半角では登録できない' do
        @user.first_name = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前は全角で入力して下さい")
      end
      it 'family_name_kanaがカナ以外では登録できない' do
        @user.family_name_kana = 'kana'
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字かなは全角で入力して下さい")
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前かなを入力してください")
      end
      it 'first_name_kanaがカナ以外では登録できない' do
        @user.first_name_kana = 'kanna'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前かなは全角で入力して下さい")
      end
      it 'birth_dateが空では登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("誕生日を入力してください")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'パスワードが半角数字のみでは登録できない' do
        @user.password = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmationとパスワードの入力が一致しません", "パスワードと同じにものを入力して下さい")
      end
      it 'パスワードが半角英字のみでは登録できない' do
        @user.password = 'aaaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmationとパスワードの入力が一致しません", "パスワードと同じにものを入力して下さい")
      end
      it 'パスワードが全角では登録できない' do
        @user.password = '11111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmationとパスワードの入力が一致しません", "パスワードと同じにものを入力して下さい")
      end
    end
  end
end
