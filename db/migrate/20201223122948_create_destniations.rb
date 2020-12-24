class CreateDestniations < ActiveRecord::Migration[6.0]
  def change
    create_table :destniations do |t|
      t.string :post_code,       null: false
      t.integer :prefecture_id,  null: false
      t.string :city,            null: false
      t.string :address,         null: false
      t.string :building_name,   null: false
      t.string :phone_number,    null: false
      t.references :purchaser,   null: false, foreign_key: true
      t.timestamps
    end
  end
end