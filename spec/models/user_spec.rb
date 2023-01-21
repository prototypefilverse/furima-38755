require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
    sleep(0.1)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '全ての項目が正しく入力されていれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "ニックネームを入力してください"
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
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

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'aaa000'
        @user.password_confirmation = 'aaa0000'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end

      it 'passwordは6文字以上でなければ登録できない' do
        @user.password = 'aaa00'
        @user.password_confirmation = 'aaa00'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end

      it 'passwordが半角数字だけでは登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードには文字と数字の両方を含めてください')
      end

      it 'passwordが半角英字だけでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードには文字と数字の両方を含めてください')
      end

      it 'passwordが全角文字では登録できない' do
        @user.password = 'ああああああ'
        @user.password_confirmation = 'ああああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードには文字と数字の両方を含めてください')
      end

      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前（名）を入力してください")
      end

      it 'family_nameが空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前（性）を入力してください")
      end

      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前カナ（名）を入力してください")
      end

      it 'family_name_kanaが空では登録できない' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前カナ（性）を入力してください")
      end

      it 'first_nameは全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @user.first_name = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前（名）は不正な値です')
      end

      it 'family_nameは全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @user.family_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前（性）は不正な値です')
      end

      it 'first_name_kanaは全角（カタカナ）でなければ登録できない' do
        @user.first_name_kana = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前カナ（名）は不正な値です')
      end

      it 'family_name_kanaは全角（カタカナ）でなければ登録できない' do
        @user.family_name_kana = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前カナ（性）は不正な値です')
      end

      it 'birth_dayが空では登録できない' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
    end
  end
end
