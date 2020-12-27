class PurchaserDestniation
  include ActiveModel::Model
  attr_accessor :user, :item, :post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :purchaser 

  with_options presence: true do
    validates :city, :address, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters." }
    validates :phone_number, format: { with: /\A[a-z0-9]+\z/i, message: "is invalid. Input half-width characters." }
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :price, numericality: { only_integer: true, message: "is invalid. Input half-width characters." }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  end
  
  def save
    purchaser = Purchaser.create(item_id: item_id, user_id: user_id)
    Destniation.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name,phone_number: phone_number,purchaser_id: purchaser.id)
  end
end