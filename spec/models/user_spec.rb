require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる' do 
      expect(@user).to be_valid
    end
  end
  context '新規登録できないとき' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'family_nameが空では登録できない' do
      #@user.family_name = ''
      #@user.valid?
      #expect(@user.errors.full_messages).to include("Family_name can't be blank")
    end
    it 'family_nameは全角でないと登録できない' do
      #@user.valid?
      #expect(@user.errors.full_messages).to include("Family_name is invalid. Input full-width characters")
    end
    it 'first_nameが空では登録できない' do
      #@user.first_name = ''
      #@user.valid?
      #expect(@user.errors.full_messages).to include("First_name can't be blank")
    end
    it 'first_nameは全角でないと登録できない' do
      #@user.valid?
      #expect(@user.errors.full_messages).to include("First_name is invalid. Input full-width characters")
    end
    it 'family_name_kanaが空では登録できない' do
      #@user.family_name_kana = ''
      #@user.valid?
      #expect(@user.errors.full_messages).to include("Family_name_kana can't be blank")
    end
    it 'family_name_kanaがカナ以外では登録できない' do
      #@user.valid?
      #expect(@user.errors.full_messages).to include("Family_name_kana is invalid. Input full-width katakana characters")
    end
    it 'first_name_kanaが空では登録できない' do
      #@user.first_name_kana = ''
      #@user.valid?
      #expect(@user.errors.full_messages).to include("First_name_kana can't be blank")
    end
    it 'first_name_kanaがカナ以外では登録できない' do
      #@user.valid?
      #expect(@user.errors.full_messages).to include("First_name_kana is invalid. Input full-width katakana characters")
    end
    it 'birth_dateが空では登録できない' do
      #@user.birth_date = ''
      #@user.valid?
      #expect(@user.errors.full_messages).to include("birth_date can't be blank")
    end
    it '重複したemailが存在する場合は登録できない' do
      #@user.save
      #another_user = FactoryBot.build(:user)
      #another_user.email = @user.email
      #another_user.valid?
      #expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'emailは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
  end
  end
end
