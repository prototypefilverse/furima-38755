require 'rails_helper'

RSpec.describe OrderPayment, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_payment = FactoryBot.build(:order_payment, user_id: @user.id, item_id: @item.id)
    sleep(0.1)
  end

  describe '商品の購入' do
    context '購入できる時' do
      it 'すべての項目が正しく入力されていれば購入できる' do
        expect(@order_payment).to be_valid
      end

      it '建物名が空でも購入できる' do
        @order_payment.building = ''
        expect(@order_payment).to be_valid
      end
    end

    context '購入できない時' do
      it 'user_idがなければ購入できない' do
        @order_payment.user_id = ' '
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("ユーザーを入力してください")
      end

      it 'item_idがなければ購入できない' do
        @order_payment.item_id = ' '
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("商品を入力してください")
      end

      it '郵便番号が空では購入できない' do
        @order_payment.postcode = ''
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("郵便番号を入力してください")
      end

      it '郵便番号が「3桁ハイフン4桁」の半角文字列でないと購入できない' do
        @order_payment.postcode = '1111111'
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include('郵便番号はハイフン入りで正しく入力してください')
      end

      it '都道府県の情報が空だと購入できない' do
        @order_payment.prefecture_id = ' '
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("都道府県を選択してください")
      end

      it '都道府県に「---」が選択されている場合は購入できない' do
        @order_payment.prefecture_id = 0
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("都道府県を選択してください")
      end

      it '市区町村が空だと購入できない' do
        @order_payment.city = ' '
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("市区町村を入力してください")
      end

      it '番地が空だと購入できない' do
        @order_payment.block = ' '
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("番地を入力してください")
      end

      it '電話番号が空だと購入できない' do
        @order_payment.phone_number = ' '
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("電話番号を入力してください")
      end

      it '電話番号は10桁未満では購入できない' do
        @order_payment.phone_number = 111_111_111
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include('電話番号の入力が正しくありません')
      end

      it '電話番号は12桁以上では購入できない' do
        @order_payment.phone_number = 111_111_111_111
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include('電話番号の入力が正しくありません')
      end

      it '電話番号に半角数字以外が含まれている場合は購入できない' do
        @order_payment.phone_number = '111-1111-1111'
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include('電話番号の入力が正しくありません')
      end

      it 'トークンが空だと購入できない' do
        @order_payment.token = ' '
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
    end
  end
end
