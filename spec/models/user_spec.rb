require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it '全項目が存在すれば登録できる' do
      expect(@user).to be_valid
    end
    it 'passwordが半角英数字混合であれば登録できる' do
      @user.password = '000aaa'
      @user.password_confirmation = '000aaa'
      expect(@user).to be_valid
    end
    it 'last_nameが全角であれば登録できる' do
      @user.last_name = '名前'
      expect(@user).to be_valid
    end
    it 'first_nameが全角であれば登録できる' do
      @user.first_name = '名前'
      expect(@user).to be_valid
    end
    it 'last_name_kanaが全角であれば登録できる' do
      @user.last_name_kana = 'ナマエ'
      expect(@user).to be_valid
    end
    it 'first_name_kanaが全角であれば登録できる' do
      @user.first_name_kana = 'ナマエ'
      expect(@user).to be_valid
    end

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
    it 'passwordは半角英数字混合でないと登録できない' do
      @user.password = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
    end
    it 'last_nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'last_nameが全角(漢字・ひらがな・カタカナ)でないと登録できない' do
      @user.last_name = 'kana'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name is invalid. Input full-width characters')
    end
    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'first_nameが半角では登録できない' do
      @user.first_name = 'kana'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid. Input full-width characters')
    end
    it 'last_name_kanaが空では登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it 'last_name_kanaが全角(カタカナ)でないと登録できない' do
      @user.last_name_kana = 'ああああ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana is invalid. Input full-width katakana characters')
    end
    it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'first_name_kanaが全角(カタカナ)でないと登録できない' do
      @user.first_name_kana = 'ああああ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana is invalid. Input full-width katakana characters')
    end
    it 'birthdayが空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
