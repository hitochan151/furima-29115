class Item < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_id
  belongs_to :product_status_id
  belongs_to :shopping_charges_id
  belongs_to :prefecture_id
  belongs_to :days_id

end
