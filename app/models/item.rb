class Item < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_status
  belongs_to :shopping_charge
  belongs_to :prefecture
  belongs_to :day

  validates :name, :description, :category_id, :product_status_id, 
  :prefecture_id, :days_id, presence: true
  
  validates :selling_price, presence: true, format: {with: /\A[0-9]+\z/ } 
  validates :selling_price, numericality: { greater_than_or_equal_to: 300 } 
  validates :selling_price, numericality: { less_than_or_equal_to: 9_999_999 } 

  validates :category_id, :product_status_id, :days_id, :prefecture_id,
  numericality: { other_than: 1 } 
  
  

  belongs_to :user
  has_one :purchaser

end
