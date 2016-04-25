class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :fname
      t.string :lname
      t.string :phone
      t.string :email
      t.time :ptime
      t.datetime :pdate

      t.timestamps null: false
    end
  end
end
