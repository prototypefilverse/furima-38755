class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :category

  belongs_to :user
  has_one    :order

  has_one_attached :image

  
  validates :name,             presence: true
  validates :description,      presence: true
  validates :category_id,      presence: true
  validates :status_id,        presence: true
  validates :shipping_cost_id, presence: true
  validates :prefecture_id,    presence: true
  validates :shipping_day_id,  presence: true
  validates :price,            presence: true
  validates :image,            presence: true


end