class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.timestamps
      t.references :user,                null: false , foreign_key: true
      t.string :name,                    null: false
      t.integer :selling_price,          null: false
      t.text :description,               null: false
      t.integer :category_id,            null: false
      t.integer :product_status_id,      null: false
      t.integer :shopping_charge_id,    null: false
      t.integer :prefecture_id,          null: false
      t.integer :day_id,                null: false
    end
  end
end
