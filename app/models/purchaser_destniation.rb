class PurchaserDestniation
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :purchaser, :token

  with_options presence: true do
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/}
    validates :phone_number, format: { with: /\A[0-9]+\z/}
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :prefecture_id, numericality: { other_than: 1}
    validates :token, :address, presence: true
  end

  def save
    purchaser = Purchaser.create(item_id: item_id, user_id: user_id)
    Destniation.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name,phone_number: phone_number,purchaser_id: purchaser.id)
  end
end