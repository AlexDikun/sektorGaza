class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :telephone_number
      t.text :address
      t.integer :user_id

      t.timestamps
    end

    add_foreign_key :orders, :users, column: :user_id
  end
end
