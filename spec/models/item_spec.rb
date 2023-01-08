require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.create(:item)
    sleep(0.1)
  end

  describe '商品の出品' do

    context '出品できるとき' do

      it '全ての項目が正しく入力されていれば出品できる' do
        expect(@item).to be_valid
      end

    end

    context '出品できないとき' do

      it '商品画像を1枚つけないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
 
      it '商品名が空では出品できない' do
        @item.name = " "
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品の説明が空では出品できない' do
        @item.description = " "
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'カテゴリーの情報が空だと出品できない' do
        @item.category_id = " "
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '商品の状態の情報が空だと出品できない' do
        @item.status_id = " "
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end

      it '配送料の負担の情報が空だと出品できない' do
        @item.shipping_cost_id = " "
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost can't be blank")
      end

      it '発送元の地域の情報が空だと出品できない' do
        @item.prefecture_id = " "
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '発送までの日数の情報が空だと出品できない' do
        @item.shipping_day_id = " "
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end

      it '価格の情報が空だと出品できない' do
        @item.price = " "
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end


    end

  end

end
