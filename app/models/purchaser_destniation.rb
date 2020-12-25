class PurchaserDestniation
  include ActiveModel::Model
  attr_accessor :user, :item, :post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :purchaser, 

  with_options presence: true do
    validates :name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters." }
    validates :name_reading, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters." }
    validates :nickname, format: { with: /\A[a-z0-9]+\z/i, message: "is invalid. Input half-width characters." }
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :price, numericality: { only_integer: true, message: "is invalid. Input half-width characters." }
  end
  validates :prefecture, numericality: { other_than: 0, message: "can't be blank" }
  validates :price, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 1000000, message: "is out of setting range" }
end

  def save
    purchaser = Purchaser.create(item_id: item_id, user_id: user_id)
    Destniation.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name,phone_number: phone_number,purchaser_id: purchaser.id)
  end
end