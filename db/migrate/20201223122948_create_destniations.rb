class CreateDestniations < ActiveRecord::Migration[6.0]
  def change
    create_table :destniations do |t|

      t.timestamps
    end
  end
end
