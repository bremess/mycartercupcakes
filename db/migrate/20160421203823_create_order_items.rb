class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :menu_id
      t.integer :order_id
      t.integer :quantity
      t.text :description
      t.string :upphoto1
      t.string :upphoto2
      t.string :upphoto3

      t.timestamps null: false
    end
  end
end
