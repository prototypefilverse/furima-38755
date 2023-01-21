class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :category
  belongs_to :status
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :shipping_day

  belongs_to :user
  has_one    :order

  has_one_attached :image

  with_options presence: true do
   validates :name
   validates :description
   validates :category_id,      numericality: { other_than: 0, message: "を選択してください" }
   validates :status_id,        numericality: { other_than: 0, message: "を選択してください" }
   validates :shipping_cost_id, numericality: { other_than: 0, message: "を選択してください" }
   validates :prefecture_id,    numericality: { other_than: 0, message: "を選択してください" }
   validates :shipping_day_id,  numericality: { other_than: 0, message: "を選択してください" }
   validates :price,            numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'の値が不正です' }
   validates :image
  end

end
