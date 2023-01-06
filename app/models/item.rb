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

  
  validates :name,             presence: true
  validates :description,      presence: true
  validates :category_id,      presence: true
  validates :status_id,        presence: true
  validates :shipping_cost_id, presence: true
  validates :prefecture_id,    presence: true
  validates :shipping_day_id,  presence: true
  validates :price,            presence: true
  validates :image,            presence: true

  validates :category_id,      numericality: { other_than: 0 , message: "can't be blank" } 
  validates :status_id,        numericality: { other_than: 0 , message: "can't be blank" } 
  validates :shipping_cost_id, numericality: { other_than: 0 , message: "can't be blank" } 
  validates :prefecture_id,    numericality: { other_than: 0 , message: "can't be blank" } 
  validates :shipping_day_id,  numericality: { other_than: 0 , message: "can't be blank" } 


end
