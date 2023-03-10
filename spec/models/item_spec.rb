require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    sleep(0.1)
  end

  describe '商品の出品' do
    context '出品できるとき' do
      it '全ての項目が正しく入力されていれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '出品できないとき' do
      it 'userが紐づいていないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('ユーザーを入力してください')
      end

      it '商品画像を1枚つけないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end

      it '商品名が空では出品できない' do
        @item.name = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end

      it '商品の説明が空では出品できない' do
        @item.description = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end

      it 'カテゴリーの情報が空だと出品できない' do
        @item.category_id = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを選択してください")
      end

      it 'カテゴリーに「---」が選択されている場合は出品できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを選択してください")
      end

      it '商品の状態の情報が空だと出品できない' do
        @item.status_id = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を選択してください")
      end

      it '商品の状態に「---」が選択されている場合は出品できない' do
        @item.status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を選択してください")
      end

      it '配送料の負担の情報が空だと出品できない' do
        @item.shipping_cost_id = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を選択してください")
      end

      it '配送料の負担に「---」が選択されている場合は出品できない' do
        @item.shipping_cost_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を選択してください")
      end

      it '発送元の地域の情報が空だと出品できない' do
        @item.prefecture_id = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を選択してください")
      end

      it '発送元の地域に「---」が選択されている場合は出品できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を選択してください")
      end

      it '発送までの日数の情報が空だと出品できない' do
        @item.shipping_day_id = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を選択してください")
      end

      it '発送までの日数に「---」が選択されている場合は出品できない' do
        @item.shipping_day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を選択してください")
      end

      it '価格の情報が空だと出品できない' do
        @item.price = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格を入力してください")
      end

      it '価価格が300円未満では出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格の値が不正です')
      end

      it '価格が9_999_999円を超えると出品できない' do
        @item.price = 10_000_000
        expect(@item).to_not be_valid
        expect(@item.errors.full_messages).to include('販売価格の値が不正です')
      end

      it '価格に半角数字以外が含まれている場合は出品できない' do
        @item.price = '100a'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格の値が不正です')
      end
    end
  end
end
