class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|
      t.string :post_code,            null: false
      t.string :city,                 null: false
      t.string :house_number,         null: false
      t.string :building_name        
      t.string :phone_number,         null: false
      t.integer :trading_status_id,   null: false
      t.references :purchase_history, null: false, foreign_key: true
      t.timestamps
    end
  end
end
