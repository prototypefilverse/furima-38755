class Item < ApplicationRecord

  validates :user_id,          presence: true
  validates :name,             presence: true
  validates :description,      presence: true
  validates :category_id,      presence: true
  validates :status_id,        presence: true
  validates :shipping_cost_id, presence: true
  validates :prefecture_id,    presence: true
  validates :shipping_day_id,  presence: true
  validates :price,            presence: true
  validates :image,            presence: true

  belongs_to :user
  has_one    :order

  has_one_attached :image

end
