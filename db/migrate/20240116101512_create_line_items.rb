class CreateLineItems < ActiveRecord::Migration[6.0]
  def change
    create_table :line_items do |t|
      t.integer :quantity
      t.integer :product_id
      t.integer :user_id

      t.timestamps
    end

    add_foreign_key :line_items, :products, column: :product_id
    add_foreign_key :line_items, :users, column: :user_id
    add_index :line_items, %i[product_id user_id], unique: true
  end
end
